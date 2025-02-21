import type { Config } from "drizzle-kit";

export default {
  schema: "./schema.ts",
  out: "./drizzle/migrations",
  dialect: "sqlite",
  dbCredentials: {
    url: "database.db", // Path to SQLite database
  },
} satisfies Config;
