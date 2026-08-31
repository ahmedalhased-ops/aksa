"use client";

import { useRouter } from "next/navigation";
import { useState } from "react";
import { createClient } from "@/lib/supabase/client";
import type { Brand, Category, Product, ProductVariant } from "@/lib/types";

type VariantDraft = Partial<ProductVariant> & { _key: string };

function slugify(text: string) {
  return text
    .trim()
    .toLowerCase()
    .replace(/[^\p{L}\p{N}]+/gu, "-")
    .replace(/(^-|-$)/g, "");
}

function newVariant(): VariantDraft {
  return {
    _key: crypto.randomUUID(),
    color: "",
    sku: "",
    price: 0,
    stock: 0,
    low_stock_threshold: 3,
    image_url: "",
    is_available: true,
  };
}

export default function ProductForm({
  product,
  brands,
  categories,
}: {
  product: Product | null;
  brands: Brand[];
  categories: Category[];
}) {
  const router = useRouter();
  const isNew = !product;

  const [name, setName] = useState(product?.name ?? "");
  const [brandId, setBrandId] = useState(product?.brand_id ?? brands[0]?.id ?? "");
  const [categoryId, setCategoryId] = useState(product?.category_id ?? categories[0]?.id ?? "");
  const [gender, setGender] = useState(product?.gender ?? "unisex");
  const [description, setDescription] = useState(product?.description ?? "");
  const [isPublished, setIsPublished] = useState(product?.is_published ?? true);
  const [variants, setVariants] = useState<VariantDraft[]>(
    product?.variants?.length
      ? product.variants.map((v) => ({ ...v, _key: v.id }))
      : [newVariant()]
  );
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);

  function updateVariant(key: string, patch: Partial<VariantDraft>) {
    setVariants((vs) => vs.map((v) => (v._key === key ? { ...v, ...patch } : v)));
  }

  function removeVariant(key: string) {
    setVariants((vs) => vs.filter((v) => v._key !== key));
  }

  async function handleSave() {
    setSaving(true);
    setError(null);
    const supabase = createClient();

    try {
      if (!name.trim()) throw new Error("اسم المنتج مطلوب");
      if (variants.length === 0) throw new Error("أضف لون واحد على الأقل");
      for (const v of variants) {
        if (!v.color?.trim()) throw new Error("كل لون يحتاج اسم");
        if (!v.sku?.trim()) throw new Error("كل لون يحتاج SKU");
      }

      let productId = product?.id;

      if (isNew) {
        const { data, error } = await supabase
          .from("products")
          .insert({
            name,
            slug: slugify(name) + "-" + Math.random().toString(36).slice(2, 6),
            brand_id: brandId,
            category_id: categoryId,
            gender,
            description,
            is_published: isPublished,
          })
          .select()
          .single();
        if (error) throw error;
        productId = data.id;
      } else {
        const { error } = await supabase
          .from("products")
          .update({
            name,
            brand_id: brandId,
            category_id: categoryId,
            gender,
            description,
            is_published: isPublished,
            updated_at: new Date().toISOString(),
          })
          .eq("id", productId!);
        if (error) throw error;
      }

      const originalIds = new Set((product?.variants ?? []).map((v) => v.id));
      const keptIds = new Set(variants.filter((v) => v.id).map((v) => v.id));
      const deletedIds = [...originalIds].filter((id) => !keptIds.has(id));

      if (deletedIds.length > 0) {
        const { error } = await supabase.from("product_variants").delete().in("id", deletedIds);
        if (error) throw error;
      }

      for (const v of variants) {
        const payload = {
          product_id: productId,
          color: v.color,
          sku: v.sku,
          price: Number(v.price) || 0,
          stock: Number(v.stock) || 0,
          low_stock_threshold: Number(v.low_stock_threshold) || 3,
          image_url: v.image_url || null,
          is_available: (Number(v.stock) || 0) > 0,
        };
        if (v.id) {
          const { error } = await supabase.from("product_variants").update(payload).eq("id", v.id);
          if (error) throw error;
        } else {
          const { error } = await supabase.from("product_variants").insert(payload);
          if (error) throw error;
        }
      }

      router.push("/admin/products");
      router.refresh();
    } catch (e: any) {
      setError(e.message ?? "حدث خطأ غير متوقع");
    } finally {
      setSaving(false);
    }
  }

  async function handleDelete() {
    if (!product) return;
    if (!confirm(`حذف "${product.name}" نهائيًا؟`)) return;
    const supabase = createClient();
    await supabase.from("products").delete().eq("id", product.id);
    router.push("/admin/products");
    router.refresh();
  }

  return (
    <div className="max-w-2xl space-y-6">
      <h1 className="font-display text-2xl">{isNew ? "منتج جديد" : "تعديل المنتج"}</h1>

      <div className="grid gap-4 sm:grid-cols-2">
        <Field label="اسم المنتج">
          <input value={name} onChange={(e) => setName(e.target.value)} className="input" />
        </Field>
        <Field label="الماركة">
          <select value={brandId} onChange={(e) => setBrandId(e.target.value)} className="input">
            {brands.map((b) => (
              <option key={b.id} value={b.id}>
                {b.name}
              </option>
            ))}
          </select>
        </Field>
        <Field label="الفئة">
          <select value={categoryId} onChange={(e) => setCategoryId(e.target.value)} className="input">
            {categories.map((c) => (
              <option key={c.id} value={c.id}>
                {c.name}
              </option>
            ))}
          </select>
        </Field>
        <Field label="الجنس">
          <select value={gender} onChange={(e) => setGender(e.target.value as any)} className="input">
            <option value="women">نساء</option>
            <option value="men">رجال</option>
            <option value="unisex">الجميع</option>
          </select>
        </Field>
      </div>

      <Field label="الوصف">
        <textarea
          value={description}
          onChange={(e) => setDescription(e.target.value)}
          rows={3}
          className="input"
        />
      </Field>

      <label className="flex items-center gap-2 text-sm">
        <input type="checkbox" checked={isPublished} onChange={(e) => setIsPublished(e.target.checked)} />
        منشور على الموقع
      </label>

      <div>
        <div className="mb-3 flex items-center justify-between">
          <h2 className="font-medium">الألوان / المخزون</h2>
          <button
            type="button"
            onClick={() => setVariants((vs) => [...vs, newVariant()])}
            className="text-sm text-gold hover:underline"
          >
            + إضافة لون
          </button>
        </div>

        <div className="space-y-3">
          {variants.map((v) => (
            <div key={v._key} className="grid grid-cols-2 gap-2 rounded border border-ink/10 p-3 sm:grid-cols-6">
              <input
                placeholder="اللون"
                value={v.color}
                onChange={(e) => updateVariant(v._key, { color: e.target.value })}
                className="input col-span-2 sm:col-span-1"
              />
              <input
                placeholder="SKU"
                dir="ltr"
                value={v.sku}
                onChange={(e) => updateVariant(v._key, { sku: e.target.value })}
                className="input"
              />
              <input
                placeholder="السعر"
                type="number"
                step="0.001"
                value={v.price}
                onChange={(e) => updateVariant(v._key, { price: Number(e.target.value) })}
                className="input"
              />
              <input
                placeholder="الكمية"
                type="number"
                value={v.stock}
                onChange={(e) => updateVariant(v._key, { stock: Number(e.target.value) })}
                className="input"
              />
              <input
                placeholder="رابط الصورة"
                dir="ltr"
                value={v.image_url ?? ""}
                onChange={(e) => updateVariant(v._key, { image_url: e.target.value })}
                className="input col-span-2 sm:col-span-1"
              />
              <button
                type="button"
                onClick={() => removeVariant(v._key)}
                className="text-xs text-rose-deep hover:underline"
              >
                حذف اللون
              </button>
            </div>
          ))}
        </div>
      </div>

      {error && <p className="text-sm text-rose-deep">{error}</p>}

      <div className="flex items-center gap-3">
        <button
          onClick={handleSave}
          disabled={saving}
          className="rounded-sm bg-ink px-6 py-2.5 text-sm text-paper disabled:opacity-50"
        >
          {saving ? "جارٍ الحفظ..." : "حفظ"}
        </button>
        {!isNew && (
          <button onClick={handleDelete} className="text-sm text-rose-deep hover:underline">
            حذف المنتج
          </button>
        )}
      </div>

      <style jsx global>{`
        .input {
          width: 100%;
          border: 1px solid rgba(28, 21, 18, 0.15);
          border-radius: 4px;
          padding: 0.5rem 0.75rem;
          background: #fffbf4;
          outline: none;
        }
        .input:focus {
          border-color: #9c7a35;
        }
      `}</style>
    </div>
  );
}

function Field({ label, children }: { label: string; children: React.ReactNode }) {
  return (
    <label className="block text-sm">
      <span className="mb-1 block text-ink-soft">{label}</span>
      {children}
    </label>
  );
}
