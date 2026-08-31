import { NextResponse } from "next/server";
import { createServiceSupabase } from "@/lib/supabase/server";

// Trusted server-side checkout: takes whatever the client says is in
// the cart, but the actual price/stock come from the database inside
// place_order() (see supabase/schema.sql) — the client can't forge a
// lower price or a quantity beyond real stock.
export async function POST(request: Request) {
  const body = await request.json();
  const { customerName, customerPhone, customerNote, items } = body as {
    customerName: string;
    customerPhone: string;
    customerNote?: string;
    items: { variantId: string; quantity: number }[];
  };

  if (!customerName?.trim() || !customerPhone?.trim()) {
    return NextResponse.json({ error: "الاسم ورقم الهاتف مطلوبان" }, { status: 400 });
  }
  if (!items?.length) {
    return NextResponse.json({ error: "السلة فارغة" }, { status: 400 });
  }

  const supabase = createServiceSupabase();

  const { data: orderId, error } = await supabase.rpc("place_order", {
    p_customer_name: customerName.trim(),
    p_customer_phone: customerPhone.trim(),
    p_customer_note: customerNote?.trim() || null,
    p_items: items.map((i) => ({ variant_id: i.variantId, quantity: i.quantity })),
  });

  if (error) {
    return NextResponse.json({ error: error.message }, { status: 400 });
  }

  return NextResponse.json({ orderId });
}
