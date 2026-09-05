-- DKNY watches — 10 products. Prices read directly from filenames
-- (as instructed — no renaming).
-- Run AFTER uploading the 10 original files from "DKNY WATCH"
-- to the "products" bucket root (original filenames, unchanged).

do $$
declare
  v_brand_id uuid;
  v_category_id uuid;
  v_base text := 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/';
  v_product_id uuid;
begin
  select id into v_brand_id from brands where slug = 'dkny';
  select id into v_category_id from categories where slug = 'watches';

  -- DKW-01: rectangular silver dial, crystal bezel, silver bracelet, 39
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة DKNY مستطيلة فضية', 'dkny-watch-rect-silver', 'ساعة نسائية فضية بمينا مستطيلة وإطار مرصّع بالكريستال. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي', 'DKW-01', 39.000, 3, v_base || 'DKNY%20WATCH%2039%20OR%20%284.png');
  end if;

  -- DKW-02: round silver, turquoise DKNY-pattern dial, 39
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة DKNY فيروزي', 'dkny-watch-turquoise', 'ساعة نسائية فضية بمينا فيروزي منقوش بشعار DKNY. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وفيروزي', 'DKW-02', 39.000, 3, v_base || 'DKNY%20WATCH%2039%20OR%20%287.png');
  end if;

  -- DKW-03: round two-tone, white dial, roman numerals, crystal bezel, 39
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة DKNY ثنائية اللون', 'dkny-watch-twotone', 'ساعة نسائية ثنائية اللون بمينا بيضاء وأرقام رومانية وإطار مرصّع. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي', 'DKW-03', 39.000, 3, v_base || 'DKNY%20WATCH%2039%20OR%20%289.png');
  end if;

  -- DKW-04: round gold, dark green dial, DKNY-link bezel, 45
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة DKNY أخضر غامق', 'dkny-watch-green-gold', 'ساعة نسائية ذهبية بمينا خضراء غامقة وإطار منقوش بحروف DKNY. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي وأخضر', 'DKW-04', 45.000, 3, v_base || 'DKNY%20WATCH%2045%20OR%20%2810.png');
  end if;

  -- DKW-05: square silver dial, crystal bangle bracelet, 45
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة DKNY مربعة بانغل', 'dkny-watch-square-bangle', 'ساعة نسائية فضية بمينا مربعة وسوار بانغل مرصّع بالكريستال. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي', 'DKW-05', 45.000, 3, v_base || 'DKNY%20WATCH%2045%20OR%20%283%29.png');
  end if;

  -- DKW-06: round two-tone textured dial, 49
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة DKNY منقوشة ثنائية اللون', 'dkny-watch-textured-twotone', 'ساعة نسائية ثنائية اللون بمينا منقوشة وإطار مرصّع بالكريستال. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي', 'DKW-06', 49.000, 3, v_base || 'DKNY%20WATCH%2049%20OR%20%285.png');
  end if;

  -- DKW-07: round gold, dark green dial, DKNY-letter bangle, 49
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة DKNY أخضر بانغل', 'dkny-watch-green-bangle', 'ساعة نسائية ذهبية بمينا خضراء وسوار بانغل منقوش بحروف DKNY. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي وأخضر', 'DKW-07', 49.000, 3, v_base || 'DKNY%20WATCH%2049%20OR%20%286.png');
  end if;

  -- DKW-08: round gold, full pave crystal, chronograph subdials, 49
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة DKNY مرصّعة بالكامل', 'dkny-watch-full-pave', 'ساعة نسائية ذهبية بمينا مرصّعة بالكامل بالكريستال وعدادات فرعية. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي', 'DKW-08', 49.000, 3, v_base || 'DKNY%20WATCH%2049%20OR%20%288.png');
  end if;

  -- DKW-09: square dark green dial, two-tone crystal bracelet, 49
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة DKNY مربعة أخضر', 'dkny-watch-square-green', 'ساعة نسائية بمينا مربعة خضراء وسوار ثنائي اللون مرصّع بالكريستال. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي', 'DKW-09', 49.000, 3, v_base || 'DKNY%20WATCH%2049OR%20%282%29.png');
  end if;

  -- DKW-10: square white/MOP dial "DKNY" text, gold chain bracelet, 55
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة DKNY مربعة ذهبية', 'dkny-watch-square-gold', 'ساعة نسائية ذهبية بمينا مربعة بيضاء وسوار سلسلة مرصّع بالكريستال. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي', 'DKW-10', 55.000, 3, v_base || 'DKNY%20WATCH%2055%20OR%281%29.png');
  end if;

end $$;
