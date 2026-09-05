-- Tory Burch bags — first batch, 15 products.
-- Data (design + price) verified from the original price-reference story
-- screenshots ("توري بورش" folder, 49 photos, prices checked twice each).
-- Images are the enhanced/clean versions, referenced directly by their
-- original filenames from "توري بورش بعد تحسين" — no copying, no quality loss.
-- Run AFTER uploading the 15 files from that folder to the "products" bucket root.

insert into brands (name, slug) values ('Tory Burch', 'tory-burch')
on conflict (slug) do nothing;

do $$
declare
  v_brand_id uuid;
  v_category_id uuid;
  v_base text := 'https://hgqtaynglxeovzyzlkqe.supabase.co/storage/v1/object/public/products/';
  v_product_id uuid;
begin
  select id into v_brand_id from brands where slug = 'tory-burch';
  select id into v_category_id from categories where slug = 'bags';

  -- TB-01: Kira top-handle, ivory/cream
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Tory Burch Kira كريمي', 'tb-kira-cream', 'شنطة نسائية بلون كريمي بشعار Tory Burch الذهبي ومقبض علوي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'كريمي', 'TB-01', 129.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2010_16_01%20PM.png');
  end if;

  -- TB-02: Kira top-handle, black
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Tory Burch Kira أسود', 'tb-kira-black', 'شنطة نسائية سوداء بشعار Tory Burch الذهبي ومقبض علوي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'TB-02', 129.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2010_16_18%20PM.png');
  end if;

  -- TB-03: Kira top-handle, brown/olive
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Tory Burch Kira بني', 'tb-kira-brown', 'شنطة نسائية بنية بشعار Tory Burch الذهبي ومقبض علوي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'بني', 'TB-03', 129.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2010_16_33%20PM.png');
  end if;

  -- TB-04: Kira satchel with strap, burgundy
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Tory Burch Kira عنابي', 'tb-kira-satchel-burgundy', 'شنطة نسائية عنابية بمقبض علوي وسير كتف قابل للفصل. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'عنابي', 'TB-04', 129.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2010_16_40%20PM.png');
  end if;

  -- TB-05: satchel with strap, black
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Tory Burch كلاسيك أسود', 'tb-satchel-black', 'شنطة نسائية سوداء بمقبض علوي وسير كتف طويل. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'TB-05', 129.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2010_16_50%20PM.png');
  end if;

  -- TB-06: flap chain bag, burgundy/plum
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Tory Burch سلسلة عنابي', 'tb-chain-flap-burgundy', 'شنطة نسائية عنابية بغطاء علوي وسلسلة ذهبية. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'عنابي', 'TB-06', 129.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2010_16_59%20PM.png');
  end if;

  -- TB-07: monogram embossed crossbody, black
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Tory Burch مونوغرام أسود', 'tb-monogram-crossbody-black', 'شنطة نسائية سوداء بنقشة مونوغرام وسلسلة ذهبية. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'TB-07', 99.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2010_17_08%20PM.png');
  end if;

  -- TB-08: east-west baguette, burgundy/black
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Tory Burch باغيت عنابي', 'tb-baguette-burgundy', 'شنطة نسائية عنابية مستطيلة بشعار Tory Burch وسلسلة ذهبية. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'عنابي', 'TB-08', 129.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2010_17_40%20PM.png');
  end if;

  -- TB-09: dome bag (Robinson), brown/olive
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Tory Burch دوم بني', 'tb-dome-brown', 'شنطة نسائية بنية بشكل قبة ومقبض علوي مزدوج. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'بني', 'TB-09', 109.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2010_17_48%20PM.png');
  end if;

  -- TB-10: dome bag, burgundy patent
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Tory Burch دوم عنابي لامع', 'tb-dome-burgundy', 'شنطة نسائية عنابية لامعة بشكل قبة ومقبض علوي مزدوج. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'عنابي', 'TB-10', 109.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2010_17_54%20PM.png');
  end if;

  -- TB-11: hobo shoulder bag, brown/olive patent
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Tory Burch هوبو بني لامع', 'tb-hobo-brown', 'شنطة نسائية بنية لامعة بحمالة كتف واحدة. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'بني', 'TB-11', 119.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2010_18_01%20PM.png');
  end if;

  -- TB-12: hobo shoulder bag, burgundy patent
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Tory Burch هوبو عنابي لامع', 'tb-hobo-burgundy', 'شنطة نسائية عنابية لامعة بحمالة كتف واحدة. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'عنابي', 'TB-12', 99.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2010_18_09%20PM.png');
  end if;

  -- TB-13: Kira flap, nude/beige patent
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Tory Burch Kira نود لامع', 'tb-kira-nude', 'شنطة نسائية بلون نود لامع بمقبض علوي وشعار Tory Burch. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'نود', 'TB-13', 129.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2010_18_18%20PM.png');
  end if;

  -- TB-14: vanity/train case, black
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Tory Burch فانيتي أسود', 'tb-vanity-black', 'شنطة نسائية سوداء بشكل صندوق ومقبض علوي وسحّاب ذهبي. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'TB-14', 119.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2010_18_24%20PM.png');
  end if;

  -- TB-15: hobo shoulder bag, black patent
  insert into products (brand_id, category_id, name, slug, description, gender)
  values (v_brand_id, v_category_id, 'شنطة Tory Burch هوبو أسود لامع', 'tb-hobo-black', 'شنطة نسائية سوداء لامعة بحمالة كتف واحدة. تسليم فوري.', 'women')
  on conflict (slug) do nothing returning id into v_product_id;
  if v_product_id is not null then
    insert into product_variants (product_id, color, sku, price, stock, image_url)
    values (v_product_id, 'أسود', 'TB-15', 119.000, 3, v_base || 'Codex%20Image%20Sep%203%2C%202026%2C%2010_18_30%20PM.png');
  end if;

end $$;
