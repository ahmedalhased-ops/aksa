import Link from "next/link";
import CartCount from "@/components/CartCount";

// Desktop header: full nav + search + cart. Hidden below md — phones
// get the fixed MobileNav bottom bar instead (see app/layout.tsx).
export default function Header() {
  return (
    <header className="sticky top-0 z-40 hidden border-b border-ink/10 bg-paper/90 backdrop-blur md:block">
      <div className="mx-auto flex max-w-6xl items-center justify-between gap-6 px-6 py-4">
        <Link href="/" className="flex items-center gap-3">
          <span className="grid h-10 w-10 place-items-center rounded-full bg-rose-brand font-semibold text-white">
            AK
          </span>
          <span className="font-display text-xl tracking-widest">AKSA</span>
        </Link>

        <nav className="flex items-center gap-8 text-sm">
          <Link href="/" className="hover:text-rose-deep">الرئيسية</Link>
          <Link href="/shop" className="hover:text-rose-deep">المتجر</Link>
          <Link href="/shop?gender=men" className="hover:text-rose-deep">رجال</Link>
          <Link href="/shop?gender=women" className="hover:text-rose-deep">نساء</Link>
        </nav>

        <div className="flex items-center gap-4">
          <form action="/shop" className="hidden lg:block">
            <input
              type="search"
              name="q"
              placeholder="ابحث..."
              className="w-48 rounded-full border border-ink/15 bg-paper-raised px-4 py-2 text-sm outline-none focus:border-gold"
            />
          </form>
          <Link href="/cart" className="relative rounded-full border border-ink/15 p-2.5 hover:border-gold">
            <CartIcon />
            <CartCount />
          </Link>
        </div>
      </div>
    </header>
  );
}

function CartIcon() {
  return (
    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.6">
      <path d="M3 4h2l2.4 12.2a2 2 0 0 0 2 1.8h8.4a2 2 0 0 0 2-1.6L21.5 8H6" />
      <circle cx="10" cy="21" r="1.4" />
      <circle cx="17" cy="21" r="1.4" />
    </svg>
  );
}
