-- Optional convenience.
-- Replace postgres with your Postgres username if different.
ALTER ROLE postgres
SET
    search_path = pop,
    public;