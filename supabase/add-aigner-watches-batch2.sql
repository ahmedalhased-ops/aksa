-- Adds 12 new Aigner women's watches. Run AFTER uploading the 12 files
-- from Downloads/aigner-batch to the "products" bucket (root, not a subfolder).

do $$
declare
  v_product_id uuid;
  v_brand_id uuid;
  v_category_id uuid;
  v_desc text := 'تسليم فوري، مع كامل ملحقات الماركة.';
  v_base text := 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/';
begin
  select id into v_brand_id from brands where slug = 'aigner';
  select id into v_category_id from categories where slug = 'watches';

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أجنر فضية كلاسيك', 'aigner-silver-round-2', v_desc, 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'فضي', 'AIG2-SILVER-RND', 139.000, 4, v_base || 'aigner-w-silver-round-139.png');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أجنر ذهبية كلاسيك', 'aigner-gold-round-2', v_desc, 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'ذهبي', 'AIG2-GOLD-RND', 179.000, 4, v_base || 'aigner-w-gold-round-179.png');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أجنر بسوار جلد أخضر', 'aigner-green-leather', v_desc, 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'أخضر', 'AIG2-GRN-LTHR', 109.000, 4, v_base || 'aigner-w-green-leather-109.png');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أجنر أرقام رومانية', 'aigner-silver-roman', v_desc, 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'فضي', 'AIG2-ROMAN', 149.000, 4, v_base || 'aigner-w-silver-roman-149.png');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أجنر بسوار جلد أبيض', 'aigner-white-leather', v_desc, 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'أبيض', 'AIG2-WHT-LTHR', 119.000, 4, v_base || 'aigner-w-white-leather-119.png');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أجنر تونو رمادي', 'aigner-grey-tonneau', v_desc, 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'رمادي', 'AIG2-GRY-TON', 149.000, 4, v_base || 'aigner-w-grey-tonneau-149.png');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أجنر قلب فوشي', 'aigner-fuchsia-heart', v_desc, 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'فوشي', 'AIG2-FUCHSIA', 69.000, 4, v_base || 'aigner-w-fuchsia-heart-69.png');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أجنر تونو ثنائية اللون', 'aigner-twotone-tonneau', v_desc, 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'ذهبي/فضي', 'AIG2-TT-TON', 189.000, 4, v_base || 'aigner-w-twotone-tonneau-189.png');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أجنر ثنائية اللون كلاسيك', 'aigner-twotone-round', v_desc, 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'ذهبي/فضي', 'AIG2-TT-RND', 159.000, 4, v_base || 'aigner-w-twotone-round-159.png');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أجنر فضية صغيرة', 'aigner-silver-small', v_desc, 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'فضي', 'AIG2-SM-SLV', 165.000, 4, v_base || 'aigner-w-silver-small-165.png');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أجنر قلب كحلي', 'aigner-navy-heart', v_desc, 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'كحلي', 'AIG2-NAVY', 109.000, 4, v_base || 'aigner-w-navy-heart-109.png');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أجنر مينا أخضر', 'aigner-green-dial', v_desc, 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'أخضر/ذهبي', 'AIG2-GRN-DIAL', 169.000, 4, v_base || 'aigner-w-green-dial-169.png');

end $$;
