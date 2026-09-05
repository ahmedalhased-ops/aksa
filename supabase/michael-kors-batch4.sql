-- Michael Kors bags — batch 4, adds MK_BAG_37 (price confirmed by user: 36).
-- Run AFTER michael-kors-batch3.sql and after uploading MK_BAG_37.jpg
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

  -- MK-84: brown/cognac camera crossbody, 36
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Michael Kors كاميرا كونياك', 'mk-camera-cognac', 'شنطة نسائية بنية كونياك بشكل كاميرا وحمالة كتف. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'بني كونياك', 'MK-84', 36.000, 3, v_base || 'MK_BAG_37.jpg');
  end if;

end $$;
