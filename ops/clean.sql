-- ops/clean.sql
DROP VIEW IF EXISTS pop.v_population_preflop;

DROP VIEW IF EXISTS pop.v_pop_3bet;

DROP VIEW IF EXISTS pop.v_pop_call_vs_open;

DROP VIEW IF EXISTS pop.v_pop_rfi;

DROP MATERIALIZED VIEW IF EXISTS pop.mv_pop_3bet_counts;

DROP MATERIALIZED VIEW IF EXISTS pop.mv_pop_2bet_def_counts;

DROP MATERIALIZED VIEW IF EXISTS pop.mv_pop_rfi_counts;

DROP VIEW IF EXISTS pop.v_hand_stakes;