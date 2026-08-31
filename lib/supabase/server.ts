import { createServerClient } from "@supabase/ssr";
import { cookies } from "next/headers";

// Server component / route handler client, running as the visiting
// user (anon or their logged-in admin session via cookies). Respects
// RLS normally — use this for anything a logged-in admin does.
export function createServerSupabase() {
  const cookieStore = cookies();
  return createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        get(name: string) {
          return cookieStore.get(name)?.value;
        },
        set(name: string, value: string, options: any) {
          try {
            cookieStore.set({ name, value, ...options });
          } catch {
            // Called from a Server Component with no response to write
            // to — safe to ignore, middleware refreshes the session.
          }
        },
        remove(name: string, options: any) {
          try {
            cookieStore.set({ name, value: "", ...options });
          } catch {
            // See note above.
          }
        },
      },
    }
  );
}

// Service-role client: bypasses RLS entirely. NEVER import this file
// from a "use client" component or expose SUPABASE_SERVICE_ROLE_KEY to
// the browser. Only for trusted server code, e.g. /api/checkout calling
// place_order().
import { createClient as createRawClient } from "@supabase/supabase-js";

export function createServiceSupabase() {
  return createRawClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!,
    { auth: { persistSession: false } }
  );
}
