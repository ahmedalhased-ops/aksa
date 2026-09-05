do $$
declare
  v_brand_id uuid;
  v_category_id uuid;
  v_base text := 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/';
  v_product_id uuid;
begin
  select id into v_brand_id from brands where slug = 'anne-klein';
  select id into v_category_id from categories where slug = 'watches';

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 1', 'ak-codex-01', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-01', 23.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2006_39_56%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 2', 'ak-codex-02', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-02', 22.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2006_40_24%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 3', 'ak-codex-03', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-03', 18.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2006_40_30%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 4', 'ak-codex-04', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-04', 23.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2006_40_36%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 5', 'ak-codex-05', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-05', 23.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2006_40_56%20PM.jpg');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 6', 'ak-codex-06', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-06', 22.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2006_49_30%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 7', 'ak-codex-07', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-07', 22.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2006_49_38%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 8', 'ak-codex-08', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-08', 24.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2006_49_44%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 9', 'ak-codex-09', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-09', 23.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2006_49_50%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 10', 'ak-codex-10', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-10', 19.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2006_50_24%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 11', 'ak-codex-11', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-11', 22.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2006_52_18%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 12', 'ak-codex-12', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-12', 19.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2006_52_26%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 13', 'ak-codex-13', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-13', 27.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2006_52_32%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 14', 'ak-codex-14', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-14', 23.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2006_52_39%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 15', 'ak-codex-15', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-15', 22.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2006_52_46%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 16', 'ak-codex-16', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-16', 27.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2006_52_57%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 17', 'ak-codex-17', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-17', 23.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_09_06%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 18', 'ak-codex-18', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-18', 25.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_09_38%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 19', 'ak-codex-19', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-19', 23.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_09_43%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 20', 'ak-codex-20', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-20', 22.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_09_50%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 21', 'ak-codex-21', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-21', 23.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_10_15%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 22', 'ak-codex-22', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-22', 17.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_10_22%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 23', 'ak-codex-23', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-23', 22.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_10_27%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 24', 'ak-codex-24', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-24', 23.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_10_37%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 25', 'ak-codex-25', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-25', 32.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_10_48%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 26', 'ak-codex-26', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-26', 23.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_10_53%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 27', 'ak-codex-27', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-27', 23.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_11_02%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 28', 'ak-codex-28', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-28', 22.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_11_12%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 29', 'ak-codex-29', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-29', 19.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_11_16%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 30', 'ak-codex-30', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-30', 19.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_11_27%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 31', 'ak-codex-31', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-31', 32.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_11_32%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 32', 'ak-codex-32', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-32', 23.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_11_39%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 33', 'ak-codex-33', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-33', 22.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_11_46%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 34', 'ak-codex-34', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-34', 23.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_11_53%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 35', 'ak-codex-35', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-35', 22.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_11_58%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 36', 'ak-codex-36', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-36', 23.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_12_07%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 37', 'ak-codex-37', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-37', 19.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_28_52%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 38', 'ak-codex-38', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-38', 17.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_29_23%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 39', 'ak-codex-39', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-39', 22.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_29_29%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 40', 'ak-codex-40', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-40', 22.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_29_37%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 41', 'ak-codex-41', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-41', 22.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_29_46%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 42', 'ak-codex-42', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-42', 17.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_29_53%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 43', 'ak-codex-43', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-43', 22.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_29_59%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 44', 'ak-codex-44', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-44', 19.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_30_06%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 45', 'ak-codex-45', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-45', 23.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_30_12%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 46', 'ak-codex-46', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-46', 19.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_30_18%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 47', 'ak-codex-47', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-47', 32.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_30_24%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 48', 'ak-codex-48', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-48', 23.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_30_31%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 49', 'ak-codex-49', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-49', 22.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_30_38%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 50', 'ak-codex-50', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-50', 19.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_30_45%20PM.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein رقم 51', 'ak-codex-51', 'ساعة نسائية من مجموعة Anne Klein. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كما بالصورة', 'AKX-51', .000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2007_30_53%20PM.png');
  end if;

end $$;
