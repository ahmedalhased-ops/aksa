import { stockLabel, type ProductVariant } from "@/lib/types";

export default function StockBadge({ variant }: { variant: ProductVariant }) {
  const label = stockLabel(variant);

  if (label === "out-of-stock") {
    return (
      <span className="inline-flex items-center gap-1.5 text-xs font-medium text-ink-faint">
        <span className="h-1.5 w-1.5 rounded-full bg-ink-faint" />
        نفدت الكمية
      </span>
    );
  }

  if (label === "low-stock") {
    return (
      <span className="inline-flex items-center gap-1.5 text-xs font-medium text-rose-deep">
        <span className="h-1.5 w-1.5 rounded-full bg-rose-deep" />
        باقي {variant.stock} فقط
      </span>
    );
  }

  return (
    <span className="inline-flex items-center gap-1.5 text-xs font-medium text-ink-soft">
      <span className="h-1.5 w-1.5 rounded-full bg-emerald-600" />
      متوفر
    </span>
  );
}
