-- JW PEI bags — batch 2, 18 products.
-- Prices read directly from the original filenames (as instructed —
-- no renaming). Designs identified from each photo.
-- Run AFTER uploading the 18 original files from "JW PEI 6"
-- to the "products" bucket root (original filenames, unchanged).

do $$
declare
  v_brand_id uuid;
  v_category_id uuid;
  v_base text := 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/';
  v_product_id uuid;
begin
  select id into v_brand_id from brands where slug = 'jw-pei';
  select id into v_category_id from categories where slug = 'bags';

  -- JW-21: vanity case, dark green croc, 49
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI فانيتي كروكو أخضر', 'jw-vanity-croc-green', 'شنطة نسائية خضراء غامقة بنقشة كروكو ومقبض علوي وسحّاب ذهبي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أخضر غامق', 'JW-21', 49.000, 3, v_base || 'JW%2049%20OR%20%2812.png');
  end if;

  -- JW-22: saddle-shape crossbody flap, brown, 49
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI سادل بني', 'jw-saddle-brown', 'شنطة نسائية بنية بشكل سرج وحمالة كتف طويلة. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'بني', 'JW-22', 49.000, 3, v_base || 'JW%2049%20OR%20%282.png');
  end if;

  -- JW-23: Kelly-style, burgundy, 49
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI كيلي عنابي فاتح', 'jw-kelly-burgundy-light', 'شنطة نسائية عنابية بمقبض علوي وقفل ذهبي على طراز كيلي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'عنابي', 'JW-23', 49.000, 3, v_base || 'JW%2049%20OR%20%2822%29.png');
  end if;

  -- JW-24: Kelly-style, off-white, 49
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI كيلي أبيض', 'jw-kelly-offwhite', 'شنطة نسائية بيضاء بمقبض علوي وقفل ذهبي على طراز كيلي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أبيض', 'JW-24', 49.000, 3, v_base || 'JW%2049%20OR%20%284.png');
  end if;

  -- JW-25: vanity case, dark brown suede, 53
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI فانيتي سويدي بني', 'jw-vanity-suede-brown', 'شنطة نسائية سويدية بنية غامقة بشكل صندوق ومقبض علوي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'بني غامق', 'JW-25', 53.000, 3, v_base || 'JW%2053%20OR%20%2813.png');
  end if;

  -- JW-26: Kelly-style, dark chocolate, 55
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI كيلي شوكولاته', 'jw-kelly-chocolate', 'شنطة نسائية بنية غامقة بمقبض علوي وقفل ذهبي على طراز كيلي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'بني غامق', 'JW-26', 55.000, 3, v_base || 'JW%2055%20OR%20%283.png');
  end if;

  -- JW-27: vanity case, cream canvas + brown leather, 55
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI فانيتي قماش كريمي', 'jw-vanity-canvas-cream', 'شنطة نسائية قماشية كريمية بتفاصيل جلدية بنية ومقبض علوي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كريمي وبني', 'JW-27', 55.000, 3, v_base || 'JW%2055%20OR%20%286.png');
  end if;

  -- JW-28: Kelly-style clutch with fold strap, brown, 55
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI كيلي كلاتش بني', 'jw-kelly-clutch-brown', 'شنطة نسائية بنية مسطحة بمقبض علوي وسير قابل للطي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'بني', 'JW-28', 55.000, 3, v_base || 'JW%2055%20OR%20%289.png');
  end if;

  -- JW-29: crescent hobo, burgundy/plum, 55
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI هلال عنابي غامق', 'jw-crescent-plum', 'شنطة نسائية عنابية غامقة بشكل هلالي وحمالة كتف. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'عنابي غامق', 'JW-29', 55.000, 3, v_base || 'JW%2055%20OR%2018.png');
  end if;

  -- JW-30: Kelly-style, dark red, 55
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI كيلي أحمر غامق', 'jw-kelly-red', 'شنطة نسائية حمراء غامقة بمقبض علوي وقفل ذهبي على طراز كيلي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أحمر غامق', 'JW-30', 55.000, 3, v_base || 'JW%2055OR%20%287.png');
  end if;

  -- JW-31: tote-basket, black, two handles, 59
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI سلة أسود', 'jw-basket-black', 'شنطة نسائية سوداء بمقبضين علويين وتصميم سلة. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'JW-31', 59.000, 3, v_base || 'JW%2059%20OR%20%28%2011.png');
  end if;

  -- JW-32: Kelly-style, black, silver hardware, 59
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI كيلي أسود فضي', 'jw-kelly-black-silver', 'شنطة نسائية سوداء بمقبض علوي وقفل فضي على طراز كيلي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'JW-32', 59.000, 3, v_base || 'JW%2059%20OR%20%28%208.png');
  end if;

  -- JW-33: woven Kelly clutch, tan/beige, 59
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI كيلي منسوجة بيج', 'jw-kelly-woven-beige', 'شنطة نسائية بيج منسوجة يدويًا بمقبض علوي وقفل ذهبي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'بيج', 'JW-33', 59.000, 3, v_base || 'JW%2059%20OR%20%2814.png');
  end if;

  -- JW-34: croc patent Kelly clutch, black, 59
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI كيلي كروكو أسود', 'jw-kelly-croc-black', 'شنطة نسائية سوداء لامعة بنقشة كروكو على طراز كيلي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'JW-34', 59.000, 3, v_base || 'JW%2059%20OR%20%2815.png');
  end if;

  -- JW-35: Kelly-style, cream canvas + brown leather, 59
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI كيلي قماش كريمي', 'jw-kelly-canvas-cream-2', 'شنطة نسائية قماشية كريمية بتفاصيل جلدية بنية على طراز كيلي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كريمي وبني', 'JW-35', 59.000, 3, v_base || 'JW%2059%20OR%209.png');
  end if;

  -- JW-36: vanity case, black croc, gold luggage tag, 65
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI فانيتي كروكو أسود', 'jw-vanity-croc-black', 'شنطة نسائية سوداء لامعة بنقشة كروكو وبطاقة معدنية ذهبية. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'JW-36', 65.000, 3, v_base || 'JW%2065%20OR%20%2810.png');
  end if;

  -- JW-37: Birkin-style, burgundy, double strap, 75
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI بيركن عنابي', 'jw-birkin-burgundy', 'شنطة نسائية عنابية غامقة بمقبضين مزدوجين وقفل ذهبي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'عنابي غامق', 'JW-37', 75.000, 3, v_base || 'JW%2075%20OR%2020.png');
  end if;

  -- JW-38: saddle crossbody, black, 40
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI سادل أسود', 'jw-saddle-black', 'شنطة نسائية سوداء بشكل سرج وحمالة كتف طويلة. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'JW-38', 40.000, 3, v_base || 'jw%2040%20or%20%291.png');
  end if;

end $$;
