-- ops/clean.sql
DROP VIEW IF EXISTS pop.v_population_preflop;

DROP VIEW IF EXISTS pop.v_population_fold_vs_threebet;

DROP VIEW IF EXISTS pop.v_population_call_vs_threebet;

DROP VIEW IF EXISTS pop.v_population_fourbet_vs_threebet;

DROP VIEW IF EXISTS pop.v_population_fold_vs_open;

DROP VIEW IF EXISTS pop.v_population_call_vs_open;

DROP VIEW IF EXISTS pop.v_population_threebet_vs_open;

DROP VIEW IF EXISTS pop.v_population_rfi;

DROP VIEW IF EXISTS pop.v_player_preflop;

DROP VIEW IF EXISTS pop.v_player_fourbet_vs_threebet;

DROP VIEW IF EXISTS pop.v_player_call_vs_threebet;

DROP VIEW IF EXISTS pop.v_player_fold_vs_open;

DROP VIEW IF EXISTS pop.v_player_threebet_vs_open;

DROP VIEW IF EXISTS pop.v_player_call_vs_open;

DROP VIEW IF EXISTS pop.v_player_rfi;

DROP MATERIALIZED VIEW IF EXISTS pop.mv_player_fourbet_vs_threebet_counts;

DROP MATERIALIZED VIEW IF EXISTS pop.mv_player_call_vs_threebet_counts;

DROP MATERIALIZED VIEW IF EXISTS pop.mv_player_threebet_vs_open_counts;

DROP MATERIALIZED VIEW IF EXISTS pop.mv_player_call_vs_open_counts;

DROP MATERIALIZED VIEW IF EXISTS pop.mv_player_rfi_counts;

DROP VIEW IF EXISTS pop.v_hand_limits;