-- FINAL verified Anne Klein catalog — 19 products.
-- Data cross-checked against original price-reference screenshots
-- ("ان كلاين قبل ع" folder) and matched to clean studio photos
-- ("ان كلاين جديد" folder). Run AFTER:
--   1) anne-klein-delete-all.sql (clears any previous Anne Klein data)
--   2) uploading Downloads/anne-klein-verified/*.png to the "products" bucket root

do $$
declare
  v_brand_id uuid;
  v_category_id uuid;
  v_base text := 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/';
  v_product_id uuid;
begin
  select id into v_brand_id from brands where slug = 'anne-klein';
  select id into v_category_id from categories where slug = 'watches';

  -- AK-01: silver oval + double bangle flower charm bracelet
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein بيضاوي فضي وسوار ورود', 'ak-silver-flower-bracelet', 'ساعة نسائية بيضاوية فضية محاطة بالكريستال، مع سوار مزدوج بأشكال ورود من الكريستال. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي', 'AK-01', 28.000, 3, v_base || 'ak-01-silver-flower-bracelet-28.png');
  end if;

  -- AK-02: rose-gold DIAMOND dial, GENUINE tag
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein ألماس بسيطة', 'ak-diamond-simple', 'ساعة نسائية ذهبي وردي بحجر ألماس أصلي واحد وسوار حلقات. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي وردي', 'AK-02', 25.000, 3, v_base || 'ak-02-diamond-simple-25.png');
  end if;

  -- AK-03: faceted gem-cut octagon dial
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein مينا مقصوصة', 'ak-faceted-gem', 'ساعة نسائية ذهبي وردي بمينا مقصوصة على شكل جوهرة وسوار شبكي لامع. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي وردي', 'AK-03', 26.000, 3, v_base || 'ak-03-faceted-gem-26.png');
  end if;

  -- AK-04: pave crystal + roman numerals, bangle
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein كريستال بانغل', 'ak-crystal-bangle', 'ساعة نسائية ذهبي وردي بمينا كريستال مرصّعة وأرقام رومانية وسوار بانغل. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي وردي', 'AK-04', 27.000, 3, v_base || 'ak-04-crystal-bangle-27.png');
  end if;

  -- AK-05: red/burgundy crystal rectangular
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein عنابي كريستال', 'ak-red-crystal', 'ساعة نسائية بمينا عنابي مستطيل محاط بالكريستال وسوار فضي مرصّع. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'عنابي', 'AK-05', 27.000, 3, v_base || 'ak-05-red-crystal-27.png');
  end if;

  -- AK-06: black square, gold ladder bracelet
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein أسود مربع ذهبي', 'ak-black-square-gold', 'ساعة نسائية بمينا أسود مربع وإطار ذهبي كامل، سوار بحلقات مقصوصة. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي', 'AK-06', 19.000, 3, v_base || 'ak-06-black-square-gold-19.png');
  end if;

  -- AK-07: black square, two-tone ladder bracelet
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein أسود ثنائي اللون', 'ak-black-square-twotone', 'ساعة نسائية بمينا أسود مربع وسوار ثنائي اللون بحلقات مقصوصة. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي', 'AK-07', 23.000, 3, v_base || 'ak-07-black-square-twotone-23.png');
  end if;

  -- AK-08: white ceramic bracelet
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein سيراميك أبيض', 'ak-white-ceramic', 'ساعة نسائية بسوار سيراميك أبيض وإطار ذهبي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أبيض وذهبي', 'AK-08', 22.000, 3, v_base || 'ak-08-white-ceramic-22.png');
  end if;

  -- AK-09: nude ceramic bracelet
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein سيراميك نود', 'ak-nude-ceramic', 'ساعة نسائية بسوار سيراميك نود ومينا ذهبي وردي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'نود', 'AK-09', 22.000, 3, v_base || 'ak-09-nude-ceramic-22.png');
  end if;

  -- AK-10: gold pave crystal + roman numerals, scale bracelet
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein ذهبي كريستال', 'ak-gold-crystal', 'ساعة نسائية بمينا كريستال دائرية وأرقام رومانية وسوار ذهبي مرصّع. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي', 'AK-10', 29.000, 3, v_base || 'ak-10-gold-crystal-29.png');
  end if;

  -- AK-11: oval two-tone mesh
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein بيضاوي ثنائي اللون', 'ak-oval-twotone', 'ساعة نسائية بمينا بيضاوي ذهبي وسوار شبكي فضي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي وفضي', 'AK-11', 26.000, 3, v_base || 'ak-11-oval-twotone-26.png');
  end if;

  -- AK-12: rectangular mother-of-pearl dial
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein مستطيلة صدفية', 'ak-rect-mop', 'ساعة نسائية بمينا مستطيلة صدفية وردية فاتحة وسوار ذهبي وردي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'وردي فاتح', 'AK-12', 23.000, 3, v_base || 'ak-12-rect-mop-23.png');
  end if;

  -- AK-13: pink floral ceramic
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein أزهار وردي', 'ak-pink-floral', 'ساعة نسائية بمينا أزهار صدفي وردي فاتح وسوار سيراميك. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'وردي فاتح', 'AK-13', 27.000, 3, v_base || 'ak-13-pink-floral-27.png');
  end if;

  -- AK-14: taupe floral ceramic
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein أزهار تاوبي', 'ak-taupe-floral-crystal', 'ساعة نسائية بمينا أزهار بلون تاوبي غامق محاطة بالكريستال وسوار سيراميك. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'تاوبي غامق', 'AK-14', 27.000, 3, v_base || 'ak-14-taupe-floral-27.png');
  end if;

  -- AK-15: gold oval, gold mesh
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein ذهبي بيضاوي', 'ak-gold-oval-mesh', 'ساعة نسائية بمينا بيضاوي بسيط وسوار شبكي ذهبي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي', 'AK-15', 26.000, 3, v_base || 'ak-15-gold-oval-mesh-26.png');
  end if;

  -- AK-16: hexagon two-tone
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein سداسي ثنائي اللون', 'ak-hexagon-twotone', 'ساعة نسائية بإطار سداسي الشكل ومينا بيضاء وسوار ثنائي اللون. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي', 'AK-16', 26.000, 3, v_base || 'ak-16-hexagon-twotone-26.png');
  end if;

  -- AK-17: black round dial, gold+leather band
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein أسود بحزام جلد', 'ak-black-leather', 'ساعة نسائية بمينا أسود دائرية وإطار ذهبي وحزام أسود. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود وذهبي', 'AK-17', 21.000, 3, v_base || 'ak-17-black-leather-21.png');
  end if;

  -- AK-18: silver bangle, pave crystal + roman numerals
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein بانغل فضي', 'ak-silver-bangle', 'ساعة نسائية فضية بمينا كريستال مرصّعة وأرقام رومانية وسوار بانغل. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي', 'AK-18', 25.000, 3, v_base || 'ak-18-silver-bangle-25.png');
  end if;

  -- AK-19: rose-gold plain dial, ribbed bracelet
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein ذهبي وردي سادة', 'ak-plain-ribbed', 'ساعة نسائية ذهبي وردي بمينا سادة وسوار مضلّع. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي وردي', 'AK-19', 23.000, 3, v_base || 'ak-19-plain-ribbed-23.png');
  end if;

end $$;
