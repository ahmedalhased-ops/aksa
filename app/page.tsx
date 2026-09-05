import Link from "next/link";
import { getProducts } from "@/lib/queries";
import ProductCard from "@/components/ProductCard";
import Reveal from "@/components/Reveal";

export default async function HomePage() {
  const newest = await getProducts({ sort: "newest" });

  return (
    <div>
      <section className="relative overflow-hidden px-6 py-16 text-center sm:py-24">
        <p className="hero-rise text-xs uppercase tracking-[0.3em] text-gold" style={{ "--delay": "0ms" } as React.CSSProperties}>
          AKSA
        </p>
        <h1
          className="hero-rise font-display mx-auto mt-4 max-w-2xl text-4xl leading-tight sm:text-6xl"
          style={{ "--delay": "150ms" } as React.CSSProperties}
        >
          فخامة تُختار، لا تُعرض فقط
        </h1>
        <p
          className="hero-rise mx-auto mt-4 max-w-md text-ink-soft"
          style={{ "--delay": "300ms" } as React.CSSProperties}
        >
          ساعات، شنط، أحذية وإكسسوارات من أرقى دور الأزياء العالمية.
        </p>
        <div
          className="hero-rise mt-8 flex justify-center gap-4"
          style={{ "--delay": "450ms" } as React.CSSProperties}
        >
          <Link
            href="/shop"
            className="gold-sheen rounded-sm bg-ink px-7 py-3 text-sm text-paper transition-transform duration-300 hover:-translate-y-0.5"
          >
            تسوّق الآن
          </Link>
        </div>
      </section>

      <Reveal>
        <section className="mx-auto grid max-w-4xl grid-cols-2 gap-4 px-6 pb-16">
          <Link
            href="/shop?gender=men"
            className="group flex aspect-[4/3] items-center justify-center overflow-hidden rounded-sm bg-ink text-lg text-paper transition-shadow duration-500 hover:shadow-[0_0_0_1px_theme(colors.gold-soft)]"
          >
            <span className="transition-transform duration-500 group-hover:scale-105">
              للرجال
            </span>
          </Link>
          <Link
            href="/shop?gender=women"
            className="group flex aspect-[4/3] items-center justify-center overflow-hidden rounded-sm bg-rose-deep text-lg text-paper transition-shadow duration-500 hover:shadow-[0_0_0_1px_theme(colors.gold-soft)]"
          >
            <span className="transition-transform duration-500 group-hover:scale-105">
              للنساء
            </span>
          </Link>
        </section>
      </Reveal>

      <section className="mx-auto max-w-6xl px-6 pb-24">
        <Reveal>
          <div className="mb-6 flex items-baseline justify-between">
            <h2 className="font-display text-2xl">وصل حديثًا</h2>
            <Link href="/shop" className="text-sm text-gold hover:underline">
              عرض الكل
            </Link>
          </div>
        </Reveal>
        <div className="grid grid-cols-2 gap-4 sm:grid-cols-3 lg:grid-cols-4">
          {newest.slice(0, 8).map((product, i) => (
            <Reveal key={product.id} delay={(i % 4) * 90}>
              <ProductCard product={product} />
            </Reveal>
          ))}
        </div>
        {newest.length === 0 && (
          <p className="text-ink-faint">
            لا توجد منتجات بعد — أضف منتجات من لوحة التحكم على <code>/admin</code>.
          </p>
        )}
      </section>
    </div>
  );
}
