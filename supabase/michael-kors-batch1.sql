-- Michael Kors bags — 19 products (excludes MK_BAG_10, no price in filename yet).
-- Prices read directly from filenames (as instructed — no renaming).
-- Run AFTER uploading the 19 original files from "MK BAAG 2"
-- to the "products" bucket root (original filenames, unchanged).

insert into brands (name, slug) values ('Michael Kors', 'michael-kors')
on conflict (slug) do nothing;

do $$
declare
  v_brand_id uuid;
  v_category_id uuid;
  v_base text := 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/';
  v_product_id uuid;
begin
  select id into v_brand_id from brands where slug = 'michael-kors';
  select id into v_category_id from categories where slug = 'bags';

  -- MK-01: envelope flap bag, white/beige monogram border, 69
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Michael Kors مغلف أبيض', 'mk-envelope-white', 'شنطة نسائية بيضاء بحواف منقوشة بشعار MK وقفل ذهبي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أبيض', 'MK-01', 69.000, 3, v_base || 'MK%20-%20BAG%20-%2869OR%29.jpg');
  end if;

  -- MK-02: monogram camera crossbody, brown trim, 36
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Michael Kors كاميرا مونوغرام', 'mk-camera-monogram', 'شنطة نسائية بنقشة مونوغرام وحواف جلدية بنية وسلسلة ذهبية. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'بيج وبني', 'MK-02', 36.000, 3, v_base || 'MK_BAG_01%20%2836OR%29.jpg');
  end if;

  -- MK-03: small tote, black, MK charm, 38
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Michael Kors توتس أسود صغير', 'mk-tote-small-black', 'شنطة نسائية سوداء صغيرة بمقبضين وحلقة MK ذهبية. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'MK-03', 38.000, 3, v_base || 'MK_BAG_02%20%2838OR%29.jpg');
  end if;

  -- MK-04: flap crossbody, black, MK circle clasp, 59
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Michael Kors كروسبودي أسود', 'mk-crossbody-flap-black', 'شنطة نسائية سوداء بغطاء علوي وقفل دائري MK ذهبي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'MK-04', 59.000, 3, v_base || 'MK_BAG_03%20%2859OR%29.jpg');
  end if;

  -- MK-05: small tote, navy, monogram flap, 42
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Michael Kors توتس كحلي', 'mk-tote-navy', 'شنطة نسائية كحلية بحواف مونوغرام وقفل معدني. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كحلي', 'MK-05', 42.000, 3, v_base || 'MK_BAG_04%20%2842OR%29.jpg');
  end if;

  -- MK-06: Hamilton-style, white rhinestone, padlock charm, 55
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Michael Kors هاميلتون مرصّعة', 'mk-hamilton-rhinestone', 'شنطة نسائية بيضاء مرصّعة بالكامل بالكريستال مع بريلوك MK. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أبيض', 'MK-06', 55.000, 3, v_base || 'MK_BAG_05%20%2855OR%29.jpg');
  end if;

  -- MK-07: monogram tote, brown, red trim, 38
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Michael Kors مونوغرام أحمر', 'mk-monogram-red-trim', 'شنطة نسائية بنية بنقشة مونوغرام وحواف جلدية حمراء لامعة. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'بني وأحمر', 'MK-07', 38.000, 3, v_base || 'MK_BAG_06%20%2838OR%29.jpg');
  end if;

  -- MK-08: metallic flap crossbody, silver, 39
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Michael Kors كروسبودي فضي', 'mk-crossbody-silver', 'شنطة نسائية فضية لامعة بسلسلة معدنية وقفل MK. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي', 'MK-08', 39.000, 3, v_base || 'MK_BAG_07%20%2839OR%29.jpg');
  end if;

  -- MK-09: metallic small tote, silver, 39
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Michael Kors توتس فضي', 'mk-tote-silver', 'شنطة نسائية فضية لامعة بمقبضين وحلقة MK. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي', 'MK-09', 39.000, 3, v_base || 'MK_BAG_08%20%2839OR%29.jpg');
  end if;

  -- MK-10: monogram pouch, white/cream, color-block stripe, 45
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Michael Kors مونوغرام مخطط', 'mk-monogram-striped', 'شنطة نسائية بيضاء بنقشة مونوغرام وخط لوني بيج وذهبي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'بيج', 'MK-10', 45.000, 3, v_base || 'MK_BAG_11%20%2845OR%29.jpg');
  end if;

  -- MK-11: jet-set tote, black monogram, 49
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Michael Kors جيت سيت أسود', 'mk-jetset-black', 'شنطة نسائية سوداء بنقشة مونوغرام ومقبضين علويين. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'MK-11', 49.000, 3, v_base || 'MK_BAG_12%20%2849OR%29.jpg');
  end if;

  -- MK-12: jet-set tote, white/grey, belt logo, 59
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Michael Kors جيت سيت أبيض', 'mk-jetset-white', 'شنطة نسائية بيضاء بنقشة مونوغرام وحزام أمامي بحلقة MK ذهبية. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أبيض', 'MK-12', 59.000, 3, v_base || 'MK_BAG_13%20%2859OR%29.jpg');
  end if;

  -- MK-13: monogram tote, white/tan, brown trim, 49
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Michael Kors مونوغرام بني فاتح', 'mk-monogram-tan-trim', 'شنطة نسائية بيضاء بنقشة مونوغرام وحواف جلدية بنية. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'بيج وبني', 'MK-13', 49.000, 3, v_base || 'MK_BAG_14%20%2849OR%29.jpg');
  end if;

  -- MK-14: jet-set hobo, cream, cream handle, 49
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Michael Kors هوبو كريمي', 'mk-hobo-cream', 'شنطة نسائية كريمية بنقشة مونوغرام وحواف جلدية بنية. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كريمي', 'MK-14', 49.000, 3, v_base || 'MK_BAG_15%20%2849%20OR%29.jpg');
  end if;

  -- MK-15: camera bag, black, silver chain, 36
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Michael Kors كاميرا أسود', 'mk-camera-black', 'شنطة نسائية سوداء بنقشة مونوغرام وسلسلة فضية. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'MK-15', 36.000, 3, v_base || 'MK_BAG_16%20%2836OR%29.jpg');
  end if;

  -- MK-16: small bucket tote, black, 49
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Michael Kors سلة أسود صغير', 'mk-bucket-black-small', 'شنطة نسائية سوداء صغيرة بمقبضين علويين وحلقة MK. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'MK-16', 49.000, 3, v_base || 'MK_BAG_17%20%2849OR%29.jpg');
  end if;

  -- MK-17: drawstring bucket, white monogram, brown corners, 58
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Michael Kors سلة مونوغرام', 'mk-bucket-monogram-drawstring', 'شنطة نسائية بيضاء بنقشة مونوغرام وربطة سحب وزوايا جلدية بنية. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'بيج وبني', 'MK-17', 58.000, 3, v_base || 'MK_BAG_18%20%2858OR%29.jpg');
  end if;

  -- MK-18: hobo, navy, silver hardware, 49
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Michael Kors هوبو كحلي', 'mk-hobo-navy', 'شنطة نسائية كحلية جلد طبيعي بحمالة كتف وفتحة سحّاب علوية. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كحلي', 'MK-18', 49.000, 3, v_base || 'MK_BAG_19%20%2849OR%29.jpg');
  end if;

  -- MK-19: monogram tote, brown/black, envelope pocket, 42
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Michael Kors مونوغرام بجيب مغلف', 'mk-monogram-envelope-pocket', 'شنطة نسائية بنية بنقشة مونوغرام وجيب أمامي بشكل مغلف. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'بني', 'MK-19', 42.000, 3, v_base || 'MK_BAG_20%20%2842OR%29.jpg');
  end if;

end $$;
