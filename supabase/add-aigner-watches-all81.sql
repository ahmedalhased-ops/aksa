-- Adds all 81 Aigner watches from the ChatGPT-cleaned photo batch as
-- individual products. Names/colors/prices are GENERIC placeholders (no
-- data table was available) — edit any of them from /admin whenever you
-- know the real name/color/price; the image stays linked either way.
-- Run AFTER uploading all 81 files from Downloads/aigner-all81 to the
-- "products" bucket root (filenames: aigner-full-01.png ... aigner-full-81.png).

do $$
declare
  v_brand_id uuid;
  v_category_id uuid;
  v_base text := 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/';
  v_product_id uuid;
  i int;
  n text;
begin
  select id into v_brand_id from brands where slug = 'aigner';
  select id into v_category_id from categories where slug = 'watches';

  for i in 1..81 loop
    n := lpad(i::text, 2, '0');

    insert into products (brand_id, category_id, name, slug, description, gender)
    values (
      v_brand_id, v_category_id,
      'ساعة أجنر - تصميم ' || n,
      'aigner-full-' || n,
      'تسليم فوري، مع كامل ملحقات الماركة. (بيانات اللون والسعر مبدئية، يرجى المراجعة والتعديل من لوحة التحكم)',
      'unisex'
    )
    on conflict (slug) do nothing
    returning id into v_product_id;

    -- on conflict, v_product_id stays null; skip adding a variant then
    if v_product_id is not null then
      insert into product_variants (product_id, color, sku, price, stock, image_url)
      values (v_product_id, 'راجع اللون', 'AIGFULL-' || n, 149.000, 3, v_base || 'aigner-full-' || n || '.png');
    end if;

    v_product_id := null;
  end loop;
end $$;
