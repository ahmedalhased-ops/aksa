import Link from "next/link";
import Image from "next/image";
import type { Product } from "@/lib/types";
import { getFallbackProductImage } from "@/lib/product-images";
import StockBadge from "@/components/StockBadge";

export default function ProductCard({ product }: { product: Product }) {
  const variants = product.variants ?? [];
  const cheapest = variants.reduce(
    (min, v) => (v.price < min.price ? v : min),
    variants[0]
  );
  const cover =
    cheapest?.image_url ??
    product.images?.[0]?.url ??
    getFallbackProductImage(product.slug);
  const colorCount = variants.length;

  return (
    <Link
      href={`/product/${product.slug}`}
      className="group block overflow-hidden rounded-sm border border-ink/10 bg-paper-raised transition-shadow hover:shadow-lg"
    >
      <div className="relative aspect-[4/5] w-full overflow-hidden bg-paper">
        {cover ? (
          <Image
            src={cover}
            alt={product.name}
            fill
            sizes="(max-width: 640px) 50vw, (max-width: 1024px) 33vw, 20vw"
            quality={95}
            className="object-cover transition-transform duration-500 group-hover:scale-105"
          />
        ) : (
          <div className="flex h-full items-center justify-center text-ink-faint">
            لا توجد صورة
          </div>
        )}
      </div>
      <div className="space-y-1 p-3 sm:p-4">
        <p className="text-[11px] uppercase tracking-widest text-gold">
          {product.brand?.name}
        </p>
        <h3 className="line-clamp-1 text-sm font-medium sm:text-base">{product.name}</h3>
        <div className="flex items-center justify-between pt-1">
          <p className="font-semibold text-rose-deep">
            {cheapest?.price?.toFixed(2)} <span className="text-xs text-ink-faint">ر.ع</span>
          </p>
          {colorCount > 1 && (
            <span className="text-xs text-ink-faint">{colorCount} ألوان</span>
          )}
        </div>
        {cheapest && <StockBadge variant={cheapest} />}
      </div>
    </Link>
  );
}
