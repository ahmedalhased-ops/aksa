"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import Image from "next/image";
import type { CartLine } from "@/lib/types";
import { readCart, updateQuantity, removeFromCart, cartTotal } from "@/lib/cart";

export default function CartPage() {
  const [lines, setLines] = useState<CartLine[]>([]);

  useEffect(() => {
    setLines(readCart());
    const sync = () => setLines(readCart());
    window.addEventListener("aksa-cart-changed", sync);
    return () => window.removeEventListener("aksa-cart-changed", sync);
  }, []);

  if (lines.length === 0) {
    return (
      <div className="mx-auto max-w-lg px-6 py-20 text-center">
        <p className="text-ink-faint">سلتك فارغة.</p>
        <Link href="/shop" className="mt-4 inline-block text-rose-deep hover:underline">
          تصفح المتجر
        </Link>
      </div>
    );
  }

  return (
    <div className="mx-auto max-w-2xl px-4 py-8 sm:px-6">
      <h1 className="font-display mb-6 text-2xl">سلة المشتريات</h1>

      <div className="space-y-4">
        {lines.map((line) => (
          <div key={line.variantId} className="flex gap-4 border-b border-ink/10 pb-4">
            <div className="relative h-20 w-20 flex-none overflow-hidden rounded-sm bg-paper-raised">
              {line.imageUrl && (
                <Image src={line.imageUrl} alt={line.productName} fill className="object-cover" />
              )}
            </div>
            <div className="flex-1">
              <p className="text-xs text-gold">{line.brand}</p>
              <Link href={`/product/${line.productSlug}`} className="text-sm font-medium hover:underline">
                {line.productName}
              </Link>
              <p className="text-xs text-ink-faint">{line.color}</p>
              <div className="mt-2 flex items-center gap-3">
                <select
                  value={line.quantity}
                  onChange={(e) => updateQuantity(line.variantId, Number(e.target.value))}
                  className="rounded border border-ink/15 bg-paper-raised px-2 py-1 text-sm"
                >
                  {Array.from({ length: line.maxStock }, (_, i) => i + 1).map((n) => (
                    <option key={n} value={n}>
                      {n}
                    </option>
                  ))}
                </select>
                <button
                  onClick={() => removeFromCart(line.variantId)}
                  className="text-xs text-ink-faint hover:text-rose-deep"
                >
                  إزالة
                </button>
              </div>
            </div>
            <p className="text-sm font-semibold tabular-nums">
              {(line.price * line.quantity).toFixed(2)} ر.ع
            </p>
          </div>
        ))}
      </div>

      <div className="mt-6 flex items-center justify-between text-lg font-semibold">
        <span>الإجمالي</span>
        <span className="tabular-nums">{cartTotal(lines).toFixed(2)} ر.ع</span>
      </div>

      <Link
        href="/checkout"
        className="mt-6 block w-full rounded-sm bg-ink py-3.5 text-center text-sm font-medium text-paper"
      >
        إتمام الطلب
      </Link>
    </div>
  );
}
