"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import CartCount from "@/components/CartCount";

// Fixed bottom bar for phones — the primary nav on the device most
// customers arrive from (Instagram/WhatsApp browser). Big touch targets,
// current tab highlighted.
const TABS = [
  { href: "/", label: "الرئيسية", icon: HomeIcon },
  { href: "/shop", label: "المتجر", icon: ShopIcon },
  { href: "/shop?q=", label: "بحث", icon: SearchIcon },
  { href: "/cart", label: "السلة", icon: CartIcon },
  { href: "https://wa.me/96890644450", label: "تواصل", icon: ChatIcon, external: true },
];

export default function MobileNav() {
  const pathname = usePathname();

  return (
    <nav className="fixed inset-x-0 bottom-0 z-40 border-t border-ink/10 bg-paper-raised/95 backdrop-blur md:hidden">
      <div className="grid grid-cols-5">
        {TABS.map((tab) => {
          const active = !tab.external && pathname === tab.href.split("?")[0];
          const Icon = tab.icon;
          return (
            <Link
              key={tab.label}
              href={tab.href}
              target={tab.external ? "_blank" : undefined}
              rel={tab.external ? "noopener" : undefined}
              className={`relative flex flex-col items-center gap-1 py-2.5 text-[11px] ${
                active ? "text-rose-deep" : "text-ink-faint"
              }`}
            >
              <Icon />
              {tab.label === "السلة" && <CartCount />}
              {tab.label}
            </Link>
          );
        })}
      </div>
    </nav>
  );
}

function HomeIcon() {
  return (
    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.6">
      <path d="M4 11.5 12 4l8 7.5" />
      <path d="M6 10v9h12v-9" />
    </svg>
  );
}
function ShopIcon() {
  return (
    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.6">
      <path d="M4 9h16l-1.2 10.2A2 2 0 0 1 16.8 21H7.2a2 2 0 0 1-2-1.8L4 9z" />
      <path d="M8 9V7a4 4 0 0 1 8 0v2" />
    </svg>
  );
}
function SearchIcon() {
  return (
    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.6">
      <circle cx="11" cy="11" r="7" />
      <path d="m21 21-4.3-4.3" />
    </svg>
  );
}
function CartIcon() {
  return (
    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.6">
      <path d="M3 4h2l2.4 12.2a2 2 0 0 0 2 1.8h8.4a2 2 0 0 0 2-1.6L21.5 8H6" />
      <circle cx="10" cy="21" r="1.4" />
      <circle cx="17" cy="21" r="1.4" />
    </svg>
  );
}
function ChatIcon() {
  return (
    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.6">
      <path d="M20 12a8 8 0 1 1-3.6-6.7" />
      <path d="M20 4l-7 7-2-2" />
    </svg>
  );
}
