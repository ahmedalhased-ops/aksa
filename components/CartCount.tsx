"use client";

import { useEffect, useState } from "react";
import { readCart, cartCount } from "@/lib/cart";

export default function CartCount() {
  const [count, setCount] = useState(0);

  useEffect(() => {
    const update = () => setCount(cartCount(readCart()));
    update();
    window.addEventListener("aksa-cart-changed", update);
    window.addEventListener("storage", update);
    return () => {
      window.removeEventListener("aksa-cart-changed", update);
      window.removeEventListener("storage", update);
    };
  }, []);

  if (count === 0) return null;

  return (
    <span className="absolute -top-1.5 -end-1.5 flex h-4 min-w-4 items-center justify-center rounded-full bg-rose-deep px-1 text-[10px] font-semibold text-white">
      {count}
    </span>
  );
}
