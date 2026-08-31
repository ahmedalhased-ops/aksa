import { createServerSupabase } from "@/lib/supabase/server";
import type { Product } from "@/lib/types";

const PRODUCT_SELECT = `
  *,
  brand:brands(*),
  category:categories(*),
  variants:product_variants(*),
  images:product_images(*)
`;

export type ShopFilters = {
  brand?: string;
  category?: string;
  gender?: string;
  q?: string;
  sort?: "price-asc" | "price-desc" | "newest";
};

export async function getProducts(filters: ShopFilters = {}): Promise<Product[]> {
  const supabase = createServerSupabase();
  let query = supabase
    .from("products")
    .select(PRODUCT_SELECT)
    .eq("is_published", true);

  if (filters.brand) {
    const { data: brand } = await supabase
      .from("brands")
      .select("id")
      .eq("slug", filters.brand)
      .single();
    if (brand) query = query.eq("brand_id", brand.id);
  }

  if (filters.category) {
    const { data: category } = await supabase
      .from("categories")
      .select("id")
      .eq("slug", filters.category)
      .single();
    if (category) query = query.eq("category_id", category.id);
  }

  if (filters.gender && filters.gender !== "all") {
    query = query.eq("gender", filters.gender);
  }

  if (filters.q) {
    query = query.ilike("name", `%${filters.q}%`);
  }

  if (filters.sort === "newest") {
    query = query.order("created_at", { ascending: false });
  } else {
    query = query.order("name", { ascending: true });
  }

  const { data, error } = await query;
  if (error) throw error;

  let products = (data ?? []) as unknown as Product[];

  // Price sort happens client-side after the join, since it depends on
  // each product's cheapest variant rather than a plain column.
  if (filters.sort === "price-asc" || filters.sort === "price-desc") {
    const priceOf = (p: Product) =>
      Math.min(...(p.variants?.map((v) => v.price) ?? [0]));
    products = [...products].sort((a, b) =>
      filters.sort === "price-asc" ? priceOf(a) - priceOf(b) : priceOf(b) - priceOf(a)
    );
  }

  return products;
}

export async function getProductBySlug(slug: string): Promise<Product | null> {
  const supabase = createServerSupabase();
  const { data, error } = await supabase
    .from("products")
    .select(PRODUCT_SELECT)
    .eq("slug", slug)
    .eq("is_published", true)
    .single();

  if (error) return null;
  return data as unknown as Product;
}

export async function getBrands() {
  const supabase = createServerSupabase();
  const { data } = await supabase.from("brands").select("*").order("name");
  return data ?? [];
}

export async function getCategories() {
  const supabase = createServerSupabase();
  const { data } = await supabase.from("categories").select("*").order("name");
  return data ?? [];
}
