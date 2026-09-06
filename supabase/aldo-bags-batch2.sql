-- ALDO bags — batch 2, adds the 8 "Codex" photos (ALD-57 to ALD-64)
-- that were missed in batch 1. Prices read directly from filenames.
-- Run AFTER aldo-bags-batch1.sql and after uploading these 8 files
-- (original filenames, unchanged) to the "products" bucket root.

do $$
declare
  v_brand_id uuid;
  v_category_id uuid;
  v_base text := 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/';
  v_product_id uuid;
  v_rows text[][] := array[
    array['شنطة ALDO مونوغرام بني قفل التواء', 'aldo-57-monogram-brown-turnlock', 'بني', 'ALD-57', '27', 'Codex%20Image%20Sep%206%2C%202026%2C%2011_39_49%20PM-27OR.png'],
    array['شنطة ALDO ثنائي اللون بيج كريمي', 'aldo-58-twotone-tan-cream', 'بيج وكريمي', 'ALD-58', '22', 'Codex%20Image%20Sep%206%2C%202026%2C%2011_39_55%20PM-22OR.png'],
    array['شنطة ALDO مغلف كريمي مفاتيح', 'aldo-59-envelope-cream-keys', 'كريمي', 'ALD-59', '22', 'Codex%20Image%20Sep%206%2C%202026%2C%2011_40_00%20PM-22OR.png'],
    array['شنطة ALDO أسود زوايا فضية', 'aldo-60-black-silver-corners', 'أسود', 'ALD-60', '32', 'Codex%20Image%20Sep%206%2C%202026%2C%2011_40_05%20PM-32OR.png'],
    array['شنطة ALDO كلاتش مرصّع رصاصي', 'aldo-61-clutch-gunmetal-crystal', 'رصاصي', 'ALD-61', '22', 'Codex%20Image%20Sep%206%2C%202026%2C%2011_40_18%20PM-22OR.png'],
    array['شنطة ALDO كاميرا هندسي بني', 'aldo-62-camera-geometric-brown', 'بني وأسود', 'ALD-62', '22', 'Codex%20Image%20Sep%206%2C%202026%2C%2011_40_24%20PM-22OR.png'],
    array['شنطة ALDO أبيض مقبض نحتي قلوب', 'aldo-63-white-sculptural-hearts', 'أبيض', 'ALD-63', '22', 'Codex%20Image%20Sep%206%2C%202026%2C%2011_40_30%20PM-22OR.png'],
    array['شنطة ALDO توتس أسود إبزيم مزدوج', 'aldo-64-tote-black-double-buckle', 'أسود', 'ALD-64', '22', 'Codex%20Image%20Sep%206%2C%202026%2C%2011_40_35%20PM-22OR.png']
  ];
  v_row text[];
begin
  select id into v_brand_id from brands where slug = 'aldo';
  select id into v_category_id from categories where slug = 'bags';

  foreach v_row slice 1 in array v_rows
  loop
    insert into products (brand_id, category_id, name, slug, description, gender)
    values (v_brand_id, v_category_id, v_row[1], v_row[2], 'شنطة نسائية من مجموعة ALDO. تسليم فوري.', 'women')
    on conflict (slug) do nothing
    returning id into v_product_id;

    if v_product_id is not null then
      insert into product_variants (product_id, color, sku, price, stock, image_url)
      values (v_product_id, v_row[3], v_row[4], v_row[5]::numeric, 3, v_base || v_row[6]);
    end if;
  end loop;
end $$;
