\set ON_ERROR_STOP on

-- Bootstrap
\i sql/00_bootstrap/00_create_schema.sql
\i sql/00_bootstrap/01_set_search_path.sql

--Clean
\i ops/clean.sql

-- Foundational views
\i sql/05_foundation_views/v_hand_limits.sql

-- Materialized views
\i sql/10_materialized_views/mv_pop_rfi_counts.sql
\i sql/10_materialized_views/mv_pop_2bet_def_counts.sql
\i sql/10_materialized_views/mv_pop_3bet_counts.sql

-- Views
\i sql/20_views/v_pop_rfi.sql
\i sql/20_views/v_pop_call_vs_open.sql
\i sql/20_views/v_pop_3bet.sql
\i sql/20_views/v_population_preflop.sql

-- Refresh
\i ops/refresh_mvs.sql

-- Optional sanity check (uncomment if you add the file)
-- \i ops/sanity_objects.sql