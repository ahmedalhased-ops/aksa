// The houses AKSA actually carries. Order is deliberate: alternate
// watchmakers and bag houses so the wall reads as a boutique, not a list.
const BRANDS = [
  "AIGNER",
  "MICHAEL KORS",
  "ANNE KLEIN",
  "TORY BURCH",
  "DKNY",
  "JW PEI",
  "COACH",
  "ESCADA",
  "GUESS",
  "KURT GEIGER",
  "DAISY DIXON",
  "CERRUTI 1881",
];

/**
 * A slow, endless procession of brand names beneath the hero — the
 * quiet "brand wall" every luxury floor has. Pure CSS; pauses on hover.
 */
export default function BrandMarquee() {
  const row = [...BRANDS, ...BRANDS]; // doubled for a seamless loop

  return (
    <div className="marquee overflow-hidden border-y border-ink/10 py-4" aria-label="الماركات المتوفرة">
      <div className="marquee-track">
        {row.map((name, i) => (
          <span
            key={`${name}-${i}`}
            className="flex items-center gap-8 px-4 font-body text-[11px] font-medium uppercase tracking-[0.35em] text-ink-soft"
            aria-hidden={i >= BRANDS.length}
          >
            {name}
            <span className="h-1 w-1 rounded-full bg-gold-soft" />
          </span>
        ))}
      </div>
    </div>
  );
}
