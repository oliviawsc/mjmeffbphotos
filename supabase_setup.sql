-- Run this in the Supabase SQL Editor for the MJM project
-- Dashboard → SQL Editor → New query → paste → Run

CREATE TABLE IF NOT EXISTS transactions (
  id              TEXT PRIMARY KEY,
  date_time       TEXT,
  ticket_no       TEXT UNIQUE NOT NULL,
  supplier        TEXT,
  vehicle         TEXT,
  ffb_price       NUMERIC(10,2),
  nett_weight     NUMERIC(10,2),
  payout          NUMERIC(10,2),
  txn_type        TEXT,
  centre          TEXT,
  status          TEXT DEFAULT 'pending',
  remarks         TEXT,
  teller_name     TEXT,
  created_by      TEXT,
  created_at      BIGINT,
  completed_by    TEXT,
  completed_at    BIGINT,
  reviewed_by     TEXT,
  reviewed_at     BIGINT,
  returned_at     BIGINT,
  resubmitted_at  BIGINT,
  photos          JSONB DEFAULT '{}'::jsonb
);

-- Row Level Security (permissive — tighten once auth is added)
ALTER TABLE transactions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "anon_all" ON transactions
  FOR ALL USING (true) WITH CHECK (true);

-- Enable real-time updates
ALTER PUBLICATION supabase_realtime ADD TABLE transactions;
