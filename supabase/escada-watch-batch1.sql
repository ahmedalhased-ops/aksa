-- ESCADA watches — 3 products. Brand name on the dial reads "ESCADA"
-- (the source folder was misspelled "SKADA"). Prices read directly
-- from filenames (as instructed — no renaming).
-- Run AFTER uploading the 3 original files from "SKADA"
-- to the "products" bucket root (original filenames, unchanged).

insert into brands (name, slug) values ('Escada', 'escada')
on conflict (slug) do nothing;

do $$
declare
  v_brand_id uuid;
  v_category_id uuid;
  v_base text := 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/';
  v_product_id uuid;
begin
  select id into v_brand_id from brands where slug = 'escada';
  select id into v_category_id from categories where slug = 'watches';

  -- ESC-01: round silver case, MOP dial, black leather strap, 45
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Escada فضية بحزام أسود', 'escada-silver-black-strap', 'ساعة نسائية فضية بمينا صدفي وحزام جلد أسود. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي', 'ESC-01', 45.000, 3, v_base || 'WATCH_01%20%2845OR%29.jpg');
  end if;

  -- ESC-02: round gold case, MOP dial, burgundy leather strap, 45
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Escada ذهبية بحزام عنابي', 'escada-gold-burgundy-strap', 'ساعة نسائية ذهبية بمينا صدفي وحزام جلد عنابي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي', 'ESC-02', 45.000, 3, v_base || 'WATCH_02%20%2845OR%29.jpg');
  end if;

  -- ESC-03: marquise gold case, MOP dial, black leather strap, 45
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Escada ماركيز ذهبية', 'escada-marquise-gold', 'ساعة نسائية ذهبية بشكل ماركيز (بيضاوي مدبب) ومينا صدفي وحزام جلد أسود. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي', 'ESC-03', 45.000, 3, v_base || 'WATCH_03%20%2845OR%29.jpg');
  end if;

end $$;
