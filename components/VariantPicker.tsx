"use client";

import { useMemo, useState } from "react";
import Image from "next/image";
import type { Product, ProductVariant } from "@/lib/types";
import StockBadge from "@/components/StockBadge";
import { addToCart } from "@/lib/cart";

export default function VariantPicker({ product }: { product: Product }) {
  const variants = product.variants ?? [];
  const [selectedId, setSelectedId] = useState(variants[0]?.id);
  const [qty, setQty] = useState(1);
  const [justAdded, setJustAdded] = useState(false);

  const selected = useMemo(
    () => variants.find((v) => v.id === selectedId) ?? variants[0],
    [variants, selectedId]
  );

  if (!selected) {
    return <p className="text-ink-faint">لا توجد ألوان متاحة لهذا المنتج حاليًا.</p>;
  }

  const outOfStock = selected.stock <= 0;

  function selectVariant(v: ProductVariant) {
    setSelectedId(v.id);
    setQty(1);
    setJustAdded(false);
  }

  function handleAddToCart() {
    if (outOfStock) return;
    addToCart({
      variantId: selected.id,
      productSlug: product.slug,
      productName: product.name,
      brand: product.brand?.name ?? "",
      color: selected.color,
      price: selected.price,
      quantity: qty,
      imageUrl: selected.image_url,
      maxStock: selected.stock,
    });
    setJustAdded(true);
  }

  return (
    <div className="space-y-6">
      <div className="relative aspect-square w-full overflow-hidden rounded-sm bg-paper-raised">
        {selected.image_url ? (
          <Image src={selected.image_url} alt={`${product.name} — ${selected.color}`} fill quality={95} className="object-cover" />
        ) : (
          <div className="flex h-full items-center justify-center text-ink-faint">لا توجد صورة</div>
        )}
      </div>

      <div>
        <p className="text-xs uppercase tracking-widest text-gold">{product.brand?.name}</p>
        <h1 className="font-display mt-1 text-2xl">{product.name}</h1>
        <p className="mt-2 text-xl font-semibold text-rose-deep">
          {selected.price.toFixed(2)} <span className="text-sm text-ink-faint">ر.ع</span>
        </p>
      </div>

      {variants.length > 1 && (
        <div>
          <p className="mb-2 text-sm font-medium">اللون: {selected.color}</p>
          <div className="flex flex-wrap gap-2">
            {variants.map((v) => (
              <button
                key={v.id}
                type="button"
                onClick={() => selectVariant(v)}
                disabled={v.stock <= 0}
                className={`rounded-full border px-4 py-2 text-sm transition-colors disabled:cursor-not-allowed disabled:opacity-40 ${
                  v.id === selected.id
                    ? "border-ink bg-ink text-paper"
                    : "border-ink/15 hover:border-gold"
                }`}
              >
                {v.color}
                {v.stock <= 0 && " (نفدت)"}
              </button>
            ))}
          </div>
        </div>
      )}

      <StockBadge variant={selected} />

      {!outOfStock && (
        <div className="flex items-center gap-3">
          <div className="flex items-center rounded-full border border-ink/15">
            <button
              type="button"
              onClick={() => setQty((q) => Math.max(1, q - 1))}
              className="px-4 py-2.5 text-lg"
              aria-label="إنقاص الكمية"
            >
              −
            </button>
            <span className="w-8 text-center tabular-nums">{qty}</span>
            <button
              type="button"
              onClick={() => setQty((q) => Math.min(selected.stock, q + 1))}
              className="px-4 py-2.5 text-lg"
              aria-label="زيادة الكمية"
            >
              +
            </button>
          </div>
          <span className="text-xs text-ink-faint">الحد الأقصى {selected.stock}</span>
        </div>
      )}

      <button
        type="button"
        onClick={handleAddToCart}
        disabled={outOfStock}
        className="w-full rounded-sm bg-ink py-3.5 text-sm font-medium text-paper transition-opacity disabled:cursor-not-allowed disabled:opacity-40"
      >
        {outOfStock ? "نفدت الكمية" : justAdded ? "أُضيف للسلة ✓" : "أضف إلى السلة"}
      </button>

      {product.description && (
        <p className="border-t border-ink/10 pt-6 text-sm leading-7 text-ink-soft">
          {product.description}
        </p>
      )}
    </div>
  );
}
