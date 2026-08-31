"use client";

import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";

export default function LogoutButton() {
  const router = useRouter();
  return (
    <button
      onClick={async () => {
        await createClient().auth.signOut();
        router.push("/admin/login");
        router.refresh();
      }}
      className="text-sm text-ink-faint hover:text-rose-deep"
    >
      خروج
    </button>
  );
}
