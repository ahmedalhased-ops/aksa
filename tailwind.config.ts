import type { Config } from "tailwindcss";

const config: Config = {
  content: ["./app/**/*.{ts,tsx}", "./components/**/*.{ts,tsx}"],
  theme: {
    extend: {
      colors: {
        ink: "#1c1512",
        "ink-soft": "#5a4c44",
        "ink-faint": "#8a796e",
        paper: "#f6efe4",
        "paper-raised": "#fffbf4",
        rose: "#a8456a",
        "rose-deep": "#6f2542",
        "rose-brand": "#d9748c",
        gold: "#9c7a35",
        "gold-soft": "#cdad6c",
      },
      fontFamily: {
        display: ["Prata", "serif"],
        "display-ar": ["Aref Ruqaa", "serif"],
        body: ["Jost", "sans-serif"],
        "body-ar": ["Tajawal", "sans-serif"],
      },
    },
  },
  plugins: [],
};

export default config;
