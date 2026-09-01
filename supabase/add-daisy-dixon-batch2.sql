-- Adds 10 new Daisy Dixon watch products (each its own design/color),
-- with the shared description "تسليم فوري + شنطة هدية".
-- Run AFTER uploading the 10 renamed images to the "products" bucket.

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

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Daisy Dixon رخامي', 'dd-marble-black-2', v_desc, 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'رخامي / أسود', 'DD2-MARBLE-BLK', 11.900, 5, v_base || 'dd-marble-black.jpg');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Daisy Dixon Prosecco', 'dd-prosecco', v_desc, 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'أبيض / وردي', 'DD2-PROSECCO', 11.900, 5, v_base || 'dd-prosecco-pink.jpg');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Daisy Dixon فوشي', 'dd-fuchsia-floral', v_desc, 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'فوشي / أزهار', 'DD2-FUCHSIA', 9.900, 5, v_base || 'dd-fuchsia-floral.jpg');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Daisy Dixon أزهار معدنية', 'dd-black-flowers', v_desc, 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'أسود / أزهار', 'DD2-BLKFLOWER', 11.900, 5, v_base || 'dd-black-flowers.jpg');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Daisy Dixon قلوب ذهبية', 'dd-gold-hearts', v_desc, 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'ذهبي', 'DD2-HEARTS', 11.900, 5, v_base || 'dd-gold-hearts.jpg');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Daisy Dixon رخامي وردي', 'dd-marble-pink', v_desc, 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'رخامي / وردي', 'DD2-MARBLE-PNK', 11.900, 5, v_base || 'dd-marble-pink.jpg');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Daisy Dixon رخامي رمادي', 'dd-marble-grey', v_desc, 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'رخامي / رمادي', 'DD2-MARBLE-GRY', 11.900, 5, v_base || 'dd-marble-grey.jpg');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Daisy Dixon ذهبي فاخر', 'dd-onisy-gold', v_desc, 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'ذهبي / أبيض', 'DD2-ONISY', 11.900, 5, v_base || 'dd-onisy-gold.jpg');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Daisy Dixon عنابي', 'dd-burgundy-bee', v_desc, 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'عنابي', 'DD2-BURGUNDY', 11.900, 5, v_base || 'dd-burgundy-bee.jpg');

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة Daisy Dixon أزهار كريستال', 'dd-black-crystal', v_desc, 'women')
  returning id into v_product_id;
  insert into product_variants (product_id, color, sku, price, stock, image_url) values
    (v_product_id, 'أسود / كريستال', 'DD2-CRYSTAL', 11.900, 5, v_base || 'dd-black-crystal.jpg');

end $$;
