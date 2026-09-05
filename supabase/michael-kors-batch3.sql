-- Michael Kors bags — batch 3, 60 products (MK-21 to MK-80).
-- Prices read directly from filenames (as instructed — no renaming).
-- MK_BAG_80's photo duplicated MK_BAG_83 + MK_BAG_84 (shown together) so it
-- was skipped to avoid a duplicate. MK_BAG_37 has no price in its filename —
-- excluded here, pending price confirmation.
-- Run AFTER uploading the original files from "MK BAG"
-- to the "products" bucket root (original filenames, unchanged).

do $$
declare
  v_brand_id uuid;
  v_category_id uuid;
  v_base text := 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/';
  v_product_id uuid;
  v_rows text[][] := array[
    -- [name_ar, slug, color_ar, sku, price, filename_encoded]
    array['شنطة Michael Kors بولينغ مونوغرام بني', 'mk-bowling-monogram-brown', 'بني', 'MK-21', '49', 'MK%20-64-%2849OR%29.jpg'],
    array['شنطة Michael Kors هاميلتون مرصّعة رمادي', 'mk-hamilton-crystal-grey', 'رمادي وكحلي', 'MK-22', '55', 'MK_BAG_21%20%2855OR%29.jpg'],
    array['شنطة Michael Kors هوبو جاكار كحلي', 'mk-hobo-jacquard-navy', 'كحلي', 'MK-23', '49', 'MK_BAG_22%20%2849OR%29.jpg'],
    array['شنطة Michael Kors مونوغرام كلاتش كريمي', 'mk-monogram-clutch-cream', 'كريمي وذهبي', 'MK-24', '48', 'MK_BAG_23%20%2848OR%29.jpg'],
    array['شنطة Michael Kors كروسبودي عنابي', 'mk-crossbody-burgundy', 'عنابي', 'MK-25', '55', 'MK_BAG_24%20%2855%20OR%29.jpg'],
    array['شنطة Michael Kors مونوغرام دائري عنابي', 'mk-monogram-dome-burgundy', 'عنابي', 'MK-26', '38', 'MK_BAG_25%20%2838OR%29.jpg'],
    array['شنطة Michael Kors محفظة سلسلة عنابي', 'mk-wallet-chain-burgundy', 'عنابي', 'MK-27', '55', 'MK_BAG_26%20%2855OR%29.jpg'],
    array['شنطة Michael Kors مونوغرام أبيض ذهبي', 'mk-monogram-white-gold', 'أبيض', 'MK-28', '48', 'MK_BAG_27%20%2848OR%29.jpg'],
    array['شنطة Michael Kors بولينغ جاكار أسود', 'mk-bowling-jacquard-black', 'أسود وفضي', 'MK-29', '45', 'MK_BAG_28%20%2845OR%29.jpg'],
    array['شنطة Michael Kors معدني ذهبي مع محفظة', 'mk-metallic-gold-coinpurse', 'ذهبي', 'MK-30', '38', 'MK_BAG_29%20%2838OR%29.jpg'],
    array['شنطة Michael Kors مغلف متعدد الملمس بني', 'mk-envelope-multitexture-brown', 'بني', 'MK-31', '69', 'MK_BAG_30%20%2869OR%29.jpg'],
    array['شنطة Michael Kors كروكو أسود لامع مع محفظة', 'mk-croc-black-coinpurse', 'أسود', 'MK-32', '39', 'MK_BAG_31%20%2839OR%29.jpg'],
    array['شنطة Michael Kors توتس صغير كريمي', 'mk-small-tote-cream', 'كريمي', 'MK-33', '38', 'MK_BAG_33%20%2838OR%29.jpg'],
    array['شنطة Michael Kors توتس صغير ذهبي كاكي', 'mk-small-tote-gold-khaki', 'ذهبي', 'MK-34', '59', 'MK_BAG_34%20%2859OR%29.jpg'],
    array['شنطة Michael Kors مونوغرام معدني مخطط', 'mk-monogram-metallic-striped', 'أبيض وفضي', 'MK-35', '55', 'MK_BAG_35%20%2855OR%29.jpg'],
    array['شنطة Michael Kors كاميرا أسود بقفل أمامي', 'mk-camera-black-lock', 'أسود', 'MK-36', '45', 'MK_BAG_36%20%2845%20OR%29.jpg'],
    array['شنطة Michael Kors هوبو أسود محبب', 'mk-hobo-pebbled-black', 'أسود', 'MK-38', '49', 'MK_BAG_38%20%2849OR%29.jpg'],
    array['شنطة Michael Kors سلة مونوغرام أسود', 'mk-bucket-monogram-black', 'أسود', 'MK-39', '58', 'MK_BAG_39%20%2858OR%29.jpg'],
    array['شنطة Michael Kors توتس صغير كونياك', 'mk-small-tote-cognac', 'بني', 'MK-40', '42', 'MK_BAG_40%20%2842OR%29.jpg'],
    array['شنطة Michael Kors توتس مونوغرام بني', 'mk-tote-monogram-brown-small', 'بني', 'MK-41', '59', 'MK_BAG_41%20%2859OR%29.jpg'],
    array['شنطة Michael Kors مونوغرام أبيض أسود', 'mk-monogram-colorblock-white-black', 'أبيض وأسود', 'MK-42', '49', 'MK_BAG_43%20%2849OR%29.jpg'],
    array['شنطة Michael Kors كاميرا جاكار عنابي', 'mk-camera-jacquard-burgundy', 'عنابي', 'MK-43', '35', 'MK_BAG_44%20%2835OR%29.jpg'],
    array['شنطة Michael Kors فلاب بيج مرصّع', 'mk-flap-taupe-studded', 'بيج', 'MK-44', '59', 'MK_BAG_45%20%2859OR%29.jpg'],
    array['شنطة Michael Kors مونوغرام توتس بيج', 'mk-monogram-tote-tan', 'بيج', 'MK-45', '59', 'MK_BAG_46%20%2859OR%29.jpg'],
    array['شنطة Michael Kors مونوغرام أبيض بني', 'mk-monogram-white-tan-chain', 'أبيض', 'MK-46', '37', 'MK_BAG_47%20%2837OR%29.jpg'],
    array['شنطة Michael Kors كاميرا أسود بسيط', 'mk-camera-plain-black', 'أسود', 'MK-47', '36', 'MK_BAG_48%20%2836OR%29.jpg'],
    array['شنطة Michael Kors توتس صغير وردي', 'mk-small-tote-pink', 'أبيض ووردي', 'MK-48', '38', 'MK_BAG_49%20%2838OR%29.jpg'],
    array['شنطة Michael Kors مونوغرام بني مخطط', 'mk-monogram-brown-striped', 'بني', 'MK-49', '55', 'MK_BAG_50%20%2855OR%29.jpg'],
    array['شنطة Michael Kors توتس عنابي شعار أبيض', 'mk-tote-burgundy-white-logo', 'عنابي', 'MK-50', '49', 'MK_BAG_51%20%2849OR%29.jpg'],
    array['شنطة Michael Kors مونوغرام توتس أسود صغير', 'mk-monogram-tote-black-small', 'أسود', 'MK-51', '55', 'MK_BAG_52%20%2855OR%29.jpg'],
    array['شنطة Michael Kors مونوغرام أبيض بني توتس', 'mk-monogram-tote-tan-colorblock', 'أبيض وبني', 'MK-52', '49', 'MK_BAG_53%20%2849OR%29.jpg'],
    array['شنطة Michael Kors توتس بني شعار أبيض', 'mk-tote-brown-white-logo', 'بني', 'MK-53', '55', 'MK_BAG_54%20%2855OR%29.jpg'],
    array['شنطة Michael Kors توتس أسود صغير مع محفظة', 'mk-tote-black-small-wallet', 'أسود', 'MK-54', '42', 'MK_BAG_55%20%2842OR%29.jpg'],
    array['شنطة Michael Kors كروسبودي عنابي سلسلة', 'mk-crossbody-burgundy-chain-lock', 'عنابي', 'MK-55', '59', 'MK_BAG_56%20%2859%20OR%29.jpg'],
    array['شنطة Michael Kors مونوغرام أبيض وردي', 'mk-monogram-cream-pink-trim', 'أبيض ووردي', 'MK-56', '38', 'MK_BAG_57%20%2838OR%29.jpg'],
    array['شنطة Michael Kors مونوغرام بيج دائري', 'mk-monogram-dome-beige', 'بيج', 'MK-57', '38', 'MK_BAG_58%20%2838OR%29.jpg'],
    array['شنطة Michael Kors مونوغرام بني غامق', 'mk-monogram-dark-brown-strap', 'بني غامق', 'MK-58', '45', 'MK_BAG_59%20%2845%20OR%29.jpg'],
    array['شنطة Michael Kors مونوغرام بني أسود فلاب', 'mk-monogram-dark-flap-lock', 'بني وأسود', 'MK-59', '55', 'MK_BAG_60%20%2855%20OR%29.jpg'],
    array['شنطة Michael Kors توتس مونوغرام بني غامق', 'mk-tote-monogram-dark-brown', 'بني غامق', 'MK-60', '55', 'MK_BAG_61%20%2855OR%29.jpg'],
    array['شنطة Michael Kors معدني فضي مرآة', 'mk-metallic-silver-mirror', 'فضي', 'MK-61', '35', 'MK_BAG_62%20%2835OR%29.jpg'],
    array['شنطة Michael Kors توتس كحلي صغير', 'mk-small-tote-navy', 'كحلي', 'MK-62', '49', 'MK_BAG_63%2849%20OR%29.jpg'],
    array['شنطة Michael Kors مونوغرام أبيض فلاب', 'mk-monogram-white-flap-lock', 'أبيض', 'MK-63', '55', 'MK_BAG_65%20%2855OR%29.jpg'],
    array['شنطة Michael Kors توتس معدني وردي ذهبي', 'mk-tote-rosegold-metallic', 'ذهبي وردي', 'MK-64', '39', 'MK_BAG_66%20%2839OR%29.jpg'],
    array['شنطة Michael Kors كاميرا جاكار أبيض ذهبي', 'mk-camera-jacquard-white-gold', 'أبيض وذهبي', 'MK-65', '35', 'MK_BAG_67%20%2835OR%29.jpg'],
    array['شنطة Michael Kors مونوغرام أسود رمادي توتس', 'mk-monogram-tote-black-grey', 'أسود ورمادي', 'MK-66', '49', 'MK_BAG_68%20%2849OR%29.jpg'],
    array['شنطة Michael Kors توتس معدني ذهبي', 'mk-tote-gold-metallic', 'ذهبي', 'MK-67', '55', 'MK_BAG_69%20%2855OR%29.jpg'],
    array['شنطة Michael Kors محفظة سلسلة بني إبزيم', 'mk-wallet-chain-brown-buckle', 'بني', 'MK-68', '39', 'MK_BAG_70%20%2839OR%29.jpg'],
    array['شنطة Michael Kors ساتشل جلد أسود إبزيم', 'mk-satchel-black-buckle', 'أسود', 'MK-69', '55', 'MK_BAG_71%20%2855OR%29.jpg'],
    array['شنطة Michael Kors مونوغرام دائري وردي', 'mk-monogram-dome-pink-white', 'أبيض ووردي', 'MK-70', '37', 'MK_BAG_72%20%2837OR%29.jpg'],
    array['شنطة Michael Kors توتس بني شعار', 'mk-tote-brown-logo-1', 'بني', 'MK-71', '49', 'MK_BAG_73%20%2849OR%29.jpg'],
    array['شنطة Michael Kors توتس بني شعار كبير', 'mk-tote-brown-logo-2', 'بني', 'MK-72', '55', 'MK_BAG_74%20%2855OR%29.jpg'],
    array['شنطة Michael Kors دائري أسود بسيط', 'mk-dome-plain-black', 'أسود', 'MK-73', '38', 'MK_BAG_75%20%2838OR%29.jpg'],
    array['شنطة Michael Kors هاوندستوث توتس بني', 'mk-houndstooth-tote-brown', 'بني وأبيض', 'MK-74', '59', 'MK_BAG_76%20%2859OR%29.jpg'],
    array['شنطة Michael Kors فلاب أسود بسيط', 'mk-flap-plain-black-1', 'أسود', 'MK-75', '59', 'MK_BAG_77%20%2859OR%29.jpg'],
    array['شنطة Michael Kors فلاب أسود بسيط صغير', 'mk-flap-plain-black-2', 'أسود', 'MK-76', '55', 'MK_BAG_78%20%2855OR%29.jpg'],
    array['شنطة Michael Kors فلاب بني مرصّع بمسامير', 'mk-flap-brown-studded', 'بني', 'MK-77', '69', 'MK_BAG_79%20%2869OR%29.jpg'],
    array['شنطة Michael Kors توتس أبيض مونوغرام', 'mk-tote-white-monogram', 'أبيض', 'MK-78', '59', 'MK_BAG_81%20%2859OR%29.jpg'],
    array['شنطة Michael Kors بوسطن عنابي منقوش', 'mk-boston-burgundy-pattern', 'عنابي', 'MK-79', '45', 'MK_BAG_82%20%2845OR%29.jpg'],
    array['شنطة Michael Kors سادل بني إبزيم', 'mk-saddle-brown-buckle', 'بني', 'MK-80', '45', 'MK_BAG_83%20%2845%20OR%29.jpg'],
    array['شنطة Michael Kors جاكار مخطط كحلي أبيض', 'mk-jacquard-striped-navy-white', 'كحلي وأبيض', 'MK-81', '45', 'MK_BAG_84%20%2845OR%29.jpg'],
    array['شنطة Michael Kors توتس أبيض فلاب صغير', 'mk-tote-white-flap-small', 'أبيض', 'MK-82', '59', 'MK_BAG_85%20%2859OR%29.jpg'],
    array['شنطة Michael Kors جاكار أسود فضي', 'mk-jacquard-black-silver', 'أسود وفضي', 'MK-83', '35', 'MK_BAG_9%2032%20%20%2835OR%29.jpg']
  ];
  v_row text[];
begin
  select id into v_brand_id from brands where slug = 'michael-kors';
  select id into v_category_id from categories where slug = 'bags';

  foreach v_row slice 1 in array v_rows
  loop
    insert into products (brand_id, category_id, name, slug, description, gender)
    values (v_brand_id, v_category_id, v_row[1], v_row[2], 'شنطة نسائية من مجموعة Michael Kors. تسليم فوري.', 'women')
    on conflict (slug) do nothing
    returning id into v_product_id;

    if v_product_id is not null then
      insert into product_variants (product_id, color, sku, price, stock, image_url)
      values (v_product_id, v_row[3], v_row[4], v_row[5]::numeric, 3, v_base || v_row[6]);
    end if;
  end loop;
end $$;
