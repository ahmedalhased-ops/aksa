-- =====================================================================
-- AKSA STORE — DATABASE SCHEMA
-- Run this once in the Supabase SQL editor (Project → SQL Editor → New query)
-- Safe to re-run: uses IF NOT EXISTS / CREATE OR REPLACE everywhere.
-- =====================================================================

create extension if not exists "pgcrypto";

-- ---------------------------------------------------------------------
-- BRANDS
-- ---------------------------------------------------------------------
create table if not exists brands (
  id uuid primary key default gen_random_uuid(),
  name text not null unique,
  slug text not null unique,
  created_at timestamptz not null default now()
);

-- ---------------------------------------------------------------------
-- CATEGORIES  (watches, bags, shoes, accessories, ...)
-- ---------------------------------------------------------------------
create table if not exists categories (
  id uuid primary key default gen_random_uuid(),
  name text not null unique,
  slug text not null unique,
  created_at timestamptz not null default now()
);

-- ---------------------------------------------------------------------
-- PRODUCTS  (one row per "model" — e.g. "Kensington Bag")
-- ---------------------------------------------------------------------
create table if not exists products (
  id uuid primary key default gen_random_uuid(),
  brand_id uuid not null references brands(id) on delete restrict,
  category_id uuid not null references categories(id) on delete restrict,
  name text not null,
  slug text not null unique,
  description text not null default '',
  gender text not null default 'unisex' check (gender in ('men', 'women', 'unisex')),
  is_published boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists products_brand_idx on products(brand_id);
create index if not exists products_category_idx on products(category_id);
create index if not exists products_published_idx on products(is_published);

-- ---------------------------------------------------------------------
-- PRODUCT VARIANTS  (one row per color/size — this is what carries
-- price, stock and its own image, per the "stock per variant" requirement)
-- ---------------------------------------------------------------------
create table if not exists product_variants (
  id uuid primary key default gen_random_uuid(),
  product_id uuid not null references products(id) on delete cascade,
  color text not null,
  sku text not null unique,
  price numeric(10, 3) not null check (price >= 0),
  stock integer not null default 0 check (stock >= 0),
  low_stock_threshold integer not null default 3,
  image_url text,
  is_available boolean not null default true,
  created_at timestamptz not null default now(),
  unique (product_id, color)
);

create index if not exists variants_product_idx on product_variants(product_id);

-- ---------------------------------------------------------------------
-- PRODUCT IMAGES  (extra gallery images per product, beyond each
-- variant's own primary image)
-- ---------------------------------------------------------------------
create table if not exists product_images (
  id uuid primary key default gen_random_uuid(),
  product_id uuid not null references products(id) on delete cascade,
  variant_id uuid references product_variants(id) on delete cascade,
  url text not null,
  sort_order integer not null default 0
);

create index if not exists images_product_idx on product_images(product_id);

-- ---------------------------------------------------------------------
-- ORDERS  (created at checkout; no online payment — matches the
-- existing "confirm on WhatsApp / cash or transfer on delivery" flow)
-- ---------------------------------------------------------------------
create table if not exists orders (
  id uuid primary key default gen_random_uuid(),
  customer_name text not null,
  customer_phone text not null,
  customer_state text not null default '',
  customer_village text not null default '',
  customer_note text,
  status text not null default 'pending'
    check (status in ('pending', 'confirmed', 'delivered', 'cancelled')),
  total numeric(10, 3) not null default 0,
  created_at timestamptz not null default now()
);

create table if not exists order_items (
  id uuid primary key default gen_random_uuid(),
  order_id uuid not null references orders(id) on delete cascade,
  variant_id uuid not null references product_variants(id) on delete restrict,
  product_name text not null,
  color text not null,
  unit_price numeric(10, 3) not null,
  quantity integer not null check (quantity > 0)
);

create index if not exists order_items_order_idx on order_items(order_id);

-- =====================================================================
-- STOCK-SAFE CHECKOUT
-- One transactional function that: validates every line still has
-- enough stock, decrements it, and writes the order — all atomically,
-- so two customers can never oversell the same last unit.
-- =====================================================================
create or replace function place_order(
  p_customer_name text,
  p_customer_phone text,
  p_customer_note text,
  p_items jsonb, -- [{ "variant_id": "...", "quantity": 2 }, ...]
  p_customer_state text default '',
  p_customer_village text default ''
)
returns uuid
language plpgsql
security definer
set search_path = public
as $$
declare
  v_order_id uuid;
  v_item jsonb;
  v_variant record;
  v_total numeric(10, 3) := 0;
begin
  if jsonb_array_length(p_items) = 0 then
    raise exception 'Order has no items';
  end if;

  -- Lock every affected variant row first, in a stable order, to avoid deadlocks.
  perform 1
  from product_variants
  where id in (select (elem->>'variant_id')::uuid from jsonb_array_elements(p_items) elem)
  order by id
  for update;

  insert into orders (customer_name, customer_phone, customer_state, customer_village, customer_note, total)
  values (p_customer_name, p_customer_phone, p_customer_state, p_customer_village, p_customer_note, 0)
  returning id into v_order_id;

  for v_item in select * from jsonb_array_elements(p_items)
  loop
    select * into v_variant
    from product_variants
    where id = (v_item->>'variant_id')::uuid;

    if v_variant is null then
      raise exception 'Variant % not found', (v_item->>'variant_id');
    end if;

    if v_variant.stock < (v_item->>'quantity')::integer then
      raise exception 'Not enough stock for %/% — only % left',
        v_variant.sku, v_variant.color, v_variant.stock;
    end if;

    update product_variants
    set
      stock = stock - (v_item->>'quantity')::integer,
      is_available = (stock - (v_item->>'quantity')::integer) > 0
    where id = v_variant.id;

    insert into order_items (order_id, variant_id, product_name, color, unit_price, quantity)
    select
      v_order_id,
      v_variant.id,
      p.name,
      v_variant.color,
      v_variant.price,
      (v_item->>'quantity')::integer
    from products p
    where p.id = v_variant.product_id;

    v_total := v_total + v_variant.price * (v_item->>'quantity')::integer;
  end loop;

  update orders set total = v_total where id = v_order_id;

  return v_order_id;
end;
$$;

-- =====================================================================
-- ROW LEVEL SECURITY
-- Public (anon) visitors: read-only on published catalog data, and may
-- INSERT orders only through place_order() (security definer), never
-- directly. Admins (authenticated Supabase users) get full read/write.
-- =====================================================================
alter table brands enable row level security;
alter table categories enable row level security;
alter table products enable row level security;
alter table product_variants enable row level security;
alter table product_images enable row level security;
alter table orders enable row level security;
alter table order_items enable row level security;

-- Public read of catalog data
drop policy if exists "public read brands" on brands;
create policy "public read brands" on brands for select using (true);

drop policy if exists "public read categories" on categories;
create policy "public read categories" on categories for select using (true);

drop policy if exists "public read published products" on products;
create policy "public read published products" on products
  for select using (is_published = true);

drop policy if exists "public read variants of published products" on product_variants;
create policy "public read variants of published products" on product_variants
  for select using (
    exists (select 1 from products p where p.id = product_id and p.is_published = true)
  );

drop policy if exists "public read images" on product_images;
create policy "public read images" on product_images for select using (true);

-- Admin (any authenticated user) full access — tighten later with a
-- dedicated `admins` table + role check if you add non-admin logins.
drop policy if exists "admin full access brands" on brands;
create policy "admin full access brands" on brands for all
  using (auth.role() = 'authenticated') with check (auth.role() = 'authenticated');

drop policy if exists "admin full access categories" on categories;
create policy "admin full access categories" on categories for all
  using (auth.role() = 'authenticated') with check (auth.role() = 'authenticated');

drop policy if exists "admin full access products" on products;
create policy "admin full access products" on products for all
  using (auth.role() = 'authenticated') with check (auth.role() = 'authenticated');

drop policy if exists "admin full access variants" on product_variants;
create policy "admin full access variants" on product_variants for all
  using (auth.role() = 'authenticated') with check (auth.role() = 'authenticated');

drop policy if exists "admin full access images" on product_images;
create policy "admin full access images" on product_images for all
  using (auth.role() = 'authenticated') with check (auth.role() = 'authenticated');

drop policy if exists "admin read orders" on orders;
create policy "admin read orders" on orders for select
  using (auth.role() = 'authenticated');

drop policy if exists "admin update orders" on orders;
create policy "admin update orders" on orders for update
  using (auth.role() = 'authenticated') with check (auth.role() = 'authenticated');

drop policy if exists "admin read order items" on order_items;
create policy "admin read order items" on order_items for select
  using (auth.role() = 'authenticated');

-- NOTE: there is intentionally NO public insert/update/delete policy on
-- orders, order_items, or product_variants.stock — the only way a
-- customer can create an order or touch stock is via place_order(),
-- which runs as `security definer` and is exposed through the
-- app's /api/checkout route (service-role key, server-side only).
