\set ON_ERROR_STOP on

\echo ===== Building bootstrap =====
\i sql/00_bootstrap/00_create_schema.sql
\i sql/00_bootstrap/01_set_search_path.sql

\echo ===== Cleaning Old Views =====
\i ops/clean.sql

\echo ===== Building foundation views =====
\i sql/05_foundation_views/v_hand_limits.sql

\echo ===== Building materialized views =====
\i sql/10_materialized_views/mv_player_rfi_counts.sql
\i sql/10_materialized_views/mv_player_response_vs_open_counts.sql
\i sql/10_materialized_views/mv_player_response_vs_threebet_counts.sql
\i sql/10_materialized_views/mv_player_response_vs_fourbet_counts.sql

\echo ===== Building views =====

--Player Views

-- open
\i sql/20_views/v_player_rfi.sql
--  vs open
\i sql/20_views/v_player_call_vs_open.sql
\i sql/20_views/v_player_threebet_vs_open.sql
\i sql/20_views/v_player_fold_vs_open.sql
-- vs threebet
\i sql/20_views/v_player_call_vs_threebet.sql
\i sql/20_views/v_player_fourbet_vs_threebet.sql
\i sql/20_views/v_player_fold_vs_threebet.sql
-- vs fourbet
\i sql/20_views/v_player_call_vs_fourbet.sql
\i sql/20_views/v_player_fivebet_vs_fourbet.sql
\i sql/20_views/v_player_fold_vs_fourbet.sql
\i sql/20_views/v_player_preflop.sql

--Population Views

-- open
\i sql/20_views/v_population_rfi.sql
--  vs open
\i sql/20_views/v_population_call_vs_open.sql
\i sql/20_views/v_population_threebet_vs_open.sql
\i sql/20_views/v_population_fold_vs_open.sql
-- vs threebet
\i sql/20_views/v_population_call_vs_threebet.sql
\i sql/20_views/v_population_fourbet_vs_threebet.sql
\i sql/20_views/v_population_fold_vs_threebet.sql
-- vs fourbet
\i sql/20_views/v_population_call_vs_fourbet.sql
\i sql/20_views/v_population_fivebet_vs_fourbet.sql
\i sql/20_views/v_population_fold_vs_fourbet.sql

\i sql/20_views/v_population_opportunity_counts.sql
\i sql/20_views/v_population_preflop.sql