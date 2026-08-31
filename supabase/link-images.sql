-- Links the uploaded photos in the "products" storage bucket to their
-- matching product_variants row, by SKU. Run AFTER uploading the files
-- from product-photos/ to the products bucket.

update product_variants set image_url =
  'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/bhpc-knot-tote-black.png'
  where sku = 'BHPC-KNOT-BLK';

update product_variants set image_url =
  'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/bhpc-knot-tote-brown.png'
  where sku = 'BHPC-KNOT-BRN';

update product_variants set image_url =
  'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/uspa-embossed-tote-black.png'
  where sku = 'USPA-EMB-BLK';

update product_variants set image_url =
  'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/daisy-dixon-watch.png'
  where sku = 'DD-WCH-GRY';

update product_variants set image_url =
  'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/anne-klein-watch.png'
  where sku = 'AK-WCH-BURG';

update product_variants set image_url =
  'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/aigner-womens-watch.png'
  where sku = 'AIG-W-PINK';

update product_variants set image_url =
  'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/aigner-mens-watch.png'
  where sku = 'AIG-M-ORNG';

update product_variants set image_url =
  'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/guy-laroche-pen.png'
  where sku in ('GL-PEN-BLKSLV', 'GL-PEN-SLVGLD');

update product_variants set image_url =
  'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/cerruti-watch.png'
  where sku = 'CER-WCH-SLVGLD';

update product_variants set image_url =
  'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/aldo-monogram-tote.png'
  where sku = 'ALDO-MONO-CRM';

update product_variants set image_url =
  'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/aigner-monogram-tote.png'
  where sku = 'AIG-MONO-BRN';

update product_variants set image_url =
  'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/dkny-classic-watch.png'
  where sku = 'DKNY-CLS-SLV';

update product_variants set image_url =
  'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/kurt-geiger-kensington-gold.png'
  where sku = 'KG-KEN-GOLD';

update product_variants set image_url =
  'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/jwpei-gabbi-mini.png'
  where sku = 'JWPEI-GABBI-TPE';
