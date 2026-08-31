import Link from "next/link";
import { createServerSupabase } from "@/lib/supabase/server";
import type { Product } from "@/lib/types";

export const revalidate = 0;

export default async function AdminProductsPage() {
  const supabase = createServerSupabase();
  const { data } = await supabase
    .from("products")
    .select("*, brand:brands(*), category:categories(*), variants:product_variants(*)")
    .order("created_at", { ascending: false });

  const products = (data ?? []) as unknown as Product[];
  const lowStock = products.filter((p) =>
    p.variants?.some((v) => v.stock > 0 && v.stock <= v.low_stock_threshold)
  );

  return (
    <div>
      {lowStock.length > 0 && (
        <div className="mb-6 rounded-sm border border-rose-deep/30 bg-rose-deep/5 p-4">
          <p className="mb-2 text-sm font-medium text-rose-deep">
            ⚠ منتجات على وشك النفاد ({lowStock.length})
          </p>
          <ul className="space-y-1 text-sm">
            {lowStock.map((p) => (
              <li key={p.id}>
                <Link href={`/admin/products/${p.id}`} className="hover:underline">
                  {p.name}
                </Link>{" "}
                —{" "}
                {p.variants
                  ?.filter((v) => v.stock > 0 && v.stock <= v.low_stock_threshold)
                  .map((v) => `${v.color}: ${v.stock}`)
                  .join("، ")}
              </li>
            ))}
          </ul>
        </div>
      )}

      <div className="overflow-x-auto">
        <table className="w-full text-sm">
          <thead>
            <tr className="border-b border-ink/10 text-start text-xs uppercase tracking-wide text-ink-faint">
              <th className="py-2 pe-4 text-start">المنتج</th>
              <th className="py-2 pe-4 text-start">الماركة</th>
              <th className="py-2 pe-4 text-start">الفئة</th>
              <th className="py-2 pe-4 text-start">الألوان / المخزون</th>
              <th className="py-2 pe-4 text-start">الحالة</th>
              <th className="py-2"></th>
            </tr>
          </thead>
          <tbody>
            {products.map((p) => (
              <tr key={p.id} className="border-b border-ink/5">
                <td className="py-3 pe-4 font-medium">{p.name}</td>
                <td className="py-3 pe-4 text-ink-soft">{p.brand?.name}</td>
                <td className="py-3 pe-4 text-ink-soft">{p.category?.name}</td>
                <td className="py-3 pe-4 text-ink-soft">
                  {p.variants?.map((v) => `${v.color} (${v.stock})`).join("، ")}
                </td>
                <td className="py-3 pe-4">
                  {p.is_published ? (
                    <span className="text-emerald-700">منشور</span>
                  ) : (
                    <span className="text-ink-faint">مخفي</span>
                  )}
                </td>
                <td className="py-3">
                  <Link href={`/admin/products/${p.id}`} className="text-gold hover:underline">
                    تعديل
                  </Link>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
        {products.length === 0 && (
          <p className="py-10 text-center text-ink-faint">
            لا توجد منتجات بعد. اضغط "+ منتج جديد" للبدء.
          </p>
        )}
      </div>
    </div>
  );
}
