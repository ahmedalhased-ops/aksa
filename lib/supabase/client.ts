"use client";

// Browser-side Supabase client. Uses only the public URL + anon key —
// safe to ship to the client. RLS policies (see supabase/schema.sql)
// are what actually keep writes locked down, not this file.

import { createBrowserClient } from "@supabase/ssr";

export function createClient() {
  return createBrowserClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!
  );
}
