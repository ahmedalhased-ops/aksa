/** @type {import('next').NextConfig} */
const nextConfig = {
  images: {
    // Vercel's free-tier Image Optimization quota is limited and this
    // catalog now has hundreds of product photos — serve them as-is
    // straight from Supabase instead of through Vercel's paid resizing
    // proxy, which was returning 402 (Payment Required) once the
    // monthly allotment ran out.
    unoptimized: true,
    remotePatterns: [
      {
        protocol: "https",
        hostname: "*.supabase.co",
        pathname: "/storage/v1/object/public/**",
      },
    ],
  },
};

module.exports = nextConfig;
