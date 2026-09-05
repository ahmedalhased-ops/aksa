-- Deletes ALL Anne Klein products and variants from the store.

delete from product_variants
where product_id in (
  select p.id from products p
  join brands b on b.id = p.brand_id
  where b.slug = 'anne-klein'
);

delete from products
where brand_id in (
  select id from brands where slug = 'anne-klein'
);
