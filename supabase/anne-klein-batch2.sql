-- Batch 2: fixes AK-09's broken image+price, and adds 5 new Anne Klein designs.
-- Run AFTER uploading Downloads/anne-klein-upload-batch2/*.jpg to the
-- "products" bucket root.

-- 1) Fix AK-09: correct clean image + correct price (23, not 25)
update product_variants
set
  price = 23.000,
  image_url = 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/ak-09-rosegold-diamond-23.jpg'
where sku = 'AK-09';

-- 2) New products
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
  values (v_brand_id, v_category_id, 'ساعة Anne Klein كريستال مرصّع', 'ak-pave-crystal', 'ساعة نسائية ذهبي وردي بمينا مرصّعة بالكامل بالكريستال وأرقام رومانية. تسليم فوري.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي وردي', 'AK-14', 27.000, 3, v_base || 'ak-14-pave-crystal-27.jpg');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein إطار مضلّع', 'ak-cushion-plain', 'ساعة نسائية ذهبي وردي بإطار مضلّع ومينا بسيطة. تسليم فوري.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي وردي', 'AK-15', 23.000, 3, v_base || 'ak-15-cushion-plain-23.jpg');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein سيراميك نود', 'ak-nude-ceramic', 'ساعة نسائية بسوار سيراميك نود ومينا ذهبي وردي. تسليم فوري.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'نود', 'AK-16', 22.000, 3, v_base || 'ak-16-nude-ceramic-22.jpg');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein سيراميك أبيض', 'ak-white-ceramic', 'ساعة نسائية بسوار سيراميك أبيض وإطار ذهبي. تسليم فوري.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أبيض وذهبي', 'AK-17', 22.000, 3, v_base || 'ak-17-white-ceramic-22.jpg');
  end if;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein أسود غليتر', 'ak-black-glitter', 'ساعة نسائية بمينا أسود لامع (غليتر) وإطار ذهبي. تسليم فوري.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود وذهبي', 'AK-18', 21.000, 3, v_base || 'ak-18-black-glitter-21.jpg');
  end if;

end $$;
