-- ALDO bags — 56 products (ALD-01 to ALD-56).
-- Prices read directly from filenames (as instructed — no renaming).
-- ALDO brand already exists (slug 'aldo'). ALDO_BAG_10 and ALDO_BAG_47
-- have no price in their filename — excluded here, pending price.
-- Run AFTER uploading the original files from "ALDO BAG NEW"
-- to the "products" bucket root (original filenames, unchanged).

do $$
declare
  v_brand_id uuid;
  v_category_id uuid;
  v_base text := 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/';
  v_product_id uuid;
  v_rows text[][] := array[
    array['شنطة ALDO أزهار فراشات كريمي', 'aldo-01-floral-butterfly-cream', 'كريمي', 'ALD-01', '25', 'ALDO_BAG_01-25OR.jpg'],
    array['شنطة ALDO أزهار برية أبيض', 'aldo-02-wildflower-white', 'أبيض', 'ALD-02', '27', 'ALDO_BAG_03-27OR.jpg'],
    array['شنطة ALDO توتس بيج مع محفظة أزهار', 'aldo-03-tan-floral-pouch', 'بيج', 'ALD-03', '28', 'ALDO_BAG_04-28OR.jpg'],
    array['شنطة ALDO أزهار فراشات مفاتيح', 'aldo-04-floral-butterfly-keys', 'أبيض', 'ALD-04', '36', 'ALDO_BAG_05-36OR.jpg'],
    array['شنطة ALDO كيلي أسود قفل ذهبي', 'aldo-05-kelly-black-gold-lock', 'أسود', 'ALD-05', '24', 'ALDO_BAG_06-24OR.jpg'],
    array['شنطة ALDO كيلي هندسي وردي', 'aldo-06-kelly-geometric-pink', 'وردي', 'ALD-06', '23', 'ALDO_BAG_07--23OR.jpg'],
    array['شنطة ALDO بيركن بيج قفل', 'aldo-07-birkin-tan-padlock', 'بيج', 'ALD-07', '22', 'ALDO_BAG_08-22OR.jpg'],
    array['شنطة ALDO شيفرون أبيض وردي', 'aldo-08-chevron-white-pink', 'أبيض', 'ALD-08', '22', 'ALDO_BAG_09-22OR.jpg'],
    array['شنطة ALDO كلاتش بيج بسيط', 'aldo-09-clutch-taupe-plain', 'بيج', 'ALD-09', '19', 'ALDO_BAG_12-19OR.jpg'],
    array['شنطة ALDO دانتيل بني مرصّع', 'aldo-10-lace-brown-crystal', 'بني', 'ALD-10', '22', 'ALDO_BAG_13-22OR.jpg'],
    array['شنطة ALDO توتس أبيض قفل', 'aldo-11-tote-white-padlock', 'أبيض', 'ALD-11', '22', 'ALDO_BAG_14%20-22OR.jpg'],
    array['شنطة ALDO تويد أزهار كرزية', 'aldo-12-tweed-cherry-blossom', 'كريمي', 'ALD-12', '25', 'ALDO_BAG_15-25OR.jpg'],
    array['شنطة ALDO فانيتي ذهبي', 'aldo-13-vanity-gold-quilted', 'ذهبي', 'ALD-13', '27', 'ALDO_BAG_19-27OR.jpg'],
    array['شنطة ALDO دنيم أزهار كحلي', 'aldo-14-denim-floral-navy', 'كحلي', 'ALD-14', '27', 'ALDO_BAG_20-27OR.jpg'],
    array['شنطة ALDO ساتشل بني مفاتيح', 'aldo-15-satchel-brown-keys', 'بني', 'ALD-15', '22', 'ALDO_BAG_21-22OR.jpg'],
    array['شنطة ALDO ترتر أخضر مرصّع', 'aldo-16-sequin-green-crystal', 'أخضر غامق', 'ALD-16', '22', 'ALDO_BAG_22-22OR.jpg'],
    array['شنطة ALDO هندسي وردي أزهار', 'aldo-17-geometric-pink-floral', 'وردي وأبيض', 'ALD-17', '22', 'ALDO_BAG_23-22OR.jpg'],
    array['شنطة ALDO كروسبودي أسود سلسلة', 'aldo-18-crossbody-black-chain', 'أسود', 'ALD-18', '27', 'ALDO_BAG_25-27OR.jpg'],
    array['شنطة ALDO أزهار كريمي قلب', 'aldo-19-floral-cream-heart', 'كريمي', 'ALD-19', '22', 'ALDO_BAG_27-22OR.jpg'],
    array['شنطة ALDO مونوغرام بني شرابة', 'aldo-20-monogram-brown-tassel', 'بني', 'ALD-20', '27', 'ALDO_BAG_28-27OR.jpg'],
    array['شنطة ALDO بيركن كاميل حزام', 'aldo-21-birkin-camel-strap', 'كاميل', 'ALD-21', '21', 'ALDO_BAG_29-21OR.jpg'],
    array['شنطة ALDO بيركن أبيض قفل', 'aldo-22-birkin-white-padlock', 'أبيض', 'ALD-22', '22', 'ALDO_BAG_30-22OR.jpg'],
    array['شنطة ALDO كيلي أسود مفاتيح', 'aldo-23-kelly-black-keys', 'أسود', 'ALD-23', '22', 'ALDO_BAG_31-22OR.jpg'],
    array['شنطة ALDO كابيتونيه أسود سلسلة', 'aldo-24-quilted-black-chain', 'أسود', 'ALD-24', '27', 'ALDO_BAG_32-27OR.jpg'],
    array['شنطة ALDO توتس زيتي مع محفظة', 'aldo-25-tote-olive-pouch', 'زيتي', 'ALD-25', '21', 'ALDO_BAG_34-21OR-21OR.jpg'],
    array['شنطة ALDO كلاتش برونزي مرصّع', 'aldo-26-clutch-bronze-crystal', 'برونزي', 'ALD-26', '22', 'ALDO_BAG_35-22OR.jpg'],
    array['شنطة ALDO هلال أبيض حلقة', 'aldo-27-halfmoon-white-ring', 'أبيض', 'ALD-27', '22', 'ALDO_BAG_36-22OR.jpg'],
    array['شنطة ALDO بيركن أسود بطاقات', 'aldo-28-birkin-black-tags', 'أسود', 'ALD-28', '22', 'ALDO_BAG_37-22OR.jpg'],
    array['شنطة ALDO هوبو كونياك قفل التواء', 'aldo-29-hobo-cognac-twistlock', 'كونياك', 'ALD-29', '28', 'ALDO_BAG_39-28OR.jpg'],
    array['شنطة ALDO فيونكة أسود سلسلة', 'aldo-30-bow-black-chain', 'أسود', 'ALD-30', '22', 'ALDO_BAG_40-22OR.jpg'],
    array['شنطة ALDO كروكو أسود وشاح ليوبارد', 'aldo-31-croc-black-leopard-scarf', 'أسود', 'ALD-31', '23', 'ALDO_BAG_41-23OR.jpg'],
    array['شنطة ALDO لامع بيج قفل التواء', 'aldo-32-patent-taupe-twistlock', 'بيج', 'ALD-32', '22', 'ALDO_BAG_43-22OR.jpg'],
    array['شنطة ALDO كابيتونيه ذهبي سلسلة', 'aldo-33-quilted-gold-chain', 'ذهبي', 'ALD-33', '25', 'ALDO_BAG_45-25OR.jpg'],
    array['شنطة ALDO فلاب عنابي قفل التواء', 'aldo-34-flap-burgundy-twistlock', 'عنابي', 'ALD-34', '22', 'ALDO_BAG_48-22OR.jpg'],
    array['شنطة ALDO كيلي وردي فاتح', 'aldo-35-kelly-lightpink', 'وردي فاتح', 'ALD-35', '22', 'ALDO_BAG_49-22OR.jpg'],
    array['شنطة ALDO توال أزهار كحلي أبيض', 'aldo-36-toile-floral-navy-white', 'أبيض وكحلي', 'ALD-36', '23', 'ALDO_BAG_50-23OR.jpg'],
    array['شنطة ALDO أزهار فراشات كريمي إبزيم', 'aldo-37-floral-butterfly-buckle', 'كريمي', 'ALD-37', '24', 'ALDO_BAG_51-24OR.jpg'],
    array['شنطة ALDO ميني كابيتونيه أسود', 'aldo-38-mini-quilted-black', 'أسود', 'ALD-38', '17', 'ALDO_BAG_53-17OR.jpg'],
    array['شنطة ALDO توتس أسود بار ذهبي', 'aldo-39-tote-black-goldbar', 'أسود', 'ALD-39', '28', 'ALDO_BAG_54-28OR.jpg'],
    array['شنطة ALDO توتس زيتي مع محفظة ٢', 'aldo-40-tote-olive-pouch-2', 'زيتي', 'ALD-40', '21', 'ALDO_BAG_55-21OR.jpg'],
    array['شنطة ALDO كلاتش أسود حلقة ذهبية', 'aldo-41-clutch-black-goldring', 'أسود', 'ALD-41', '22', 'ALDO_BAG_57-220R.jpg'],
    array['شنطة ALDO فانيتي أزهار فراشات', 'aldo-42-vanity-floral-butterfly', 'أبيض', 'ALD-42', '22', 'ALDO_BAG_58-22OR.jpg'],
    array['شنطة ALDO هلال ذهبي', 'aldo-43-halfmoon-gold', 'ذهبي', 'ALD-43', '22', 'ALDO_BAG_59-22OR.jpg'],
    array['شنطة ALDO شيفرون بني أزهار', 'aldo-44-chevron-brown-floral', 'بني', 'ALD-44', '22', 'ALDO_BAG_60-22OR.jpg'],
    array['شنطة ALDO توتس أبيض قفل كبير', 'aldo-45-tote-white-padlock-large', 'أبيض', 'ALD-45', '32', 'ALDO_BAG_61-32OR.jpg'],
    array['شنطة ALDO كلاتش أسود حلقة معقوفة', 'aldo-46-clutch-black-hookring', 'أسود', 'ALD-46', '25', 'ALDO_BAG_62-25OR.jpg'],
    array['شنطة ALDO هلال ذهبي كتف', 'aldo-47-halfmoon-gold-shoulder', 'ذهبي', 'ALD-47', '28', 'ALDO_BAG_64-28OR.jpg'],
    array['شنطة ALDO توتس أسود حلقة ذهبية', 'aldo-48-tote-black-goldring', 'أسود', 'ALD-48', '22', 'ALDO_BAG_65-22OR.jpg'],
    array['شنطة ALDO كروكو أسود شرابة', 'aldo-49-croc-black-tassel', 'أسود', 'ALD-49', '25', 'ALDO_BAG_66-25OR.jpg'],
    array['شنطة ALDO كلاتش فضي مرصّع', 'aldo-50-clutch-silver-crystal', 'فضي', 'ALD-50', '22', 'ALDO_BAG_67-22OR.jpg'],
    array['شنطة ALDO كروكو أسود مع هوبو صغير', 'aldo-51-croc-black-minihobo-set', 'أسود', 'ALD-51', '25', 'ALDO_BAG_68-25OR.jpg'],
    array['شنطة ALDO هوبو وردي مثلث', 'aldo-52-hobo-pink-triangle', 'وردي', 'ALD-52', '23', 'ALDO_BAG_70-23OR.jpg'],
    array['شنطة ALDO أزهار فراشات أبيض مقابض ذهبية', 'aldo-53-floral-butterfly-goldhandles', 'أبيض', 'ALD-53', '24', 'ALDO_BAG_7224OR.jpg'],
    array['شنطة ALDO توتس أسود إبزيم ذهبي', 'aldo-54-tote-black-goldbuckle', 'أسود', 'ALD-54', '23', 'ALDO_BAG_73-23OR.jpg'],
    array['شنطة ALDO كلاتش كريمي مقبض ذهبي', 'aldo-55-clutch-cream-goldhandle', 'كريمي', 'ALD-55', '23', 'ALDO_BAG_74-23OR.jpg'],
    array['شنطة ALDO توتس أسود مع محفظة منقوشة', 'aldo-56-tote-black-embossed-clutch-set', 'أسود', 'ALD-56', '28', 'ALDO_BAG_75-28OR.jpg']
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
