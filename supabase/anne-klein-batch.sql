-- Adds 13 Anne Klein watches. All data (price/color) read directly from
-- the original photos — high confidence, no cropping was needed since
-- the source photos were already clean.
-- Run AFTER uploading Downloads/anne-klein-batch/*.{jpg,png} to the
-- "products" bucket root.

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
  values (v_brand_id, v_category_id, 'ساعة Anne Klein عنابي كريستال', 'ak-red-crystal', 'ساعة نسائية بمينا عنابي مربع محاط بالكريستال. تسليم فوري.', 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url)
  values (v_product_id, 'عنابي', 'AK-01', 27.000, 3, v_base || 'ak-01-red-crystal-27.jpg');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein فضي كريستال', 'ak-silver-crystal', 'ساعة نسائية بمينا كريستال دائرية وسوار فضي. تسليم فوري.', 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url)
  values (v_product_id, 'فضي', 'AK-02', 25.000, 3, v_base || 'ak-02-silver-crystal-25.jpg');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein صدفي بيضاوي', 'ak-mop-flower', 'ساعة نسائية بمينا صدفي بيضاوي وسوار بتفاصيل أزهار. تسليم فوري.', 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url)
  values (v_product_id, 'فضي', 'AK-03', 28.000, 3, v_base || 'ak-03-mop-flower-28.jpg');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein ذهبي كريستال', 'ak-gold-crystal', 'ساعة نسائية بمينا كريستال دائرية وسوار ذهبي. تسليم فوري.', 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url)
  values (v_product_id, 'ذهبي', 'AK-04', 29.000, 3, v_base || 'ak-04-gold-crystal-29.png');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein ذهبي بيضاوي', 'ak-gold-oval-mesh', 'ساعة نسائية بمينا بيضاوي بسيط وسوار شبكي. تسليم فوري.', 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url)
  values (v_product_id, 'ذهبي', 'AK-05', 26.000, 3, v_base || 'ak-05-gold-oval-mesh-26.png');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein أسود مربع', 'ak-black-square-gold', 'ساعة نسائية بمينا أسود مربع وسوار ذهبي. تسليم فوري.', 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url)
  values (v_product_id, 'أسود وذهبي', 'AK-06', 19.000, 3, v_base || 'ak-06-black-square-gold-19.jpg');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein أسود ثنائي اللون', 'ak-black-square-twotone', 'ساعة نسائية بمينا أسود مربع وسوار ثنائي اللون. تسليم فوري.', 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url)
  values (v_product_id, 'أسود وفضي وذهبي', 'AK-07', 23.000, 3, v_base || 'ak-07-black-square-twotone-23.jpg');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein سداسي ثنائي اللون', 'ak-hexagon-twotone', 'ساعة نسائية بمينا سداسي أبيض وسوار ثنائي اللون. تسليم فوري.', 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url)
  values (v_product_id, 'فضي وذهبي', 'AK-08', 26.000, 3, v_base || 'ak-08-hexagon-twotone-26.png');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein ذهبي وردي ألماس', 'ak-rosegold-diamond', 'ساعة نسائية ذهبي وردي بلمسة ألماس أصلية وسوار سلسلة. تسليم فوري.', 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url)
  values (v_product_id, 'ذهبي وردي', 'AK-09', 25.000, 3, v_base || 'ak-09-rosegold-diamond-25.png');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein وسادة كريستال', 'ak-cushion-crystal', 'ساعة نسائية ذهبي وردي بمينا كريستال شكل وسادة وسوار شبكي. تسليم فوري.', 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url)
  values (v_product_id, 'ذهبي وردي', 'AK-10', 26.000, 3, v_base || 'ak-10-cushion-crystal-26.jpg');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein مربع بسيط', 'ak-square-plain', 'ساعة نسائية ذهبي وردي بمينا مربع بسيط وسوار معدني. تسليم فوري.', 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url)
  values (v_product_id, 'ذهبي وردي', 'AK-11', 23.000, 3, v_base || 'ak-11-square-plain-23.jpg');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein أزهار وردي', 'ak-pink-floral', 'ساعة نسائية بمينا أزهار صدفي وردي فاتح وسوار سيراميك. تسليم فوري.', 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url)
  values (v_product_id, 'وردي فاتح', 'AK-12', 27.000, 3, v_base || 'ak-12-pink-floral-27.png');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein أزهار تاوبي', 'ak-taupe-floral', 'ساعة نسائية بمينا أزهار صدفي بلون تاوبي وسوار سيراميك. تسليم فوري.', 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url)
  values (v_product_id, 'بني فاتح (تاوبي)', 'AK-13', 27.000, 3, v_base || 'ak-13-taupe-floral-27.jpg');

end $$;
