import type { Metadata } from "next";
import "./globals.css";
import Header from "@/components/Header";
import MobileNav from "@/components/MobileNav";
import CartToast from "@/components/CartToast";

export const metadata: Metadata = {
  title: "AKSA",
  description: "ساعات، شنط، أحذية وإكسسوارات من أرقى الماركات العالمية.",
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="ar" dir="rtl">
      <body>
        <Header />
        <main className="min-h-screen">{children}</main>
        <div className="mobile-nav-spacer md:hidden" />
        <MobileNav />
        <CartToast />
      </body>
    </html>
  );
}
