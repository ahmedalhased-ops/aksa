import { notFound } from "next/navigation";
import { getProductBySlug } from "@/lib/queries";
import VariantPicker from "@/components/VariantPicker";

export const revalidate = 0;

export default async function ProductPage({ params }: { params: { slug: string } }) {
  const product = await getProductBySlug(params.slug);
  if (!product) notFound();

  return (
    <div className="mx-auto max-w-3xl px-4 py-8 sm:px-6">
      <VariantPicker product={product} />
    </div>
  );
}
