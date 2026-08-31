import Link from "next/link";
import { getProducts } from "@/lib/queries";
import ProductCard from "@/components/ProductCard";

export default async function HomePage() {
  const newest = await getProducts({ sort: "newest" });

  return (
    <div>
      <section className="relative overflow-hidden px-6 py-16 text-center sm:py-24">
        <p className="text-xs uppercase tracking-[0.3em] text-gold">AKSA</p>
        <h1 className="font-display mx-auto mt-4 max-w-2xl text-4xl leading-tight sm:text-6xl">
          فخامة تُختار، لا تُعرض فقط
        </h1>
        <p className="mx-auto mt-4 max-w-md text-ink-soft">
          ساعات، شنط، أحذية وإكسسوارات من أرقى دور الأزياء العالمية.
        </p>
        <div className="mt-8 flex justify-center gap-4">
          <Link href="/shop" className="rounded-sm bg-ink px-7 py-3 text-sm text-paper">
            تسوّق الآن
          </Link>
        </div>
      </section>

      <section className="mx-auto grid max-w-4xl grid-cols-2 gap-4 px-6 pb-16">
        <Link
          href="/shop?gender=men"
          className="flex aspect-[4/3] items-center justify-center rounded-sm bg-ink text-lg text-paper"
        >
          للرجال
        </Link>
        <Link
          href="/shop?gender=women"
          className="flex aspect-[4/3] items-center justify-center rounded-sm bg-rose-deep text-lg text-paper"
        >
          للنساء
        </Link>
      </section>

      <section className="mx-auto max-w-6xl px-6 pb-24">
        <div className="mb-6 flex items-baseline justify-between">
          <h2 className="font-display text-2xl">وصل حديثًا</h2>
          <Link href="/shop" className="text-sm text-gold hover:underline">
            عرض الكل
          </Link>
        </div>
        <div className="grid grid-cols-2 gap-4 sm:grid-cols-3 lg:grid-cols-4">
          {newest.slice(0, 8).map((product) => (
            <ProductCard key={product.id} product={product} />
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
