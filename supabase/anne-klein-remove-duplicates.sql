-- Removes 4 confirmed duplicates: AK-24 (= AK-06), AK-25 (= AK-07), AK-26 (= AK-08),
-- AK-22 (= AK-10, identical faceted-gem photo). Verified by direct image comparison.

delete from product_variants where sku in ('AK-24', 'AK-25', 'AK-26', 'AK-22');

delete from products
where slug in ('ak-black-rect-gold', 'ak-black-rect-twotone', 'ak-hexagon-twotone-2', 'ak-faceted-gem')
  and not exists (
    select 1 from product_variants where product_variants.product_id = products.id
  );
