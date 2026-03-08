\set ON_ERROR_STOP on

\echo ===== Running verification tests =====
\i sql/25_tests/t_001_population_uniqueness.sql
\i sql/25_tests/t_002_materialized_view_counts_valid.sql
\i sql/25_tests/t_003_population_percent_ranges.sql
\i sql/25_tests/t_004_open_branch_sums.sql
\i sql/25_tests/t_005_3bet_branch_sums.sql

\echo ===== Verification complete =====