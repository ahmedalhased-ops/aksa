const fallbackProductImages: Record<string, string> = {
  "coach-signature-tote": "/products/coach-signature-tote-white.webp",
};

export function getFallbackProductImage(slug: string) {
  return fallbackProductImages[slug];
}
