import { Hono } from 'hono'
import { handle } from 'hono/vercel'
import { status } from '../../../schema'
import { drizzle } from "drizzle-orm/better-sqlite3";
import Database from 'better-sqlite3';

import * as schema from '../../../schema'

const app = new Hono().basePath('/api')

app.get('/hello', (c) => {
  return c.json({
    message: 'Hello from Hono!'
  })
})


app.get('/statuses', async (c) => {
  const DB = new Database("database.db"); 
  const db = drizzle(DB, { schema })
  const result = await db
    .select()
    .from(status)
    .all();

  return c.json(result);
})

export const GET = handle(app)
