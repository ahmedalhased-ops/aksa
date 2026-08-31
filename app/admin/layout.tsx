import Link from "next/link";
import LogoutButton from "@/components/LogoutButton";

export default function AdminLayout({ children }: { children: React.ReactNode }) {
  return (
    <div className="mx-auto max-w-5xl px-4 py-6 sm:px-6">
      <div className="mb-6 flex items-center justify-between border-b border-ink/10 pb-4">
        <nav className="flex gap-5 text-sm">
          <Link href="/admin/products" className="font-medium hover:text-rose-deep">
            المنتجات
          </Link>
          <Link href="/admin/products/new" className="hover:text-rose-deep">
            + منتج جديد
          </Link>
          <Link href="/admin/orders" className="hover:text-rose-deep">
            الطلبات
          </Link>
        </nav>
        <LogoutButton />
      </div>
      {children}
    </div>
  );
}
