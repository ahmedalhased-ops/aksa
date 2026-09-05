"use client";

import { useEffect, useRef, useState } from "react";
import { readCart, cartCount } from "@/lib/cart";

export default function CartCount() {
  const [count, setCount] = useState(0);
  const [pop, setPop] = useState(false);
  const prev = useRef(0);

  useEffect(() => {
    const update = () => {
      const next = cartCount(readCart());
      // One soft pulse only when something was added — not on removal.
      if (next > prev.current && prev.current !== 0) {
        setPop(true);
        window.setTimeout(() => setPop(false), 600);
      }
      prev.current = next;
      setCount(next);
    };
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
    <span
      className={`absolute -top-1.5 -end-1.5 flex h-4 min-w-4 items-center justify-center rounded-full bg-rose-deep px-1 text-[10px] font-semibold text-white ${
        pop ? "badge-pop" : ""
      }`}
    >
      {count}
    </span>
  );
}
