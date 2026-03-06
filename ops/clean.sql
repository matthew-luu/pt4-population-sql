-- ops/clean.sql
DROP VIEW IF EXISTS pop.v_population_preflop;

DROP VIEW IF EXISTS pop.v_player_preflop;

DROP VIEW IF EXISTS pop.v_player_3bet;

DROP VIEW IF EXISTS pop.v_player_call_vs_open;

DROP VIEW IF EXISTS pop.v_player_rfi;

DROP MATERIALIZED VIEW IF EXISTS pop.mv_player_3bet_counts;

DROP MATERIALIZED VIEW IF EXISTS pop.mv_player_2bet_def_counts;

DROP MATERIALIZED VIEW IF EXISTS pop.mv_player_rfi_counts;

DROP VIEW IF EXISTS pop.v_hand_limits;