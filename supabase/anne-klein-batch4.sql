-- Batch 4: adds AK-19 (oval two-tone mesh, gold case + silver mesh band)
-- and AK-20 (silver oval + double-chain crystal flower bracelet).
-- Run AFTER uploading Downloads/anne-klein-upload-batch4/*.jpg
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
  values (v_brand_id, v_category_id, 'ساعة Anne Klein بيضاوي ثنائي اللون', 'ak-oval-twotone', 'ساعة نسائية بمينا بيضاوي ذهبي وسوار شبكي فضي. تسليم فوري.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي وفضي', 'AK-19', 26.000, 3, v_base || 'ak-19-oval-twotone-26.jpg');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein بيضاوي فضي وسوار ورود', 'ak-silver-flower-bracelet', 'ساعة نسائية بيضاوية فضية محاطة بالكريستال، مع سوار مزدوج بأشكال ورود من الكريستال. تسليم فوري.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي', 'AK-20', 28.000, 3, v_base || 'ak-20-silver-flower-bracelet-28.jpg');
  end if;

end $$;
