-- Batch 3: fixes the 4 remaining broken Anne Klein images (AK-04, AK-05,
-- AK-08, AK-12) with genuinely clean photos sent directly by the user.
-- Run AFTER uploading Downloads/anne-klein-upload-batch3/*.jpg to the
-- "products" bucket root.

update product_variants set
  image_url = 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/ak-04-gold-crystal-29.jpg'
where sku = 'AK-04';

update product_variants set
  image_url = 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/ak-05-gold-oval-mesh-26.jpg'
where sku = 'AK-05';

update product_variants set
  image_url = 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/ak-08-hexagon-twotone-26.jpg'
where sku = 'AK-08';

update product_variants set
  image_url = 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/ak-12-pink-floral-27.jpg'
where sku = 'AK-12';
