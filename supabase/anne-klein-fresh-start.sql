-- Fresh clean start for Anne Klein watches — 14 products, all with confirmed
-- prices and professional studio photos (no story-screenshot chrome/text).
-- Run AFTER uploading Downloads/anne-klein-fresh-start/*.png
-- to the "products" bucket root.
-- Assumes the old Anne Klein catalog was already fully deleted
-- (anne-klein-delete-all.sql).

do $$
declare
  v_brand_id uuid;
  v_category_id uuid;
  v_base text := 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/';
  v_product_id uuid;
begin
  select id into v_brand_id from brands where slug = 'anne-klein';
  select id into v_category_id from categories where slug = 'watches';

  -- AK-01: faceted gem-cut dial, rose gold mesh
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein مينا مقصوصة', 'ak-faceted-gem', 'ساعة نسائية ذهبي وردي بمينا مقصوصة على شكل جوهرة وسوار شبكي لامع. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي وردي', 'AK-01', 26.000, 3, v_base || 'ak-01-faceted-gem-26.png');
  end if;

  -- AK-02: rectangular mother-of-pearl dial
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein مستطيلة صدفية', 'ak-rect-mop', 'ساعة نسائية بمينا مستطيلة صدفية وردية فاتحة وسوار ذهبي وردي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'وردي فاتح', 'AK-02', 23.000, 3, v_base || 'ak-02-rect-mop-23.png');
  end if;

  -- AK-03: pink floral ceramic
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein أزهار وردي', 'ak-pink-floral', 'ساعة نسائية بمينا أزهار صدفي وردي فاتح وسوار سيراميك. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'وردي فاتح', 'AK-03', 27.000, 3, v_base || 'ak-03-pink-floral-27.png');
  end if;

  -- AK-04: red/burgundy crystal square
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein عنابي كريستال', 'ak-red-crystal', 'ساعة نسائية بمينا عنابي مربع محاط بالكريستال. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'عنابي', 'AK-04', 27.000, 3, v_base || 'ak-04-red-crystal-27.png');
  end if;

  -- AK-05: gold oval, gold mesh
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein ذهبي بيضاوي', 'ak-gold-oval-mesh', 'ساعة نسائية بمينا بيضاوي بسيط وسوار شبكي ذهبي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي', 'AK-05', 26.000, 3, v_base || 'ak-05-gold-oval-mesh-26.png');
  end if;

  -- AK-06: taupe floral crystal
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein أزهار تاوبي', 'ak-taupe-floral-crystal', 'ساعة نسائية بمينا أزهار بلون تاوبي غامق محاطة بالكريستال وسوار سيراميك. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'تاوبي غامق', 'AK-06', 27.000, 3, v_base || 'ak-06-taupe-floral-27.png');
  end if;

  -- AK-07: gold pave crystal, roman numerals, scale bracelet
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein ذهبي كريستال', 'ak-gold-crystal', 'ساعة نسائية بمينا كريستال دائرية وأرقام رومانية وسوار ذهبي مرصّع. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي', 'AK-07', 29.000, 3, v_base || 'ak-07-gold-crystal-29.png');
  end if;

  -- AK-08: silver oval + flower charm bracelet
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein بيضاوي فضي وسوار ورود', 'ak-silver-flower-bracelet', 'ساعة نسائية بيضاوية فضية محاطة بالكريستال، مع سوار مزدوج بأشكال ورود من الكريستال. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي', 'AK-08', 28.000, 3, v_base || 'ak-08-silver-flower-bracelet-28.png');
  end if;

  -- AK-09: silver pave crystal, roman numerals
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein فضي كريستال', 'ak-silver-crystal', 'ساعة نسائية بمينا كريستال دائرية وأرقام رومانية وسوار فضي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي', 'AK-09', 25.000, 3, v_base || 'ak-09-silver-crystal-25.png');
  end if;

  -- AK-10: black square, gold cutout bracelet
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein أسود مربع ذهبي', 'ak-black-square-gold', 'ساعة نسائية بمينا أسود مربع وإطار ذهبي كامل، سوار بحلقات مقصوصة. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي', 'AK-10', 19.000, 3, v_base || 'ak-10-black-square-gold-19.png');
  end if;

  -- AK-11: black square, two-tone bracelet
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein أسود ثنائي اللون', 'ak-black-square-twotone', 'ساعة نسائية بمينا أسود مربع وسوار ثنائي اللون بحلقات مقصوصة. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي', 'AK-11', 23.000, 3, v_base || 'ak-11-black-square-twotone-23.png');
  end if;

  -- AK-12: hexagon two-tone
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein سداسي ثنائي اللون', 'ak-hexagon-twotone', 'ساعة نسائية بإطار سداسي الشكل ومينا بيضاء وسوار ثنائي اللون. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي', 'AK-12', 26.000, 3, v_base || 'ak-12-hexagon-twotone-26.png');
  end if;

  -- AK-13: oval two-tone
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein بيضاوي ثنائي اللون', 'ak-oval-twotone', 'ساعة نسائية بمينا بيضاوي ذهبي وسوار شبكي فضي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي وفضي', 'AK-13', 26.000, 3, v_base || 'ak-13-oval-twotone-26.png');
  end if;

  -- AK-14: rose-gold DIAMOND dial, simple, mesh band
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein ألماس بسيطة', 'ak-diamond-simple', 'ساعة نسائية ذهبي وردي بحجر ألماس أصلي واحد وسوار شبكي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي وردي', 'AK-14', 25.000, 3, v_base || 'ak-14-diamond-simple-25.png');
  end if;

end $$;
