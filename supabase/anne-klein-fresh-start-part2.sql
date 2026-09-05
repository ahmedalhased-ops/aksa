-- Part 2 of the fresh Anne Klein rebuild: adds AK-15 through AK-21.
-- Run AFTER anne-klein-fresh-start.sql, and after uploading
-- Downloads/anne-klein-fresh-start/ak-15..ak-21 files to the "products" bucket root.

do $$
declare
  v_brand_id uuid;
  v_category_id uuid;
  v_base text := 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/';
  v_product_id uuid;
begin
  select id into v_brand_id from brands where slug = 'anne-klein';
  select id into v_category_id from categories where slug = 'watches';

  -- AK-15: rose-gold DIAMOND dial, link bracelet
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein ألماس بسوار حلقات', 'ak-diamond-link', 'ساعة نسائية ذهبي وردي بحجر ألماس أصلي واحد وسوار حلقات. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي وردي', 'AK-15', 23.000, 3, v_base || 'ak-15-diamond-link-23.png');
  end if;

  -- AK-16: pave crystal roman numerals, bangle band
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein كريستال بانغل', 'ak-crystal-bangle', 'ساعة نسائية ذهبي وردي بمينا كريستال مرصّعة وأرقام رومانية وسوار بانغل. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي وردي', 'AK-16', 27.000, 3, v_base || 'ak-16-crystal-bangle-27.png');
  end if;

  -- AK-17: cushion bezel plain dial, gold link bracelet
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein إطار مضلّع', 'ak-cushion-gold-link', 'ساعة نسائية ذهبي وردي بإطار مضلّع ومينا بسيطة وسوار حلقات. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي وردي', 'AK-17', 23.000, 3, v_base || 'ak-17-cushion-gold-link-23.png');
  end if;

  -- AK-18: taupe plain dial, roman numerals, ceramic+gold bracelet
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein تاوبي كلاسيك', 'ak-taupe-plain-roman', 'ساعة نسائية بمينا تاوبي سادة وأرقام رومانية وسوار سيراميك تاوبي وذهبي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'تاوبي', 'AK-18', 27.000, 3, v_base || 'ak-18-taupe-plain-roman-27.png');
  end if;

  -- AK-19: nude ceramic bracelet
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein سيراميك نود', 'ak-nude-ceramic', 'ساعة نسائية بسوار سيراميك نود ومينا ذهبي وردي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'نود', 'AK-19', 22.000, 3, v_base || 'ak-19-nude-ceramic-22.jpg');
  end if;

  -- AK-20: white ceramic bracelet
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein سيراميك أبيض', 'ak-white-ceramic', 'ساعة نسائية بسوار سيراميك أبيض وإطار ذهبي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أبيض وذهبي', 'AK-20', 22.000, 3, v_base || 'ak-20-white-ceramic-22.jpg');
  end if;

  -- AK-21: black glitter dial, leather strap
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein أسود غليتر', 'ak-black-glitter', 'ساعة نسائية بمينا أسود لامع (غليتر) وحزام أسود وإطار ذهبي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود وذهبي', 'AK-21', 21.000, 3, v_base || 'ak-21-black-glitter-21.jpg');
  end if;

end $$;
