import { createServerSupabase } from "@/lib/supabase/server";

export const revalidate = 0;

export default async function AdminOrdersPage() {
  const supabase = createServerSupabase();
  const { data: orders } = await supabase
    .from("orders")
    .select("*, order_items(*)")
    .order("created_at", { ascending: false });

  return (
    <div>
      <h1 className="font-display mb-6 text-2xl">الطلبات</h1>
      <div className="space-y-4">
        {(orders ?? []).map((order: any) => (
          <div key={order.id} className="rounded border border-ink/10 p-4">
            <div className="flex flex-wrap items-center justify-between gap-2">
              <div>
                <p className="font-medium">{order.customer_name}</p>
                <p dir="ltr" className="text-end text-sm text-ink-faint">
                  {order.customer_phone}
                </p>
                <p className="text-sm text-ink-faint">
                  {order.customer_state} — {order.customer_village}
                </p>
              </div>
              <span className="rounded-full bg-paper-raised px-3 py-1 text-xs">
                {order.status}
              </span>
            </div>
            <ul className="mt-3 space-y-1 text-sm text-ink-soft">
              {order.order_items.map((item: any) => (
                <li key={item.id}>
                  {item.product_name} ({item.color}) × {item.quantity} —{" "}
                  {(item.unit_price * item.quantity).toFixed(2)} ر.ع
                </li>
              ))}
            </ul>
            <p className="mt-2 text-sm font-semibold">الإجمالي: {order.total} ر.ع</p>
            {order.customer_note && (
              <p className="mt-1 text-xs text-ink-faint">ملاحظة: {order.customer_note}</p>
            )}
          </div>
        ))}
        {(!orders || orders.length === 0) && (
          <p className="py-10 text-center text-ink-faint">لا توجد طلبات بعد.</p>
        )}
      </div>
    </div>
  );
}
