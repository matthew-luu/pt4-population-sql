\set ON_ERROR_STOP on

\echo ===== Exporting reports =====
\i sql/35_exports/x_population_rfi.sql
\i sql/35_exports/x_population_call_vs_open.sql
\i sql/35_exports/x_population_3bet_vs_open.sql
\i sql/35_exports/x_population_fold_vs_open.sql
\i sql/35_exports/x_population_call_vs_3bet.sql
\i sql/35_exports/x_population_4bet_vs_3bet.sql
\i sql/35_exports/x_population_fold_vs_3bet.sql
\i sql/35_exports/x_population_preflop.sql