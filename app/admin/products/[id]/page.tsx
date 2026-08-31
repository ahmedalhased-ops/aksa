import { createServerSupabase } from "@/lib/supabase/server";
import ProductForm from "@/components/admin/ProductForm";
import type { Product } from "@/lib/types";

export const revalidate = 0;

export default async function AdminProductEditPage({ params }: { params: { id: string } }) {
  const supabase = createServerSupabase();

  const [{ data: brands }, { data: categories }] = await Promise.all([
    supabase.from("brands").select("*").order("name"),
    supabase.from("categories").select("*").order("name"),
  ]);

  let product: Product | null = null;
  if (params.id !== "new") {
    const { data } = await supabase
      .from("products")
      .select("*, variants:product_variants(*)")
      .eq("id", params.id)
      .single();
    product = data as unknown as Product;
  }

  return (
    <ProductForm
      product={product}
      brands={brands ?? []}
      categories={categories ?? []}
    />
  );
}
