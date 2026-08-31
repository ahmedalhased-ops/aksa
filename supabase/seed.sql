-- =====================================================================
-- AKSA STORE — STARTER SEED DATA
-- Run AFTER schema.sql, in the Supabase SQL editor.
--
-- NOTE ON IMAGES: image_url is left NULL below. Your product photos
-- are on your phone/computer, not on the public internet yet — Next.js
-- can't display a local file path. Upload each photo to Supabase
-- Storage (Storage → new "products" bucket, public) and paste the
-- resulting public URL into image_url, either here before running, or
-- later from the admin dashboard (/admin/products/<id>).
--
-- This seed covers ONE representative color per model to get the site
-- live quickly. Add the remaining colors as extra rows in
-- product_variants from the admin dashboard whenever you're ready —
-- that's exactly what it's for.
-- =====================================================================

insert into brands (name, slug) values
  ('Beverly Hills Polo Club', 'beverly-hills-polo-club'),
  ('U.S. Polo Assn.', 'us-polo-assn'),
  ('Coach', 'coach'),
  ('Kurt Geiger', 'kurt-geiger'),
  ('ALDO', 'aldo'),
  ('JW PEI', 'jw-pei'),
  ('Aigner', 'aigner'),
  ('Dune London', 'dune-london'),
  ('Guess', 'guess'),
  ('Nine West', 'nine-west'),
  ('Mario Valentino', 'mario-valentino'),
  ('TOUS', 'tous'),
  ('DKNY', 'dkny'),
  ('Anne Klein', 'anne-klein'),
  ('Cerruti 1881', 'cerruti-1881'),
  ('Daisy Dixon London', 'daisy-dixon-london'),
  ('Guy Laroche', 'guy-laroche')
on conflict (slug) do nothing;

insert into categories (name, slug) values
  ('ساعات', 'watches'),
  ('شنط', 'bags'),
  ('أحذية', 'shoes'),
  ('إكسسوارات', 'accessories')
on conflict (slug) do nothing;

-- ---------------------------------------------------------------------
-- Helper pattern used below for every product:
--   insert into products (...) select ... returning id  →  used to
--   insert its variant(s) without hard-coding uuids by hand.
-- ---------------------------------------------------------------------

do $$
declare
  v_product_id uuid;
  v_brand_id uuid;
  v_category_id uuid;
begin

  -- ============================= BAGS =============================
  select id into v_category_id from categories where slug = 'bags';

  -- Beverly Hills Polo Club — Knot-Detail Tote
  select id into v_brand_id from brands where slug = 'beverly-hills-polo-club';
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة توت بتفصيلة العقدة', 'bhpc-knot-tote', 'شنطة توت جلدية بحزام علوي وتفصيلة عقدة أنيقة.', 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock) values
    (v_product_id, 'أسود', 'BHPC-KNOT-BLK', 31.900, 4),
    (v_product_id, 'بني', 'BHPC-KNOT-BRN', 23.900, 3);

  -- U.S. Polo Assn — Embossed Logo Tote
  select id into v_brand_id from brands where slug = 'us-polo-assn';
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة توت بشعار محفور', 'uspa-embossed-tote', 'شنطة توت جلدية بشعار USPA محفور على الواجهة.', 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock) values
    (v_product_id, 'أسود', 'USPA-EMB-BLK', 25.900, 5);

  -- Coach — Signature Canvas Tote
  select id into v_brand_id from brands where slug = 'coach';
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة توت سيغنتشر', 'coach-signature-tote', 'شنطة توت بقماش الشعار المميز وحواف جلدية.', 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock) values
    (v_product_id, 'بني', 'COACH-SIG-BRN', 79.000, 3),
    (v_product_id, 'كريمي', 'COACH-SIG-CRM', 79.000, 2);

  -- Coach — Tabby Bag
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Tabby', 'coach-tabby', 'شنطة صغيرة بمشبك معدني ذهبي مميز، مناسبة للمناسبات واليومي.', 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock) values
    (v_product_id, 'أسود', 'COACH-TABBY-BLK', 145.000, 2),
    (v_product_id, 'بني', 'COACH-TABBY-BRN', 159.000, 1);

  -- Kurt Geiger — Kensington
  select id into v_brand_id from brands where slug = 'kurt-geiger';
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Kensington', 'kurt-geiger-kensington', 'شنطة بمشبك رأس النسر المميز، تصميم عصري بلمسة فاخرة.', 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock) values
    (v_product_id, 'ذهبي لامع', 'KG-KEN-GOLD', 49.000, 3),
    (v_product_id, 'أخضر تويد', 'KG-KEN-GRN', 39.000, 2);

  -- ALDO — Monogram Tote
  select id into v_brand_id from brands where slug = 'aldo';
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة توت مونوجرام', 'aldo-monogram-tote', 'شنطة توت بطبعة مونوجرام وحزام سلسلة ذهبي.', 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock) values
    (v_product_id, 'كريمي', 'ALDO-MONO-CRM', 22.000, 4);

  -- JW PEI — Gabbi Mini
  select id into v_brand_id from brands where slug = 'jw-pei';
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Gabbi Mini', 'jwpei-gabbi-mini', 'شنطة صغيرة أنيقة بقفل معدني وتصميم كلاسيكي.', 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock) values
    (v_product_id, 'تاوبي', 'JWPEI-GABBI-TPE', 45.000, 3),
    (v_product_id, 'أسود', 'JWPEI-GABBI-BLK', 45.000, 2);

  -- Aigner — Monogram Tote
  select id into v_brand_id from brands where slug = 'aigner';
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة أجنر مونوجرام', 'aigner-monogram-tote', 'شنطة يد بطبعة أجنر المونوجرام وحواف جلدية بنية.', 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock) values
    (v_product_id, 'بني', 'AIG-MONO-BRN', 99.000, 2);

  -- Dune London — Crescent Bag
  select id into v_brand_id from brands where slug = 'dune-london';
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة كريسنت', 'dune-crescent', 'شنطة هلالية عملية بحزام سلسلة ذهبي.', 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock) values
    (v_product_id, 'أسود', 'DUNE-CRE-BLK', 38.000, 3),
    (v_product_id, 'بني فاتح', 'DUNE-CRE-TAN', 35.000, 2);

  -- Guess — Monogram Shoulder Bag
  select id into v_brand_id from brands where slug = 'guess';
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة كتف مونوجرام', 'guess-monogram-shoulder', 'شنطة كتف بطبعة الشعار الكلاسيكية.', 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock) values
    (v_product_id, 'بيج', 'GUESS-MONO-BEIGE', 29.000, 4);

  -- ============================ WATCHES ============================
  select id into v_category_id from categories where slug = 'watches';

  -- DKNY
  select id into v_brand_id from brands where slug = 'dkny';
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة DKNY كلاسيك', 'dkny-classic-watch', 'ساعة نسائية بتصميم أنيق ومينا لامع.', 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock) values
    (v_product_id, 'فضي', 'DKNY-CLS-SLV', 36.000, 4),
    (v_product_id, 'ذهبي مربع', 'DKNY-CLS-GLD', 49.000, 2);

  -- Anne Klein
  select id into v_brand_id from brands where slug = 'anne-klein';
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Anne Klein', 'anne-klein-watch', 'ساعة نسائية بتفاصيل لامعة وسوار أنيق.', 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock) values
    (v_product_id, 'عنابي', 'AK-WCH-BURG', 27.000, 3);

  -- Aigner — women's + men's
  select id into v_brand_id from brands where slug = 'aigner';
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أجنر نسائية', 'aigner-womens-watch', 'ساعة نسائية فاخرة بعلبة أصلية وحقيبة ملحقات.', 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock) values
    (v_product_id, 'وردي صدفي', 'AIG-W-PINK', 159.000, 2);

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أجنر رجالية', 'aigner-mens-watch', 'ساعة رجالية رياضية بعلبة معدنية وحزام جلدي.', 'men')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock) values
    (v_product_id, 'أسود/برتقالي', 'AIG-M-ORNG', 129.000, 3);

  -- Cerruti 1881
  select id into v_brand_id from brands where slug = 'cerruti-1881';
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Cerruti 1881', 'cerruti-watch', 'ساعة نسائية إيطالية الطراز بمينا كلاسيكي.', 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock) values
    (v_product_id, 'فضي/ذهبي', 'CER-WCH-SLVGLD', 79.000, 2);

  -- Daisy Dixon London
  select id into v_brand_id from brands where slug = 'daisy-dixon-london';
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Daisy Dixon', 'daisy-dixon-watch', 'ساعة نسائية بتصميم رخامي عصري، مع هدية حقيبة صغيرة.', 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock) values
    (v_product_id, 'رمادي', 'DD-WCH-GRY', 9.900, 6);

  -- ========================= ACCESSORIES =========================
  select id into v_category_id from categories where slug = 'accessories';

  select id into v_brand_id from brands where slug = 'guy-laroche';
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'قلم Guy Laroche', 'guy-laroche-pen', 'قلم فاخر بعلبة أصلية، هدية مثالية.', 'unisex')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock) values
    (v_product_id, 'أسود/فضي', 'GL-PEN-BLKSLV', 25.000, 5),
    (v_product_id, 'فضي/ذهبي', 'GL-PEN-SLVGLD', 25.000, 4);

end $$;
