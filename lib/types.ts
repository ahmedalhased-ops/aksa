export type Brand = {
  id: string;
  name: string;
  slug: string;
};

export type Category = {
  id: string;
  name: string;
  slug: string;
};

export type ProductVariant = {
  id: string;
  product_id: string;
  color: string;
  sku: string;
  price: number;
  stock: number;
  low_stock_threshold: number;
  image_url: string | null;
  is_available: boolean;
};

export type ProductImage = {
  id: string;
  product_id: string;
  variant_id: string | null;
  url: string;
  sort_order: number;
};

export type Product = {
  id: string;
  brand_id: string;
  category_id: string;
  name: string;
  slug: string;
  description: string;
  gender: "men" | "women" | "unisex";
  is_published: boolean;
  brand?: Brand;
  category?: Category;
  variants?: ProductVariant[];
  images?: ProductImage[];
};

export type StockLabel = "in-stock" | "low-stock" | "out-of-stock";

export function stockLabel(variant: Pick<ProductVariant, "stock" | "low_stock_threshold">): StockLabel {
  if (variant.stock <= 0) return "out-of-stock";
  if (variant.stock <= variant.low_stock_threshold) return "low-stock";
  return "in-stock";
}

export type CartLine = {
  variantId: string;
  productSlug: string;
  productName: string;
  brand: string;
  color: string;
  price: number;
  quantity: number;
  imageUrl: string | null;
  maxStock: number;
};
