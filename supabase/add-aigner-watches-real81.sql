-- Adds all 81 Aigner watches with REAL data from the spreadsheet.
-- Run AFTER uploading all 81 files from Downloads/aigner-all81 to the "products" bucket root.

do $$
declare
  v_brand_id uuid;
  v_category_id uuid;
  v_base text := 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/';
  v_product_id uuid;
begin
  select id into v_brand_id from brands where slug = 'aigner';
  select id into v_category_id from categories where slug = 'watches';

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي - رقم 01', 'aigner-full-01', 'ساعة أقنر نسائي بتصميم فضي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي', 'AIGNER-001', 139.000, 1, v_base || 'aigner-full-01.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - أخضر وذهبي - رقم 02', 'aigner-full-02', 'ساعة أقنر نسائي بتصميم أخضر وذهبي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أخضر وذهبي', 'AIGNER-002', 109.000, 1, v_base || 'aigner-full-02.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي - رقم 03', 'aigner-full-03', 'ساعة أقنر نسائي بتصميم فضي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي', 'AIGNER-003', 149.000, 1, v_base || 'aigner-full-03.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - أبيض وفضي - رقم 04', 'aigner-full-04', 'ساعة أقنر نسائي بتصميم أبيض وفضي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أبيض وفضي', 'AIGNER-004', 119.000, 1, v_base || 'aigner-full-04.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي وذهبي وردي، مينا أسود - رقم 05', 'aigner-full-05', 'ساعة أقنر نسائي بتصميم فضي وذهبي وردي، مينا أسود. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي وردي، مينا أسود', 'AIGNER-005', 179.000, 1, v_base || 'aigner-full-05.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر رجالي - فضي - رقم 06', 'aigner-full-06', 'ساعة أقنر رجالي بتصميم فضي. تسليم فوري مع كامل ملحقات الماركة.', 'men')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي', 'AIGNER-006', 169.000, 1, v_base || 'aigner-full-06.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - ذهبي - رقم 07', 'aigner-full-07', 'ساعة أقنر نسائي بتصميم ذهبي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي', 'AIGNER-007', 219.000, 1, v_base || 'aigner-full-07.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي - رقم 08', 'aigner-full-08', 'ساعة أقنر نسائي بتصميم فضي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي', 'AIGNER-008', 129.000, 1, v_base || 'aigner-full-08.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي - رقم 09', 'aigner-full-09', 'ساعة أقنر نسائي بتصميم فضي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي', 'AIGNER-009', 149.000, 1, v_base || 'aigner-full-09.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر رجالي - أسود وذهبي وردي - رقم 10', 'aigner-full-10', 'ساعة أقنر رجالي بتصميم أسود وذهبي وردي. تسليم فوري مع كامل ملحقات الماركة.', 'men')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود وذهبي وردي', 'AIGNER-010', 198.000, 1, v_base || 'aigner-full-10.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - أسود وذهبي - رقم 11', 'aigner-full-11', 'ساعة أقنر نسائي بتصميم أسود وذهبي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود وذهبي', 'AIGNER-011', 119.000, 1, v_base || 'aigner-full-11.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - ذهبي - رقم 12', 'aigner-full-12', 'ساعة أقنر نسائي بتصميم ذهبي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي', 'AIGNER-012', 179.000, 1, v_base || 'aigner-full-12.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي وذهبي، مينا أبيض - رقم 13', 'aigner-full-13', 'ساعة أقنر نسائي بتصميم فضي وذهبي، مينا أبيض. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي، مينا أبيض', 'AIGNER-013', 198.000, 1, v_base || 'aigner-full-13.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي وذهبي، مينا أخضر - رقم 14', 'aigner-full-14', 'ساعة أقنر نسائي بتصميم فضي وذهبي، مينا أخضر. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي، مينا أخضر', 'AIGNER-014', 179.000, 1, v_base || 'aigner-full-14.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - بنفسجي وذهبي - رقم 15', 'aigner-full-15', 'ساعة أقنر نسائي بتصميم بنفسجي وذهبي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'بنفسجي وذهبي', 'AIGNER-015', 69.000, 1, v_base || 'aigner-full-15.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي وذهبي وردي، مينا وردي - رقم 16', 'aigner-full-16', 'ساعة أقنر نسائي بتصميم فضي وذهبي وردي، مينا وردي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي وردي، مينا وردي', 'AIGNER-016', 179.000, 1, v_base || 'aigner-full-16.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي، مينا أسود - رقم 17', 'aigner-full-17', 'ساعة أقنر نسائي بتصميم فضي، مينا أسود. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي، مينا أسود', 'AIGNER-017', 109.000, 1, v_base || 'aigner-full-17.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي - رقم 18', 'aigner-full-18', 'ساعة أقنر نسائي بتصميم فضي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي', 'AIGNER-018', 129.000, 1, v_base || 'aigner-full-18.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي وذهبي وردي، مينا وردي - رقم 19', 'aigner-full-19', 'ساعة أقنر نسائي بتصميم فضي وذهبي وردي، مينا وردي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي وردي، مينا وردي', 'AIGNER-019', 169.000, 1, v_base || 'aigner-full-19.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي وذهبي، مينا أبيض - رقم 20', 'aigner-full-20', 'ساعة أقنر نسائي بتصميم فضي وذهبي، مينا أبيض. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي، مينا أبيض', 'AIGNER-020', 189.000, 1, v_base || 'aigner-full-20.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - ذهبي - رقم 21', 'aigner-full-21', 'ساعة أقنر نسائي بتصميم ذهبي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي', 'AIGNER-021', 198.000, 1, v_base || 'aigner-full-21.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - ذهبي، سوار شبكي - رقم 22', 'aigner-full-22', 'ساعة أقنر نسائي بتصميم ذهبي، سوار شبكي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي، سوار شبكي', 'AIGNER-022', 159.000, 1, v_base || 'aigner-full-22.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي وذهبي، سوار شبكي - رقم 23', 'aigner-full-23', 'ساعة أقنر نسائي بتصميم فضي وذهبي، سوار شبكي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي، سوار شبكي', 'AIGNER-023', 159.000, 1, v_base || 'aigner-full-23.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - أبيض وذهبي وردي - رقم 24', 'aigner-full-24', 'ساعة أقنر نسائي بتصميم أبيض وذهبي وردي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أبيض وذهبي وردي', 'AIGNER-024', 109.000, 1, v_base || 'aigner-full-24.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي وذهبي - رقم 25', 'aigner-full-25', 'ساعة أقنر نسائي بتصميم فضي وذهبي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي', 'AIGNER-025', 169.000, 1, v_base || 'aigner-full-25.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر رجالي - فضي، سوار شبكي - رقم 26', 'aigner-full-26', 'ساعة أقنر رجالي بتصميم فضي، سوار شبكي. تسليم فوري مع كامل ملحقات الماركة.', 'men')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي، سوار شبكي', 'AIGNER-026', 109.000, 1, v_base || 'aigner-full-26.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - ذهبي - رقم 27', 'aigner-full-27', 'ساعة أقنر نسائي بتصميم ذهبي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي', 'AIGNER-027', 159.000, 1, v_base || 'aigner-full-27.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي - رقم 28', 'aigner-full-28', 'ساعة أقنر نسائي بتصميم فضي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي', 'AIGNER-028', 149.000, 1, v_base || 'aigner-full-28.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي - رقم 29', 'aigner-full-29', 'ساعة أقنر نسائي بتصميم فضي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي', 'AIGNER-029', 165.000, 1, v_base || 'aigner-full-29.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر رجالي - فضي وذهبي وردي، مينا أبيض - رقم 30', 'aigner-full-30', 'ساعة أقنر رجالي بتصميم فضي وذهبي وردي، مينا أبيض. تسليم فوري مع كامل ملحقات الماركة.', 'men')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي وردي، مينا أبيض', 'AIGNER-030', 159.000, 1, v_base || 'aigner-full-30.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي وذهبي، مينا أزرق - رقم 31', 'aigner-full-31', 'ساعة أقنر نسائي بتصميم فضي وذهبي، مينا أزرق. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي، مينا أزرق', 'AIGNER-031', 179.000, 1, v_base || 'aigner-full-31.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - ذهبي، مينا أخضر - رقم 32', 'aigner-full-32', 'ساعة أقنر نسائي بتصميم ذهبي، مينا أخضر. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي، مينا أخضر', 'AIGNER-032', 169.000, 1, v_base || 'aigner-full-32.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي وذهبي، سوار شبكي - رقم 33', 'aigner-full-33', 'ساعة أقنر نسائي بتصميم فضي وذهبي، سوار شبكي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي، سوار شبكي', 'AIGNER-033', 179.000, 1, v_base || 'aigner-full-33.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي - رقم 34', 'aigner-full-34', 'ساعة أقنر نسائي بتصميم فضي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي', 'AIGNER-034', 119.000, 1, v_base || 'aigner-full-34.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - كحلي وفضي - رقم 35', 'aigner-full-35', 'ساعة أقنر نسائي بتصميم كحلي وفضي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كحلي وفضي', 'AIGNER-035', 109.000, 1, v_base || 'aigner-full-35.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي وذهبي، مينا أحمر - رقم 36', 'aigner-full-36', 'ساعة أقنر نسائي بتصميم فضي وذهبي، مينا أحمر. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي، مينا أحمر', 'AIGNER-036', 189.000, 1, v_base || 'aigner-full-36.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي - رقم 37', 'aigner-full-37', 'ساعة أقنر نسائي بتصميم فضي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي', 'AIGNER-037', 139.000, 1, v_base || 'aigner-full-37.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي وذهبي، مينا أخضر - رقم 38', 'aigner-full-38', 'ساعة أقنر نسائي بتصميم فضي وذهبي، مينا أخضر. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي، مينا أخضر', 'AIGNER-038', 169.000, 1, v_base || 'aigner-full-38.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - ذهبي، مينا أخضر - رقم 39', 'aigner-full-39', 'ساعة أقنر نسائي بتصميم ذهبي، مينا أخضر. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي، مينا أخضر', 'AIGNER-039', 139.000, 1, v_base || 'aigner-full-39.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي وذهبي وردي، مينا أزرق فاتح - رقم 40', 'aigner-full-40', 'ساعة أقنر نسائي بتصميم فضي وذهبي وردي، مينا أزرق فاتح. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي وردي، مينا أزرق فاتح', 'AIGNER-040', 179.000, 1, v_base || 'aigner-full-40.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر رجالي - فضي، مينا أزرق - رقم 41', 'aigner-full-41', 'ساعة أقنر رجالي بتصميم فضي، مينا أزرق. تسليم فوري مع كامل ملحقات الماركة.', 'men')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي، مينا أزرق', 'AIGNER-041', 179.000, 1, v_base || 'aigner-full-41.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي وذهبي، مينا أسود - رقم 42', 'aigner-full-42', 'ساعة أقنر نسائي بتصميم فضي وذهبي، مينا أسود. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي، مينا أسود', 'AIGNER-042', 149.000, 1, v_base || 'aigner-full-42.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - أبيض وذهبي - رقم 43', 'aigner-full-43', 'ساعة أقنر نسائي بتصميم أبيض وذهبي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أبيض وذهبي', 'AIGNER-043', 119.000, 1, v_base || 'aigner-full-43.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي وذهبي، مينا أحمر - رقم 44', 'aigner-full-44', 'ساعة أقنر نسائي بتصميم فضي وذهبي، مينا أحمر. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي، مينا أحمر', 'AIGNER-044', 179.000, 1, v_base || 'aigner-full-44.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - أبيض وذهبي - رقم 45', 'aigner-full-45', 'ساعة أقنر نسائي بتصميم أبيض وذهبي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أبيض وذهبي', 'AIGNER-045', 119.000, 1, v_base || 'aigner-full-45.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - أبيض وذهبي - رقم 46', 'aigner-full-46', 'ساعة أقنر نسائي بتصميم أبيض وذهبي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أبيض وذهبي', 'AIGNER-046', 98.000, 1, v_base || 'aigner-full-46.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - ذهبي وردي - رقم 47', 'aigner-full-47', 'ساعة أقنر نسائي بتصميم ذهبي وردي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي وردي', 'AIGNER-047', 159.000, 1, v_base || 'aigner-full-47.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - أبيض وذهبي وردي - رقم 48', 'aigner-full-48', 'ساعة أقنر نسائي بتصميم أبيض وذهبي وردي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أبيض وذهبي وردي', 'AIGNER-048', 149.000, 1, v_base || 'aigner-full-48.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي وذهبي، مينا أزرق - رقم 49', 'aigner-full-49', 'ساعة أقنر نسائي بتصميم فضي وذهبي، مينا أزرق. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي، مينا أزرق', 'AIGNER-049', 179.000, 1, v_base || 'aigner-full-49.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي وذهبي، مينا أخضر - رقم 50', 'aigner-full-50', 'ساعة أقنر نسائي بتصميم فضي وذهبي، مينا أخضر. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي، مينا أخضر', 'AIGNER-050', 149.000, 1, v_base || 'aigner-full-50.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي وذهبي، مينا أزرق - رقم 51', 'aigner-full-51', 'ساعة أقنر نسائي بتصميم فضي وذهبي، مينا أزرق. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي، مينا أزرق', 'AIGNER-051', 149.000, 1, v_base || 'aigner-full-51.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - ذهبي - رقم 52', 'aigner-full-52', 'ساعة أقنر نسائي بتصميم ذهبي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي', 'AIGNER-052', 179.000, 1, v_base || 'aigner-full-52.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - بنفسجي وذهبي - رقم 53', 'aigner-full-53', 'ساعة أقنر نسائي بتصميم بنفسجي وذهبي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'بنفسجي وذهبي', 'AIGNER-053', 69.000, 1, v_base || 'aigner-full-53.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي وذهبي، مينا أبيض - رقم 54', 'aigner-full-54', 'ساعة أقنر نسائي بتصميم فضي وذهبي، مينا أبيض. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي، مينا أبيض', 'AIGNER-054', 149.000, 1, v_base || 'aigner-full-54.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي وذهبي، مينا أخضر - رقم 55', 'aigner-full-55', 'ساعة أقنر نسائي بتصميم فضي وذهبي، مينا أخضر. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي، مينا أخضر', 'AIGNER-055', 159.000, 1, v_base || 'aigner-full-55.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي وذهبي وردي، مينا وردي - رقم 56', 'aigner-full-56', 'ساعة أقنر نسائي بتصميم فضي وذهبي وردي، مينا وردي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي وردي، مينا وردي', 'AIGNER-056', 159.000, 1, v_base || 'aigner-full-56.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي وذهبي، مينا أخضر - رقم 57', 'aigner-full-57', 'ساعة أقنر نسائي بتصميم فضي وذهبي، مينا أخضر. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي، مينا أخضر', 'AIGNER-057', 179.000, 1, v_base || 'aigner-full-57.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي وذهبي، مينا أخضر - رقم 58', 'aigner-full-58', 'ساعة أقنر نسائي بتصميم فضي وذهبي، مينا أخضر. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي، مينا أخضر', 'AIGNER-058', 169.000, 1, v_base || 'aigner-full-58.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي - رقم 59', 'aigner-full-59', 'ساعة أقنر نسائي بتصميم فضي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي', 'AIGNER-059', 149.000, 1, v_base || 'aigner-full-59.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي، مينا أسود - رقم 60', 'aigner-full-60', 'ساعة أقنر نسائي بتصميم فضي، مينا أسود. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي، مينا أسود', 'AIGNER-060', 149.000, 1, v_base || 'aigner-full-60.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - بنفسجي وذهبي - رقم 61', 'aigner-full-61', 'ساعة أقنر نسائي بتصميم بنفسجي وذهبي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'بنفسجي وذهبي', 'AIGNER-061', 99.000, 1, v_base || 'aigner-full-61.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - أسود وذهبي - رقم 62', 'aigner-full-62', 'ساعة أقنر نسائي بتصميم أسود وذهبي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود وذهبي', 'AIGNER-062', 99.000, 1, v_base || 'aigner-full-62.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي وذهبي، مينا أزرق - رقم 63', 'aigner-full-63', 'ساعة أقنر نسائي بتصميم فضي وذهبي، مينا أزرق. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي، مينا أزرق', 'AIGNER-063', 149.000, 1, v_base || 'aigner-full-63.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي وذهبي وردي، مينا وردي - رقم 64', 'aigner-full-64', 'ساعة أقنر نسائي بتصميم فضي وذهبي وردي، مينا وردي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي وردي، مينا وردي', 'AIGNER-064', 179.000, 1, v_base || 'aigner-full-64.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي - رقم 65', 'aigner-full-65', 'ساعة أقنر نسائي بتصميم فضي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي', 'AIGNER-065', 149.000, 1, v_base || 'aigner-full-65.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - ذهبي - رقم 66', 'aigner-full-66', 'ساعة أقنر نسائي بتصميم ذهبي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي', 'AIGNER-066', 198.000, 1, v_base || 'aigner-full-66.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي - رقم 67', 'aigner-full-67', 'ساعة أقنر نسائي بتصميم فضي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي', 'AIGNER-067', 159.000, 1, v_base || 'aigner-full-67.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي - رقم 68', 'aigner-full-68', 'ساعة أقنر نسائي بتصميم فضي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي', 'AIGNER-068', 119.000, 1, v_base || 'aigner-full-68.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - كحلي وأسود وفضي - رقم 69', 'aigner-full-69', 'ساعة أقنر نسائي بتصميم كحلي وأسود وفضي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كحلي وأسود وفضي', 'AIGNER-069', 119.000, 1, v_base || 'aigner-full-69.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - أزرق وفضي - رقم 70', 'aigner-full-70', 'ساعة أقنر نسائي بتصميم أزرق وفضي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أزرق وفضي', 'AIGNER-070', 79.000, 1, v_base || 'aigner-full-70.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - ذهبي وردي، سوار شبكي ومينا وردي - رقم 71', 'aigner-full-71', 'ساعة أقنر نسائي بتصميم ذهبي وردي، سوار شبكي ومينا وردي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي وردي، سوار شبكي ومينا وردي', 'AIGNER-071', 159.000, 1, v_base || 'aigner-full-71.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - ذهبي، مينا أخضر - رقم 72', 'aigner-full-72', 'ساعة أقنر نسائي بتصميم ذهبي، مينا أخضر. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'ذهبي، مينا أخضر', 'AIGNER-072', 169.000, 1, v_base || 'aigner-full-72.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي وذهبي - رقم 73', 'aigner-full-73', 'ساعة أقنر نسائي بتصميم فضي وذهبي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي', 'AIGNER-073', 139.000, 1, v_base || 'aigner-full-73.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي، سوار شبكي ومينا أخضر - رقم 74', 'aigner-full-74', 'ساعة أقنر نسائي بتصميم فضي، سوار شبكي ومينا أخضر. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي، سوار شبكي ومينا أخضر', 'AIGNER-074', 149.000, 1, v_base || 'aigner-full-74.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي وذهبي، مينا أخضر - رقم 75', 'aigner-full-75', 'ساعة أقنر نسائي بتصميم فضي وذهبي، مينا أخضر. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي، مينا أخضر', 'AIGNER-075', 169.000, 1, v_base || 'aigner-full-75.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - أبيض وفضي وذهبي وردي - رقم 76', 'aigner-full-76', 'ساعة أقنر نسائي بتصميم أبيض وفضي وذهبي وردي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أبيض وفضي وذهبي وردي', 'AIGNER-076', 89.000, 1, v_base || 'aigner-full-76.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي - رقم 77', 'aigner-full-77', 'ساعة أقنر نسائي بتصميم فضي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي', 'AIGNER-077', 129.000, 1, v_base || 'aigner-full-77.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي وذهبي، مينا أخضر - رقم 78', 'aigner-full-78', 'ساعة أقنر نسائي بتصميم فضي وذهبي، مينا أخضر. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي، مينا أخضر', 'AIGNER-078', 179.000, 1, v_base || 'aigner-full-78.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - فضي وذهبي، مينا أخضر - رقم 79', 'aigner-full-79', 'ساعة أقنر نسائي بتصميم فضي وذهبي، مينا أخضر. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي وذهبي، مينا أخضر', 'AIGNER-079', 179.000, 1, v_base || 'aigner-full-79.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر رجالي - فضي - رقم 80', 'aigner-full-80', 'ساعة أقنر رجالي بتصميم فضي. تسليم فوري مع كامل ملحقات الماركة.', 'men')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'فضي', 'AIGNER-080', 169.000, 1, v_base || 'aigner-full-80.png');
  end if;
  v_product_id := null;

  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'ساعة أقنر نسائي - أسود وذهبي وردي - رقم 81', 'aigner-full-81', 'ساعة أقنر نسائي بتصميم أسود وذهبي وردي. تسليم فوري مع كامل ملحقات الماركة.', 'women')
  on conflict (slug) do nothing
  returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود وذهبي وردي', 'AIGNER-081', 69.000, 1, v_base || 'aigner-full-81.png');
  end if;
  v_product_id := null;

end $$;
