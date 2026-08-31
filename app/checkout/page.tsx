"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import type { CartLine } from "@/lib/types";
import { readCart, cartTotal, clearCart } from "@/lib/cart";

const WHATSAPP_NUMBER = "96890644450";

export default function CheckoutPage() {
  const router = useRouter();
  const [lines, setLines] = useState<CartLine[]>([]);
  const [name, setName] = useState("");
  const [phone, setPhone] = useState("");
  const [state, setStateVal] = useState("");
  const [village, setVillage] = useState("");
  const [note, setNote] = useState("");
  const [submitting, setSubmitting] = useState(false);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    setLines(readCart());
  }, []);

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    setSubmitting(true);
    setError(null);

    const res = await fetch("/api/checkout", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        customerName: name,
        customerPhone: phone,
        customerState: state,
        customerVillage: village,
        customerNote: note,
        items: lines.map((l) => ({ variantId: l.variantId, quantity: l.quantity })),
      }),
    });

    const data = await res.json();
    setSubmitting(false);

    if (!res.ok) {
      setError(data.error ?? "حدث خطأ، حاول مرة أخرى.");
      return;
    }

    const summary = lines
      .map((l) => `• ${l.productName} (${l.color}) × ${l.quantity}`)
      .join("\n");
    const message = `مرحبًا، أرغب بتأكيد طلب #${data.orderId.slice(0, 8)}:\n${summary}\nالإجمالي: ${cartTotal(
      lines
    ).toFixed(2)} ر.ع\nالاسم: ${name}\nالهاتف: ${phone}\nالولاية: ${state}\nالقرية: ${village}`;

    clearCart();
    window.location.href = `https://wa.me/${WHATSAPP_NUMBER}?text=${encodeURIComponent(message)}`;
  }

  if (lines.length === 0) {
    return <p className="px-6 py-20 text-center text-ink-faint">سلتك فارغة.</p>;
  }

  return (
    <div className="mx-auto max-w-md px-4 py-8 sm:px-6">
      <h1 className="font-display mb-2 text-2xl">إتمام الطلب</h1>
      <p className="mb-6 text-sm text-ink-soft">
        الدفع والتوصيل يُرتبان معك مباشرة عبر واتساب بعد تأكيد الطلب.
      </p>

      <form onSubmit={handleSubmit} className="space-y-4">
        <div>
          <label className="mb-1 block text-sm">الاسم الكامل</label>
          <input
            required
            value={name}
            onChange={(e) => setName(e.target.value)}
            className="w-full rounded border border-ink/15 bg-paper-raised px-3 py-2.5 outline-none focus:border-gold"
          />
        </div>
        <div>
          <label className="mb-1 block text-sm">رقم الهاتف / واتساب</label>
          <input
            required
            dir="ltr"
            value={phone}
            onChange={(e) => setPhone(e.target.value)}
            placeholder="968XXXXXXXX"
            className="w-full rounded border border-ink/15 bg-paper-raised px-3 py-2.5 text-end outline-none focus:border-gold"
          />
        </div>
        <div>
          <label className="mb-1 block text-sm">الولاية</label>
          <input
            required
            value={state}
            onChange={(e) => setStateVal(e.target.value)}
            placeholder="مثال: بوشر"
            className="w-full rounded border border-ink/15 bg-paper-raised px-3 py-2.5 outline-none focus:border-gold"
          />
        </div>
        <div>
          <label className="mb-1 block text-sm">القرية / الحي</label>
          <input
            required
            value={village}
            onChange={(e) => setVillage(e.target.value)}
            placeholder="مثال: المعبيلة"
            className="w-full rounded border border-ink/15 bg-paper-raised px-3 py-2.5 outline-none focus:border-gold"
          />
        </div>
        <div>
          <label className="mb-1 block text-sm">ملاحظات (اختياري)</label>
          <textarea
            value={note}
            onChange={(e) => setNote(e.target.value)}
            rows={2}
            className="w-full rounded border border-ink/15 bg-paper-raised px-3 py-2.5 outline-none focus:border-gold"
          />
        </div>

        {error && <p className="text-sm text-rose-deep">{error}</p>}

        <div className="border-t border-ink/10 pt-4 text-lg font-semibold">
          الإجمالي: <span className="tabular-nums">{cartTotal(lines).toFixed(2)} ر.ع</span>
        </div>

        <button
          type="submit"
          disabled={submitting}
          className="w-full rounded-sm bg-ink py-3.5 text-sm font-medium text-paper disabled:opacity-50"
        >
          {submitting ? "جارٍ التأكيد..." : "تأكيد الطلب عبر واتساب"}
        </button>
      </form>
    </div>
  );
}
