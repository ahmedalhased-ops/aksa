"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import Image from "next/image";
import type { CartLine } from "@/lib/types";

const DURATION = 4200;

/**
 * The "added to bag" panel. Mounted once in the root layout; wakes up
 * whenever `addToCart` fires `aksa-cart-added`, shows the exact item that
 * was added, then glides away on its own. Closing early is one tap.
 */
export default function CartToast() {
  const [line, setLine] = useState<CartLine | null>(null);
  const [key, setKey] = useState(0);

  useEffect(() => {
    let timer: number | undefined;

    const onAdded = (e: Event) => {
      const detail = (e as CustomEvent<CartLine>).detail;
      if (!detail) return;
      setLine(detail);
      setKey((k) => k + 1); // restart the animation even if already open
      window.clearTimeout(timer);
      timer = window.setTimeout(() => setLine(null), DURATION);
    };

    window.addEventListener("aksa-cart-added", onAdded);
    return () => {
      window.removeEventListener("aksa-cart-added", onAdded);
      window.clearTimeout(timer);
    };
  }, []);

  if (!line) return null;

  return (
    <div
      key={key}
      role="status"
      aria-live="polite"
      className="bag-panel fixed inset-x-4 bottom-24 z-50 md:inset-x-auto md:bottom-auto md:end-6 md:top-24 md:w-80"
      style={{ "--bag-duration": `${DURATION}ms` } as React.CSSProperties}
    >
      <div className="overflow-hidden rounded-sm border border-gold-soft/50 bg-paper-raised shadow-[0_24px_60px_-24px_rgba(28,21,18,0.45)]">
        <div className="flex items-center justify-between border-b border-ink/10 px-4 py-2.5">
          <p className="text-xs uppercase tracking-[0.25em] text-gold">أُضيف إلى السلة</p>
          <button
            type="button"
            onClick={() => setLine(null)}
            aria-label="إغلاق"
            className="-me-1 rounded-full p-1 text-ink-faint transition-colors hover:text-ink"
          >
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8">
              <path d="M6 6l12 12M18 6 6 18" />
            </svg>
          </button>
        </div>

        <div className="flex gap-3 p-4">
          <div className="relative h-20 w-16 shrink-0 overflow-hidden rounded-sm bg-paper">
            {line.imageUrl && (
              <Image src={line.imageUrl} alt={line.productName} fill sizes="64px" className="object-cover" />
            )}
          </div>
          <div className="min-w-0 flex-1">
            <p className="text-[11px] uppercase tracking-widest text-gold">{line.brand}</p>
            <p className="mt-0.5 line-clamp-2 text-sm font-medium leading-snug">{line.productName}</p>
            <p className="mt-1 text-xs text-ink-faint">
              {line.color}
              {line.quantity > 1 && ` · ${line.quantity}×`}
            </p>
            <p className="mt-1 text-sm font-semibold text-rose-deep">
              {(line.price * line.quantity).toFixed(2)} <span className="text-xs text-ink-faint">ر.ع</span>
            </p>
          </div>
        </div>

        <div className="grid grid-cols-2 gap-2 px-4 pb-4">
          <button
            type="button"
            onClick={() => setLine(null)}
            className="rounded-sm border border-ink/15 py-2.5 text-xs transition-colors hover:border-gold"
          >
            متابعة التسوق
          </button>
          <Link
            href="/cart"
            onClick={() => setLine(null)}
            className="gold-sheen rounded-sm bg-ink py-2.5 text-center text-xs text-paper"
          >
            عرض السلة
          </Link>
        </div>

        <div className="h-px bg-ink/10">
          <div className="bag-timer h-px bg-gold-soft" />
        </div>
      </div>
    </div>
  );
}
