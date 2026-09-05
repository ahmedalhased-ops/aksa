-- Batch 6 (final): upgrades AK-01, AK-02, AK-04, AK-05, AK-20 with
-- higher-quality studio photos, and adds AK-21, AK-22, AK-23.
-- Run AFTER uploading Downloads/anne-klein-final-upload/*.png
-- to the "products" bucket root.

-- Quality upgrades (existing products, no price change)
update product_variants set
  image_url = 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/ak-01-red-crystal-27-hq.png'
where sku = 'AK-01';

update product_variants set
  image_url = 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/ak-02-silver-crystal-25-hq.png'
where sku = 'AK-02';

update product_variants set
  image_url = 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/ak-04-gold-crystal-29-hq.png'
where sku = 'AK-04';

update product_variants set
  image_url = 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/ak-05-gold-oval-mesh-26-hq.png'
where sku = 'AK-05';

update product_variants set
  image_url = 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/ak-20-silver-flower-bracelet-28-hq.png'
where sku = 'AK-20';

-- New products: AK-21, AK-22, AK-23
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
  values (v_brand_id, v_category_id, 'ساعة Anne Klein مستطيلة صدفية', 'ak-rect-mop', 'ساعة نسائية بمينا مستطيلة صدفية وردية فاتحة وسوار ذهبي وردي. تسليم فوري.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'وردي فاتح', 'AK-21', 23.000, 3, v_base || 'ak-21-rect-mop-23.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein مينا مقصوصة', 'ak-faceted-gem', 'ساعة نسائية ذهبي وردي بمينا مقصوصة على شكل جوهرة وسوار شبكي لامع. تسليم فوري.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي وردي', 'AK-22', 26.000, 3, v_base || 'ak-22-faceted-gem-26.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein أزهار تاوبي', 'ak-taupe-floral-crystal', 'ساعة نسائية بمينا أزهار بلون تاوبي غامق محاطة بالكريستال وسوار سيراميك. تسليم فوري.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'تاوبي غامق', 'AK-23', 27.000, 3, v_base || 'ak-23-taupe-floral-27.png');
  end if;

end $$;
