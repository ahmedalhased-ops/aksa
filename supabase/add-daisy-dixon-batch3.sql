-- =====================================================================
-- دفعة 3 — 15 ساعة Daisy Dixon (كل تصميم منتج مستقل)
--
-- مصدر البيانات: صور العرض في مجلد "ساعات ديزي ديكسون" (IMG_5341–5355)
--   — السعر ونص العرض مقروءان من الكتابة على الصور، والصور نفسها
--     *لا تُرفع للموقع*. صور المنتجات هي النسخ النظيفة (PNG) بلا كتابة.
-- الصور: 15 ملف PNG من مجلد "مساعد ديزي ديكسون" → نُسخت إلى product-photos/
--
-- شغّلها في Supabase → SQL Editor بعد رفع الصور الـ15 لباكِت products.
-- آمنة للتشغيل أكثر من مرة: تحدّث الموجود بدل ما تكرره.
-- =====================================================================

do $$
declare
  v_product_id uuid;
  v_brand_id uuid;
  v_category_id uuid;
  v_desc text := 'تسليم فوري + شنطة هدية.';
  v_base text := 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/';
begin
  select id into v_brand_id from brands where slug = 'daisy-dixon-london';
  select id into v_category_id from categories where slug = 'watches';

  -- ساعة ديزي ديكسون كحلي بزخارف ذهبية  (من IMG_5341 — 11.9 ر.ع + شنطة هدية)
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة ديزي ديكسون كحلي بزخارف ذهبية', 'daisy-dixon-navy-medallion', v_desc, 'women')
  on conflict (slug) do update set description = excluded.description, updated_at = now()
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'كحلي بزخارف ذهبية', 'DD-NAVY-MEDAL', 11.900, 6, v_base || 'daisy-dixon-navy-medallion.png')
  on conflict (sku) do update set price = excluded.price, stock = excluded.stock, image_url = excluded.image_url;

  -- ساعة ديزي ديكسون أسود ذهبي بنقشة السلسلة  (من IMG_5342 — 11.9 ر.ع + شنطة هدية)
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة ديزي ديكسون أسود ذهبي بنقشة السلسلة', 'daisy-dixon-black-gold-chain', v_desc, 'women')
  on conflict (slug) do update set description = excluded.description, updated_at = now()
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'أسود وذهبي', 'DD-BLK-CHAIN', 11.900, 6, v_base || 'daisy-dixon-black-gold-chain.png')
  on conflict (sku) do update set price = excluded.price, stock = excluded.stock, image_url = excluded.image_url;

  -- ساعة ديزي ديكسون كحلي بشرابة ذهبية  (من IMG_5343 — 11.9 ر.ع + شنطة هدية)
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة ديزي ديكسون كحلي بشرابة ذهبية', 'daisy-dixon-navy-tassel', v_desc, 'women')
  on conflict (slug) do update set description = excluded.description, updated_at = now()
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'كحلي وذهبي', 'DD-NAVY-TASSEL', 11.900, 6, v_base || 'daisy-dixon-navy-tassel.png')
  on conflict (sku) do update set price = excluded.price, stock = excluded.stock, image_url = excluded.image_url;

  -- ساعة ديزي ديكسون ثنائية اللون بقلوب كريستال  (من IMG_5344 — 22 ر.ع + شنطة هدية)
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة ديزي ديكسون ثنائية اللون بقلوب كريستال', 'daisy-dixon-two-tone-hearts', v_desc, 'women')
  on conflict (slug) do update set description = excluded.description, updated_at = now()
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'فضي وروز غولد', 'DD-TT-HEARTS', 22.000, 6, v_base || 'daisy-dixon-two-tone-hearts.png')
  on conflict (sku) do update set price = excluded.price, stock = excluded.stock, image_url = excluded.image_url;

  -- ساعة ديزي ديكسون ثنائية اللون بأرقام رومانية  (من IMG_5345 — 22 ر.ع + شنطة هدية)
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة ديزي ديكسون ثنائية اللون بأرقام رومانية', 'daisy-dixon-two-tone-roman', v_desc, 'women')
  on conflict (slug) do update set description = excluded.description, updated_at = now()
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'فضي وذهبي', 'DD-TT-ROMAN', 22.000, 6, v_base || 'daisy-dixon-two-tone-roman.png')
  on conflict (sku) do update set price = excluded.price, stock = excluded.stock, image_url = excluded.image_url;

  -- ساعة ديزي ديكسون روز غولد بمينا هندسية  (من IMG_5346 — 22 ر.ع + شنطة هدية)
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة ديزي ديكسون روز غولد بمينا هندسية', 'daisy-dixon-rose-gold-faceted', v_desc, 'women')
  on conflict (slug) do update set description = excluded.description, updated_at = now()
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'روز غولد', 'DD-RG-FACET', 22.000, 6, v_base || 'daisy-dixon-rose-gold-faceted.png')
  on conflict (sku) do update set price = excluded.price, stock = excluded.stock, image_url = excluded.image_url;

  -- ساعة ديزي ديكسون ذهبية بمينا سوداء  (من IMG_5347 — 22 ر.ع + شنطة هدية)
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة ديزي ديكسون ذهبية بمينا سوداء', 'daisy-dixon-gold-black-engraved', v_desc, 'women')
  on conflict (slug) do update set description = excluded.description, updated_at = now()
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'ذهبي وأسود', 'DD-GLD-BLACK', 22.000, 6, v_base || 'daisy-dixon-gold-black-engraved.png')
  on conflict (sku) do update set price = excluded.price, stock = excluded.stock, image_url = excluded.image_url;

  -- ساعة ديزي ديكسون روز غولد بإطار ملون  (من IMG_5348 — 22 ر.ع + شنطة هدية)
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة ديزي ديكسون روز غولد بإطار ملون', 'daisy-dixon-rose-gold-rainbow', v_desc, 'women')
  on conflict (slug) do update set description = excluded.description, updated_at = now()
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'روز غولد ومتعدد الألوان', 'DD-RG-RAINBOW', 22.000, 6, v_base || 'daisy-dixon-rose-gold-rainbow.png')
  on conflict (sku) do update set price = excluded.price, stock = excluded.stock, image_url = excluded.image_url;

  -- ساعة ديزي ديكسون ذهبية بزهرة كريستال  (من IMG_5349 — 22 ر.ع + شنطة هدية)
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة ديزي ديكسون ذهبية بزهرة كريستال', 'daisy-dixon-gold-daisy-crystal', v_desc, 'women')
  on conflict (slug) do update set description = excluded.description, updated_at = now()
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'ذهبي وأبيض', 'DD-GLD-DAISY', 22.000, 6, v_base || 'daisy-dixon-gold-daisy-crystal.png')
  on conflict (sku) do update set price = excluded.price, stock = excluded.stock, image_url = excluded.image_url;

  -- ساعة ديزي ديكسون روز غولد بمينا موف  (من IMG_5350 — 22 ر.ع + شنطة هدية)
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة ديزي ديكسون روز غولد بمينا موف', 'daisy-dixon-rose-gold-mauve', v_desc, 'women')
  on conflict (slug) do update set description = excluded.description, updated_at = now()
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'روز غولد وموف', 'DD-RG-MAUVE', 22.000, 6, v_base || 'daisy-dixon-rose-gold-mauve.png')
  on conflict (sku) do update set price = excluded.price, stock = excluded.stock, image_url = excluded.image_url;

  -- ساعة ديزي ديكسون فضية بمينا كحلية مونوجرام  (من IMG_5351 — 22 ر.ع + شنطة هدية)
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة ديزي ديكسون فضية بمينا كحلية مونوجرام', 'daisy-dixon-silver-navy-monogram', v_desc, 'women')
  on conflict (slug) do update set description = excluded.description, updated_at = now()
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'فضي وكحلي', 'DD-SLV-MONO', 22.000, 6, v_base || 'daisy-dixon-silver-navy-monogram.png')
  on conflict (sku) do update set price = excluded.price, stock = excluded.stock, image_url = excluded.image_url;

  -- ساعة ديزي ديكسون فضية مرصعة بالكامل  (من IMG_5352 — 22 ر.ع + شنطة هدية)
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة ديزي ديكسون فضية مرصعة بالكامل', 'daisy-dixon-silver-full-crystal', v_desc, 'women')
  on conflict (slug) do update set description = excluded.description, updated_at = now()
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'فضي وكريستال', 'DD-SLV-CRYSTAL', 22.000, 6, v_base || 'daisy-dixon-silver-full-crystal.png')
  on conflict (sku) do update set price = excluded.price, stock = excluded.stock, image_url = excluded.image_url;

  -- ساعة ديزي ديكسون ثنائية اللون بزهرة مرصعة  (من IMG_5353 — 22 ر.ع + شنطة هدية)
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة ديزي ديكسون ثنائية اللون بزهرة مرصعة', 'daisy-dixon-two-tone-floral-crystal', v_desc, 'women')
  on conflict (slug) do update set description = excluded.description, updated_at = now()
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'فضي وروز غولد', 'DD-TT-FLORAL', 22.000, 6, v_base || 'daisy-dixon-two-tone-floral-crystal.png')
  on conflict (sku) do update set price = excluded.price, stock = excluded.stock, image_url = excluded.image_url;

  -- ساعة ديزي ديكسون فضية شبكية بإطار ذهبي  (من IMG_5354 — 22 ر.ع + شنطة هدية)
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة ديزي ديكسون فضية شبكية بإطار ذهبي', 'daisy-dixon-silver-mesh-gold', v_desc, 'women')
  on conflict (slug) do update set description = excluded.description, updated_at = now()
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'فضي وذهبي', 'DD-MESH-GOLD', 22.000, 6, v_base || 'daisy-dixon-silver-mesh-gold.png')
  on conflict (sku) do update set price = excluded.price, stock = excluded.stock, image_url = excluded.image_url;

  -- ساعة ديزي ديكسون ذهبية بمينا برتقالية  (من IMG_5355 — 22 ر.ع + شنطة هدية)
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة ديزي ديكسون ذهبية بمينا برتقالية', 'daisy-dixon-gold-orange-daisy', v_desc, 'women')
  on conflict (slug) do update set description = excluded.description, updated_at = now()
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'ذهبي وبرتقالي', 'DD-GLD-ORANGE', 22.000, 6, v_base || 'daisy-dixon-gold-orange-daisy.png')
  on conflict (sku) do update set price = excluded.price, stock = excluded.stock, image_url = excluded.image_url;

end $$;
