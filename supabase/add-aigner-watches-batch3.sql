-- Adds 11 more Aigner watches (from the 81-photo ChatGPT-cleaned batch).
-- Prices are ESTIMATED from comparable styles in the collection (no price
-- table was available for this batch) — adjust any of them from /admin
-- if you know the real number.
-- Run AFTER uploading the 11 files from Downloads/aigner-batch2 to the
-- "products" bucket root.

do $$
declare
  v_product_id uuid;
  v_brand_id uuid;
  v_category_id uuid;
  v_desc text := 'تسليم فوري، مع كامل ملحقات الماركة. (السعر تقريبي، يرجى التأكيد)';
  v_base text := 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/';
begin
  select id into v_brand_id from brands where slug = 'aigner';
  select id into v_category_id from categories where slug = 'watches';

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أجنر تونو أخضر بسوار', 'aigner-green-tonneau-strap', v_desc, 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'أخضر/ذهبي', 'AIG3-GRN-TON-STRAP', 169.000, 3, v_base || 'aigner-w-green-tonneau-strap-169.png');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أجنر تونو أخضر بسوار معدني', 'aigner-green-tonneau-bracelet', v_desc, 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'أخضر/ذهبي', 'AIG3-GRN-TON-BR', 175.000, 3, v_base || 'aigner-w-green-tonneau-bracelet-175.png');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أجنر قلب أخضر بسلسلة', 'aigner-green-heart-chain', v_desc, 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'أخضر/ذهبي', 'AIG3-GRN-HRT-CH', 189.000, 3, v_base || 'aigner-w-green-heart-chain-189.png');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أجنر قلب صدفي بسلسلة', 'aigner-mop-heart-chain', v_desc, 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'أبيض صدفي/ذهبي', 'AIG3-MOP-HRT-CH', 179.000, 3, v_base || 'aigner-w-mop-heart-chain-179.png');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أجنر قلب أزرق بسلسلة', 'aigner-blue-heart-chain', v_desc, 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'أزرق/ذهبي', 'AIG3-BLU-HRT-CH', 185.000, 3, v_base || 'aigner-w-blue-heart-chain-185.png');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أجنر ستيل كلاسيك', 'aigner-steel-classic', v_desc, 'unisex')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'فضي', 'AIG3-STL-CLS', 149.000, 3, v_base || 'aigner-u-steel-classic-149.png');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أجنر مينا أخضر ثنائية اللون', 'aigner-green-round-twotone', v_desc, 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'أخضر/ذهبي', 'AIG3-GRN-RND-TT', 159.000, 3, v_base || 'aigner-w-green-round-twotone-159.png');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أجنر كرونوغراف ثنائية اللون', 'aigner-chrono-twotone', v_desc, 'unisex')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'ذهبي/فضي', 'AIG3-CHR-TT', 199.000, 3, v_base || 'aigner-u-chrono-twotone-199.png');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أجنر قلب فوشي جلد', 'aigner-fuchsia-heart-leather', v_desc, 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'فوشي', 'AIG3-FUCH-HRT-L', 89.000, 3, v_base || 'aigner-w-fuchsia-heart-leather-89.png');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أجنر قلب أبيض جلد', 'aigner-white-heart-leather', v_desc, 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'أبيض', 'AIG3-WHT-HRT-L', 99.000, 3, v_base || 'aigner-w-white-heart-leather-99.png');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أجنر قلب أخضر هرمي', 'aigner-green-heart-pyramid', v_desc, 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'أخضر/ذهبي', 'AIG3-GRN-HRT-PYR', 179.000, 3, v_base || 'aigner-w-green-heart-pyramid-179.png');

end $$;
