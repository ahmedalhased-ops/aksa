-- ALDO bags — batch 3, adds the final 2 products (ALD-65, ALD-66)
-- whose prices weren't in their filenames (confirmed by user: 24 and 22).
-- Run AFTER aldo-bags-batch1.sql and batch2.sql, and after uploading
-- ALDO_BAG_10.jpg and ALDO_BAG_47.jpg (original filenames, unchanged)
-- to the "products" bucket root.

do $$
declare
  v_brand_id uuid;
  v_category_id uuid;
  v_base text := 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/';
  v_product_id uuid;
begin
  select id into v_brand_id from brands where slug = 'aldo';
  select id into v_category_id from categories where slug = 'bags';

  -- ALD-65: black Kelly-style, gold chain, 24
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة ALDO كيلي أسود سلسلة ذهبية', 'aldo-65-kelly-black-goldchain', 'شنطة نسائية سوداء بمقبض علوي وسلسلة ذهبية على طراز كيلي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'ALD-65', 24.000, 3, v_base || 'ALDO_BAG_10.jpg');
  end if;

  -- ALD-66: beige geometric tote, gold ring handle, 22
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة ALDO توتس بيج هندسي', 'aldo-66-tote-beige-geometric', 'شنطة نسائية بيج بنقشة هندسية ومقبض ذهبي دائري. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'بيج', 'ALD-66', 22.000, 3, v_base || 'ALDO_BAG_47.jpg');
  end if;

end $$;
