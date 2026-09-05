import Link from "next/link";
import { getProducts } from "@/lib/queries";
import ProductCard from "@/components/ProductCard";
import Reveal from "@/components/Reveal";
import BrandMarquee from "@/components/BrandMarquee";

// Each word of the headline rises on its own beat — the editorial
// line-by-line reveal luxury houses use, done per word for Arabic.
const HEADLINE = ["أناقةٌ", "عالميّة،", "تليقُ", "بك"];

const delay = (ms: number) => ({ "--delay": `${ms}ms` } as React.CSSProperties);

export default async function HomePage() {
  const newest = await getProducts({ sort: "newest" });

  return (
    <div>
      <section className="relative overflow-hidden px-6 pt-16 pb-12 text-center sm:pt-24 sm:pb-16">
        <p className="hero-rise text-xs uppercase tracking-[0.3em] text-gold" style={delay(0)}>
          AKSA · عُمان
        </p>

        <h1 className="font-display mx-auto mt-5 max-w-2xl text-4xl leading-[1.35] sm:text-6xl">
          {HEADLINE.map((word, i) => (
            <span key={word} className="hero-rise inline-block" style={delay(150 + i * 110)}>
              {word}
              {i < HEADLINE.length - 1 && " "}
            </span>
          ))}
        </h1>

        <span
          aria-hidden
          className="hairline-draw mx-auto mt-5 block h-px w-16 bg-gold-soft"
          style={delay(650)}
        />

        <p className="hero-rise mx-auto mt-5 max-w-md text-ink-soft" style={delay(750)}>
          ساعات وشنط وإكسسوارات أصلية من أرقى الماركات العالمية، تصلك أينما كنت.
        </p>

        <div className="hero-rise mt-8 flex justify-center gap-4" style={delay(900)}>
          <Link
            href="/shop"
            className="gold-sheen rounded-sm bg-ink px-8 py-3 text-sm tracking-wide text-paper transition-transform duration-300 hover:-translate-y-0.5"
          >
            تسوّق الآن
          </Link>
        </div>
      </section>

      <div className="hero-rise" style={delay(1100)}>
        <BrandMarquee />
      </div>

      <Reveal>
        <section className="mx-auto grid max-w-4xl grid-cols-2 gap-4 px-6 pt-14 pb-16">
          <CollectionTile href="/shop?gender=men" eyebrow="مجموعة" label="الرجال" tone="bg-ink" />
          <CollectionTile href="/shop?gender=women" eyebrow="مجموعة" label="النساء" tone="bg-rose-deep" />
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

/**
 * Gender tile: the flat colour stays, but it earns an inset gold hairline
 * frame, a small eyebrow, and an arrow that slides in on hover — the
 * details that read as "boutique" instead of "button".
 */
function CollectionTile({
  href,
  eyebrow,
  label,
  tone,
}: {
  href: string;
  eyebrow: string;
  label: string;
  tone: string;
}) {
  return (
    <Link
      href={href}
      className={`group relative flex aspect-[4/3] items-center justify-center overflow-hidden rounded-sm ${tone} text-paper transition-shadow duration-500 hover:shadow-[0_24px_50px_-28px_rgba(28,21,18,0.6)]`}
    >
      <span className="pointer-events-none absolute inset-3 rounded-sm border border-gold-soft/40 transition-all duration-500 group-hover:inset-2 group-hover:border-gold-soft/80" />
      <span className="relative flex flex-col items-center gap-1.5">
        <span className="text-[10px] uppercase tracking-[0.35em] text-gold-soft">{eyebrow}</span>
        <span className="font-display text-2xl transition-transform duration-500 group-hover:scale-105 sm:text-3xl">
          {label}
        </span>
        <span className="mt-1 flex items-center gap-1 text-[11px] text-paper/70 transition-all duration-500 group-hover:gap-2 group-hover:text-paper">
          اكتشف
          <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.8" className="transition-transform duration-500 group-hover:-translate-x-0.5">
            <path d="M19 12H5m7-7-7 7 7 7" />
          </svg>
        </span>
      </span>
    </Link>
  );
}
