-- Batch 5: adds AK-21 (rectangular mother-of-pearl dial, mesh strap)
-- and AK-22 (faceted gem-cut dial, mesh strap). This completes the
-- full Anne Klein catalog (AK-01 through AK-22).
-- Run AFTER uploading Downloads/anne-klein-crop-final/*.png
-- to the "products" bucket root.

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

end $$;
