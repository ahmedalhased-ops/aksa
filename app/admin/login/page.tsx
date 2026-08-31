"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";

export default function AdminLoginPage() {
  const router = useRouter();
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    setLoading(true);
    setError(null);

    const supabase = createClient();
    const { error } = await supabase.auth.signInWithPassword({ email, password });

    setLoading(false);
    if (error) {
      setError("بيانات الدخول غير صحيحة.");
      return;
    }
    router.push("/admin/products");
    router.refresh();
  }

  return (
    <div className="mx-auto flex min-h-[70vh] max-w-sm items-center px-6">
      <form onSubmit={handleSubmit} className="w-full space-y-4">
        <h1 className="font-display text-center text-2xl">لوحة تحكم أكسا</h1>
        <div>
          <label className="mb-1 block text-sm">البريد الإلكتروني</label>
          <input
            type="email"
            required
            dir="ltr"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            className="w-full rounded border border-ink/15 px-3 py-2.5 outline-none focus:border-gold"
          />
        </div>
        <div>
          <label className="mb-1 block text-sm">كلمة المرور</label>
          <input
            type="password"
            required
            dir="ltr"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            className="w-full rounded border border-ink/15 px-3 py-2.5 outline-none focus:border-gold"
          />
        </div>
        {error && <p className="text-sm text-rose-deep">{error}</p>}
        <button
          type="submit"
          disabled={loading}
          className="w-full rounded-sm bg-ink py-3 text-sm font-medium text-paper disabled:opacity-50"
        >
          {loading ? "..." : "دخول"}
        </button>
        <p className="text-center text-xs text-ink-faint">
          أنشئ حساب الأدمن من Supabase → Authentication → Add user.
        </p>
      </form>
    </div>
  );
}
