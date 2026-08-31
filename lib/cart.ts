"use client";

import type { CartLine } from "@/lib/types";

// The cart is per-device (localStorage), same as browsing any storefront
// without an account. Checkout still re-validates every line's real
// stock server-side (see /api/checkout) before touching the database.
const KEY = "aksa_cart_v1";

export function readCart(): CartLine[] {
  if (typeof window === "undefined") return [];
  try {
    const raw = window.localStorage.getItem(KEY);
    return raw ? (JSON.parse(raw) as CartLine[]) : [];
  } catch {
    return [];
  }
}

function writeCart(lines: CartLine[]) {
  window.localStorage.setItem(KEY, JSON.stringify(lines));
  window.dispatchEvent(new Event("aksa-cart-changed"));
}

export function addToCart(line: CartLine) {
  const lines = readCart();
  const existing = lines.find((l) => l.variantId === line.variantId);
  if (existing) {
    existing.quantity = Math.min(existing.quantity + line.quantity, line.maxStock);
  } else {
    lines.push(line);
  }
  writeCart(lines);
}

export function updateQuantity(variantId: string, quantity: number) {
  const lines = readCart()
    .map((l) => (l.variantId === variantId ? { ...l, quantity } : l))
    .filter((l) => l.quantity > 0);
  writeCart(lines);
}

export function removeFromCart(variantId: string) {
  writeCart(readCart().filter((l) => l.variantId !== variantId));
}

export function clearCart() {
  writeCart([]);
}

export function cartTotal(lines: CartLine[]) {
  return lines.reduce((sum, l) => sum + l.price * l.quantity, 0);
}

export function cartCount(lines: CartLine[]) {
  return lines.reduce((sum, l) => sum + l.quantity, 0);
}
