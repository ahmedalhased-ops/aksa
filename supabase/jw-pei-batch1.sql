-- JW PEI bags — 20 products. Prices taken directly from filenames
-- (most reliable source, double-checked against each photo).
-- JW PEI brand already exists in seed.sql (slug 'jw-pei').
-- Run AFTER uploading the 20 "jw-*.png" files from "JW PEI 6"
-- to the "products" bucket root.

do $$
declare
  v_brand_id uuid;
  v_category_id uuid;
  v_base text := 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/';
  v_product_id uuid;
begin
  select id into v_brand_id from brands where slug = 'jw-pei';
  select id into v_category_id from categories where slug = 'bags';

  -- JW-01: Kelly-style, cognac
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI كيلي كونياك', 'jw-kelly-cognac', 'شنطة نسائية بنية كونياك بمقبض علوي وقفل ذهبي على طراز كيلي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كونياك', 'JW-01', 45.000, 3, v_base || 'jw-01-kelly-cognac-45.png');
  end if;

  -- JW-02: Kelly-style, tan
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI كيلي بني فاتح', 'jw-kelly-tan', 'شنطة نسائية بنية فاتحة بمقبض علوي وقفل ذهبي على طراز كيلي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'بني فاتح', 'JW-02', 45.000, 3, v_base || 'jw-02-kelly-tan-45.png');
  end if;

  -- JW-03: Kelly-style, cream
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI كيلي كريمي', 'jw-kelly-cream', 'شنطة نسائية كريمية بمقبض علوي وقفل فضي على طراز كيلي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كريمي', 'JW-03', 45.000, 3, v_base || 'jw-03-kelly-cream-45.png');
  end if;

  -- JW-04: vanity case, brown
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI فانيتي بني', 'jw-vanity-brown', 'شنطة نسائية بنية بشكل صندوق ومقبض علوي وسحّاب ذهبي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'بني', 'JW-04', 49.000, 3, v_base || 'jw-04-vanity-brown-49.png');
  end if;

  -- JW-05: vanity case, olive
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI فانيتي زيتي', 'jw-vanity-olive', 'شنطة نسائية بلون زيتي بشكل صندوق ومقبض علوي وسحّاب ذهبي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'زيتي', 'JW-05', 49.000, 3, v_base || 'jw-05-vanity-olive-49.png');
  end if;

  -- JW-06: suede tote with strap, brown
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI سويدي بني', 'jw-suede-tote-brown', 'شنطة نسائية سويدية بنية بمقبضين علويين وتفاصيل جلدية. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'بني', 'JW-06', 49.000, 3, v_base || 'jw-06-suede-tote-brown-49.png');
  end if;

  -- JW-07: woven hobo, black
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI منسوجة أسود', 'jw-woven-hobo-black', 'شنطة نسائية سوداء منسوجة يدويًا بحمالة كتف. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'JW-07', 49.000, 3, v_base || 'jw-07-woven-hobo-black-49.png');
  end if;

  -- JW-08: Kelly-style, burgundy
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI كيلي عنابي', 'jw-kelly-burgundy', 'شنطة نسائية عنابية بمقبض علوي وقفل ذهبي على طراز كيلي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'عنابي', 'JW-08', 59.000, 3, v_base || 'jw-08-kelly-burgundy-59.png');
  end if;

  -- JW-09: Kelly-style, canvas cream + brown leather
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI كيلي قماش', 'jw-kelly-canvas-cream', 'شنطة نسائية بقماش كريمي وتفاصيل جلدية بنية على طراز كيلي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كريمي وبني', 'JW-09', 59.000, 3, v_base || 'jw-09-kelly-canvas-cream-59.png');
  end if;

  -- JW-10: bucket bag, canvas with bamboo-style handle
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI باكيت قماش', 'jw-bucket-canvas', 'شنطة نسائية قماشية كريمية بمقبض جلدي بني وتصميم باكيت. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كريمي', 'JW-10', 40.000, 3, v_base || 'jw-10-bucket-canvas-40.png');
  end if;

  -- JW-11: crescent/half-moon bag, burgundy
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI هلال عنابي', 'jw-crescent-burgundy', 'شنطة نسائية عنابية بشكل هلالي وحمالة كتف طويلة. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'عنابي', 'JW-11', 55.000, 3, v_base || 'jw-11-crescent-burgundy-55.png');
  end if;

  -- JW-12: hobo shoulder bag, burgundy
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI هوبو عنابي', 'jw-hobo-burgundy', 'شنطة نسائية عنابية بحمالة كتف واحدة وسحّاب ذهبي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'عنابي', 'JW-12', 30.000, 3, v_base || 'jw-12-hobo-burgundy-30.png');
  end if;

  -- JW-13: vanity case, black
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI فانيتي أسود', 'jw-vanity-black', 'شنطة نسائية سوداء بشكل صندوق ومقبض علوي وسحّاب ذهبي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'JW-13', 49.000, 3, v_base || 'jw-13-vanity-black-49.png');
  end if;

  -- JW-14: Kelly-style clutch, burgundy
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI كيلي كلاتش عنابي', 'jw-kelly-clutch-burgundy', 'شنطة نسائية عنابية مسطحة بمقبض علوي صغير على طراز كيلي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'عنابي', 'JW-14', 55.000, 3, v_base || 'jw-14-kelly-clutch-burgundy-55.png');
  end if;

  -- JW-15: hobo bag, chocolate
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI هوبو شوكولاته', 'jw-hobo-chocolate', 'شنطة نسائية بنية غامقة بمقبض علوي وقفل ذهبي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'بني غامق', 'JW-15', 55.000, 3, v_base || 'jw-15-hobo-chocolate-55.png');
  end if;

  -- JW-16: slouchy hobo, black
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI هوبو أسود', 'jw-hobo-slouchy-black', 'شنطة نسائية سوداء بتصميم مرن وقفل ذهبي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'JW-16', 59.000, 3, v_base || 'jw-16-hobo-slouchy-black-59.png');
  end if;

  -- JW-17: Kelly-style, black
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI كيلي أسود', 'jw-kelly-black', 'شنطة نسائية سوداء بمقبض علوي وقفل فضي على طراز كيلي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'JW-17', 59.000, 3, v_base || 'jw-17-kelly-black-59.png');
  end if;

  -- JW-18: suede tote, olive
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI سويدي زيتي', 'jw-suede-tote-olive', 'شنطة نسائية سويدية بلون زيتي بمقبضين علويين. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'زيتي', 'JW-18', 49.000, 3, v_base || 'jw-18-suede-tote-olive-49.png');
  end if;

  -- JW-19: suede tote, cream
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI سويدي كريمي', 'jw-suede-tote-cream', 'شنطة نسائية سويدية كريمية بمقبضين علويين وتفاصيل جلدية بنية. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كريمي', 'JW-19', 45.000, 3, v_base || 'jw-19-suede-tote-cream-45.png');
  end if;

  -- JW-20: woven hobo, burgundy, twisted gold handle
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة JW PEI منسوجة عنابي', 'jw-woven-hobo-burgundy', 'شنطة نسائية عنابية منسوجة يدويًا بمقبض ذهبي ملتوي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'عنابي', 'JW-20', 50.000, 3, v_base || 'jw-20-woven-hobo-burgundy-50.png');
  end if;

end $$;
