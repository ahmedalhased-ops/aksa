-- Tory Burch bags — batch 4: the 2 designs from the original 6-file UUID
-- folder that are NOT covered by batch1 or the updated batch2 (the
-- black plain tote from that same folder is identical to batch2's TB-16,
-- so it is not repeated here).
-- Run AFTER uploading these 2 files (original UUID filenames) from
-- "توري بورش بعد تحسين 6" (the earlier 6-file version) to the
-- "products" bucket root.

do $$
declare
  v_brand_id uuid;
  v_category_id uuid;
  v_base text := 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/';
  v_product_id uuid;
begin
  select id into v_brand_id from brands where slug = 'tory-burch';
  select id into v_category_id from categories where slug = 'bags';

  -- TB-21: half-moon flap crossbody, black
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Tory Burch هلالية أسود', 'tb-halfmoon-black', 'شنطة نسائية سوداء بشكل هلالي ومقبض علوي وسير كتف. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'TB-21', 98.000, 3, v_base || '2d70c8c4-71a6-4ccb-9e8d-1245a38ca63f.png');
  end if;

  -- TB-22: hobo shoulder bag with double thin strap, black
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Tory Burch هوبو أسود مطاط', 'tb-hobo-black-thinstrap', 'شنطة نسائية سوداء بحمالة كتف رفيعة مزدوجة. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'TB-22', 99.000, 3, v_base || '49959eb8-1820-4c50-b030-ac54fb248c7d.png');
  end if;

end $$;
