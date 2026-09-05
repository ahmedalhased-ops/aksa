-- Batch 7: adds AK-24 through AK-27 (all prices confirmed via story photos).
-- Run AFTER uploading Downloads/anne-klein-batch7/*.png
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
  values (v_brand_id, v_category_id, 'ساعة Anne Klein مستطيلة سوداء ذهبي', 'ak-black-rect-gold', 'ساعة نسائية بمينا مستطيلة سوداء وإطار ذهبي كامل، سوار بحلقات مقصوصة. تسليم فوري.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي', 'AK-24', 19.000, 3, v_base || 'ak-24-black-rect-gold-19.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein مستطيلة سوداء ثنائية اللون', 'ak-black-rect-twotone', 'ساعة نسائية بمينا مستطيلة سوداء وسوار ثنائي اللون بحلقات مقصوصة. تسليم فوري.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي', 'AK-25', 23.000, 3, v_base || 'ak-25-black-rect-twotone-23.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein سداسية ثنائية اللون', 'ak-hexagon-twotone-2', 'ساعة نسائية بإطار سداسي الشكل ومينا بيضاء وسوار ثنائي اللون. تسليم فوري.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي', 'AK-26', 26.000, 3, v_base || 'ak-26-hexagon-twotone-26.png');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein ألماس بسيطة', 'ak-diamond-simple', 'ساعة نسائية ذهبي وردي بحجر ألماس أصلي واحد وسوار شبكي. تسليم فوري.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي وردي', 'AK-27', 25.000, 3, v_base || 'ak-27-diamond-simple-25.png');
  end if;

end $$;
