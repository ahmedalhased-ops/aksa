-- Deletes the 5 mini-batch products (AK-05, AK-08, AK-14, AK-19, AK-20)
-- in case anne-klein-mini-batch.sql was already run.

delete from product_variants where sku in ('AK-05', 'AK-08', 'AK-14', 'AK-19', 'AK-20');

delete from products
where slug in ('ak-gold-oval-mesh', 'ak-silver-flower-bracelet', 'ak-diamond-simple', 'ak-nude-ceramic', 'ak-white-ceramic')
  and not exists (
    select 1 from product_variants where product_variants.product_id = products.id
  );
