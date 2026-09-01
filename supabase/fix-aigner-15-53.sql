-- Fixes two mislabeled products discovered by comparing against the
-- original watermarked photos: rows 15 and 53 both claimed "بنفسجي
-- وذهبي" but that's wrong for both.

update product_variants set color = 'فضي وذهبي وردي', price = 179.000
where sku = 'AIGNER-015';

update products set
  name = 'ساعة أقنر نسائي - فضي وذهبي وردي - رقم 15',
  description = 'ساعة أقنر نسائي بتصميم فضي وذهبي وردي، مينا أبيض بأرقام رومانية. تسليم فوري مع كامل ملحقات الماركة.'
where slug = 'aigner-full-15';

update product_variants set color = 'فضي', price = 129.000
where sku = 'AIGNER-053';

update products set
  name = 'ساعة أقنر نسائي - فضي - رقم 53',
  description = 'ساعة أقنر نسائي بتصميم فضي، مينا أبيض بأرقام رومانية. تسليم فوري مع كامل ملحقات الماركة.'
where slug = 'aigner-full-53';
