-- DKNY bags — 14 products. Prices read directly from filenames
-- (as instructed — no renaming). DKNY brand already exists
-- in seed.sql (slug 'dkny').
-- Run AFTER uploading the 14 original files from "DKNY"
-- to the "products" bucket root (original filenames, unchanged).

do $$
declare
  v_brand_id uuid;
  v_category_id uuid;
  v_base text := 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/';
  v_product_id uuid;
begin
  select id into v_brand_id from brands where slug = 'dkny';
  select id into v_category_id from categories where slug = 'bags';

  -- DK-01: embossed logo shoulder bag, black, 29
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة DKNY شعار بارز أسود', 'dkny-embossed-black', 'شنطة نسائية سوداء بشعار DKNY بارز وحمالة كتف. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'DK-01', 29.000, 3, v_base || 'DKNY%2029%20OR.png');
  end if;

  -- DK-02: crossbody flap, saffiano black, 37
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة DKNY كروسبودي أسود', 'dkny-crossbody-black', 'شنطة نسائية سوداء بجلد سافيانو وحمالة طويلة. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'DK-02', 37.000, 3, v_base || 'DKNY%2037%20OR%20%2812.png');
  end if;

  -- DK-03: croc chain flap, black, 39
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة DKNY كروكو سلسلة أسود', 'dkny-croc-chain-black', 'شنطة نسائية سوداء بنقشة كروكو وسلسلة ذهبية. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'DK-03', 39.000, 3, v_base || 'DKNY%2039%20OR%20%2811%29.png');
  end if;

  -- DK-04: crescent hobo, burgundy, 39
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة DKNY هلال عنابي', 'dkny-crescent-burgundy', 'شنطة نسائية عنابية بشكل هلالي وحمالة كتف. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'عنابي', 'DK-04', 39.000, 3, v_base || 'DKNY%2039%20OR%20%282.png');
  end if;

  -- DK-05: jacquard monogram shoulder bag, black, 45
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة DKNY جاكار أسود', 'dkny-jacquard-black', 'شنطة نسائية سوداء بنقشة مونوغرام جاكار وحمالة كتف. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'DK-05', 45.000, 3, v_base || 'DKNY%2045%20OR%20%2814.png');
  end if;

  -- DK-06: shoulder bag with letter charms chain, black silver, 45
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة DKNY حروف فضي', 'dkny-letters-silver', 'شنطة نسائية سوداء بسلسلة معدنية فضية عليها حروف DKNY. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'DK-06', 45.000, 3, v_base || 'DKNY%2045%20OR.png');
  end if;

  -- DK-07: structured satchel, burgundy, 49
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة DKNY ساتشل عنابي', 'dkny-satchel-burgundy', 'شنطة نسائية عنابية بمقبضين علويين وجيب أمامي بسحّاب. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'عنابي', 'DK-07', 49.000, 3, v_base || 'DKNY%2049%20OR%20%281%29.png');
  end if;

  -- DK-08: shoulder bag with letter charms strap, black gold, 49
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة DKNY حروف ذهبي', 'dkny-letters-gold', 'شنطة نسائية سوداء بحمالة عليها حروف DKNY ذهبية. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'DK-08', 49.000, 3, v_base || 'DKNY%2049%20OR%20%286.png');
  end if;

  -- DK-09: embossed logo top-handle tote, black, 55
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة DKNY توتس شعار أسود', 'dkny-tote-embossed-black', 'شنطة نسائية سوداء بمقبض علوي وشعار DKNY NEW YORK بارز. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'DK-09', 55.000, 3, v_base || 'DKNY%2055%20OR%20%282%29.png');
  end if;

  -- DK-10: saddle chain crossbody, black, 55
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة DKNY سادل سلسلة أسود', 'dkny-saddle-chain-black', 'شنطة نسائية سوداء بشكل سرج وسلسلة ذهبية وشعار DKNY. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'DK-10', 55.000, 3, v_base || 'DKNY%2055%20OR%20%283%29.png');
  end if;

  -- DK-11: saddle flap crossbody, black, 55
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة DKNY سادل أسود', 'dkny-saddle-flap-black', 'شنطة نسائية سوداء بشكل سرج وشعار DKNY ذهبي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'DK-11', 55.000, 3, v_base || 'DKNY%2055%20OR%20%284.png');
  end if;

  -- DK-12: jacquard monogram shoulder bag with letter charms, black/white, 59
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة DKNY جاكار وحروف', 'dkny-jacquard-letters', 'شنطة نسائية بنقشة مونوغرام جاكار وحمالة عليها حروف DKNY ذهبية. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود وأبيض', 'DK-12', 59.000, 3, v_base || 'DKNY%2059%20OR%20%2810.png');
  end if;

  -- DK-13: textured camera bag, black, 45
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة DKNY كاميرا أسود', 'dkny-camera-black', 'شنطة نسائية سوداء بشكل كاميرا وحمالة كتف طويلة. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'DK-13', 45.000, 3, v_base || 'DKNYY%2045%20OR.png');
  end if;

  -- DK-14: saddle flap crossbody, burgundy, 55
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة DKNY سادل عنابي', 'dkny-saddle-flap-burgundy', 'شنطة نسائية عنابية بشكل سرج وشعار DKNY ذهبي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'عنابي', 'DK-14', 55.000, 3, v_base || 'DLNY%2055%20OR%20%285.png');
  end if;

end $$;
