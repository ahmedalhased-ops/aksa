import { getProducts, getBrands, getCategories, type ShopFilters } from "@/lib/queries";
import ProductCard from "@/components/ProductCard";

export const revalidate = 0;

export default async function ShopPage({
  searchParams,
}: {
  searchParams: { brand?: string; category?: string; gender?: string; q?: string; sort?: string };
}) {
  const filters: ShopFilters = {
    brand: searchParams.brand,
    category: searchParams.category,
    gender: searchParams.gender,
    q: searchParams.q,
    sort: searchParams.sort as ShopFilters["sort"],
  };

  const [products, brands, categories] = await Promise.all([
    getProducts(filters),
    getBrands(),
    getCategories(),
  ]);

  const paramsFor = (patch: Record<string, string | undefined>) => {
    const next = new URLSearchParams(searchParams as Record<string, string>);
    for (const [k, v] of Object.entries(patch)) {
      if (v) next.set(k, v);
      else next.delete(k);
    }
    return `/shop?${next.toString()}`;
  };

  return (
    <div className="mx-auto max-w-6xl px-4 py-8 sm:px-6">
      <form className="mb-6 flex gap-2 sm:hidden">
        <input
          type="search"
          name="q"
          defaultValue={searchParams.q}
          placeholder="ابحث عن منتج..."
          className="flex-1 rounded-full border border-ink/15 bg-paper-raised px-4 py-2.5 text-sm outline-none focus:border-gold"
        />
      </form>

      <div className="grid gap-8 md:grid-cols-[220px_1fr]">
        <aside className="space-y-6">
          <div>
            <h3 className="mb-2 text-xs font-semibold uppercase tracking-widest text-ink-faint">
              الفئة
            </h3>
            <div className="flex flex-wrap gap-2 md:flex-col">
              <FilterLink
                href={paramsFor({ gender: undefined })}
                active={!searchParams.gender}
                label="الكل"
              />
              <FilterLink
                href={paramsFor({ gender: "men" })}
                active={searchParams.gender === "men"}
                label="رجال"
              />
              <FilterLink
                href={paramsFor({ gender: "women" })}
                active={searchParams.gender === "women"}
                label="نساء"
              />
            </div>
          </div>

          <div>
            <h3 className="mb-2 text-xs font-semibold uppercase tracking-widest text-ink-faint">
              التصنيف
            </h3>
            <div className="flex flex-wrap gap-2 md:flex-col">
              <FilterLink
                href={paramsFor({ category: undefined })}
                active={!searchParams.category}
                label="الكل"
              />
              {categories.map((c) => (
                <FilterLink
                  key={c.id}
                  href={paramsFor({ category: c.slug })}
                  active={searchParams.category === c.slug}
                  label={c.name}
                />
              ))}
            </div>
          </div>

          <div>
            <h3 className="mb-2 text-xs font-semibold uppercase tracking-widest text-ink-faint">
              الماركة
            </h3>
            <div className="flex flex-wrap gap-2 md:flex-col">
              <FilterLink
                href={paramsFor({ brand: undefined })}
                active={!searchParams.brand}
                label="الكل"
              />
              {brands.map((b) => (
                <FilterLink
                  key={b.id}
                  href={paramsFor({ brand: b.slug })}
                  active={searchParams.brand === b.slug}
                  label={b.name}
                />
              ))}
            </div>
          </div>
        </aside>

        <div>
          <div className="mb-4 flex items-center justify-between">
            <p className="text-sm text-ink-faint">{products.length} منتج</p>
            <div className="flex gap-2 text-sm">
              <a href={paramsFor({ sort: "price-asc" })} className="hover:text-rose-deep">
                السعر ↑
              </a>
              <a href={paramsFor({ sort: "price-desc" })} className="hover:text-rose-deep">
                السعر ↓
              </a>
              <a href={paramsFor({ sort: "newest" })} className="hover:text-rose-deep">
                الأحدث
              </a>
            </div>
          </div>

          <div className="grid grid-cols-2 gap-4 sm:grid-cols-3 lg:grid-cols-3">
            {products.map((product) => (
              <ProductCard key={product.id} product={product} />
            ))}
          </div>

          {products.length === 0 && (
            <p className="py-16 text-center text-ink-faint">لا توجد منتجات مطابقة.</p>
          )}
        </div>
      </div>
    </div>
  );
}

function FilterLink({ href, active, label }: { href: string; active: boolean; label: string }) {
  return (
    <a
      href={href}
      className={`rounded-full border px-3 py-1.5 text-sm transition-colors md:rounded-none md:border-0 md:border-s-2 md:px-2 md:py-1 ${
        active
          ? "border-ink bg-ink text-paper md:border-gold md:bg-transparent md:text-ink"
          : "border-ink/15 text-ink-soft md:border-transparent"
      }`}
    >
      {label}
    </a>
  );
}
