-- Tory Burch bags — batch 2, 5 products.
-- Prices taken directly from the filenames themselves (most reliable —
-- no cross-referencing needed): "120 ريال.png" = 120, etc.
-- Designs cross-checked against the original price-reference screenshots
-- to write accurate descriptions.
-- Run AFTER uploading the 5 files from "توري بورش بعد تحسين 6"
-- to the "products" bucket root (original filenames, no renaming).

do $$
declare
  v_brand_id uuid;
  v_category_id uuid;
  v_base text := 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/';
  v_product_id uuid;
begin
  select id into v_brand_id from brands where slug = 'tory-burch';
  select id into v_category_id from categories where slug = 'bags';

  -- TB-16: black structured tote, 120
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Tory Burch توتس أسود', 'tb-tote-black', 'شنطة نسائية سوداء بحمالتين علويتين وشعار Tory Burch ذهبي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'TB-16', 120.000, 3, v_base || 'tb-16-tote-black-120.png');
  end if;

  -- TB-17: cream/beige monogram bucket bag, 139
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Tory Burch باكيت مونوغرام', 'tb-bucket-monogram', 'شنطة نسائية بيج بنقشة مونوغرام وربطة سحب علوية. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'بيج', 'TB-17', 139.000, 3, v_base || 'tb-17-bucket-monogram-139.png');
  end if;

  -- TB-18: taupe/beige embossed monogram tote, 159
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Tory Burch مونوغرام بيج', 'tb-monogram-tote-beige', 'شنطة نسائية بيج بنقشة مونوغرام محفورة ومقبضين علويين. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'بيج', 'TB-18', 159.000, 3, v_base || 'tb-18-monogram-tote-beige-159.png');
  end if;

  -- TB-19: black monogram jacquard bowling bag, 159
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Tory Burch بولينغ مونوغرام أسود', 'tb-bowling-monogram-black', 'شنطة نسائية سوداء بنقشة مونوغرام وسحّاب علوي وحمالتين. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'TB-19', 159.000, 3, v_base || 'tb-19-bowling-monogram-black-159.png');
  end if;

  -- TB-20: brown crossbody chain flap bag, 98
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Tory Burch كروسبودي بني', 'tb-crossbody-brown', 'شنطة نسائية بنية بغطاء علوي وسلسلة ذهبية وشعار دائري. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'بني', 'TB-20', 98.000, 3, v_base || 'tb-20-crossbody-brown-98.png');
  end if;

end $$;
