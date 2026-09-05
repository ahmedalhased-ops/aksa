-- Michael Kors bags — batch 2, adds MK_BAG_10 (price confirmed by user: 39).
-- Run AFTER michael-kors-batch1.sql and after uploading MK_BAG_10.jpg
-- to the "products" bucket root (original filename, unchanged).

do $$
declare
  v_brand_id uuid;
  v_category_id uuid;
  v_base text := 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/';
  v_product_id uuid;
begin
  select id into v_brand_id from brands where slug = 'michael-kors';
  select id into v_category_id from categories where slug = 'bags';

  -- MK-20: monogram clutch/wallet-on-chain, brown, gold horsebit hardware, 39
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Michael Kors كلاتش مونوغرام', 'mk-clutch-monogram-chain', 'شنطة نسائية بنية بنقشة مونوغرام وسلسلة ذهبية وقفل حزام أمامي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'بني', 'MK-20', 39.000, 3, v_base || 'MK_BAG_10.jpg');
  end if;

end $$;
