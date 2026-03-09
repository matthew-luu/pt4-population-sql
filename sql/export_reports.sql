\set ON_ERROR_STOP on

\echo ===== Exporting reports =====
\i sql/35_exports/x_population_rfi.sql
\i sql/35_exports/x_population_call_vs_open.sql
\i sql/35_exports/x_population_threebet_vs_open.sql
\i sql/35_exports/x_population_fold_vs_open.sql
\i sql/35_exports/x_population_call_vs_threebet.sql
\i sql/35_exports/x_population_fourbet_vs_threebet.sql
\i sql/35_exports/x_population_fold_vs_threebet.sql
\i sql/35_exports/x_population_call_vs_fourbet.sql
\i sql/35_exports/x_population_fivebet_vs_fourbet.sql
\i sql/35_exports/x_population_fold_vs_fourbet.sql
\i sql/35_exports/x_population_preflop.sql

-- Custom reports
\i sql/35_exports/custom/x_population.sql