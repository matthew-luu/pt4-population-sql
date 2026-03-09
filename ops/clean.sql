--Poulation Views
DROP VIEW IF EXISTS pop.v_population_preflop;

DROP VIEW IF EXISTS pop.v_population_opportunity_counts;

--  vs fourbet
DROP VIEW IF EXISTS pop.v_population_fold_vs_fourbet;

DROP VIEW IF EXISTS pop.v_population_fivebet_vs_fourbet;

DROP VIEW IF EXISTS pop.v_population_call_vs_fourbet;

--  vs threebet
DROP VIEW IF EXISTS pop.v_population_fold_vs_threebet;

DROP VIEW IF EXISTS pop.v_population_call_vs_threebet;

DROP VIEW IF EXISTS pop.v_population_fourbet_vs_threebet;

--  vs open
DROP VIEW IF EXISTS pop.v_population_fold_vs_open;

DROP VIEW IF EXISTS pop.v_population_call_vs_open;

DROP VIEW IF EXISTS pop.v_population_threebet_vs_open;

--  open
DROP VIEW IF EXISTS pop.v_population_rfi;

--Player Views
DROP VIEW IF EXISTS pop.v_player_preflop;

-- vs fourbet
DROP VIEW IF EXISTS pop.v_player_fold_vs_fourbet;

DROP VIEW IF EXISTS pop.v_player_call_vs_fourbet;

DROP VIEW IF EXISTS pop.v_player_fivebet_vs_fourbet;

--  vs threebet
DROP VIEW IF EXISTS pop.v_player_fold_vs_threebet;

DROP VIEW IF EXISTS pop.v_player_fourbet_vs_threebet;

DROP VIEW IF EXISTS pop.v_player_call_vs_threebet;

--  vs open
DROP VIEW IF EXISTS pop.v_player_fold_vs_open;

DROP VIEW IF EXISTS pop.v_player_threebet_vs_open;

DROP VIEW IF EXISTS pop.v_player_call_vs_open;

--  open
DROP VIEW IF EXISTS pop.v_player_rfi;

--Materialized Views
DROP MATERIALIZED VIEW IF EXISTS pop.mv_player_response_vs_fourbet_counts;

DROP MATERIALIZED VIEW IF EXISTS pop.mv_player_response_vs_threebet_counts;

DROP MATERIALIZED VIEW IF EXISTS pop.mv_player_response_vs_open_counts;

DROP MATERIALIZED VIEW IF EXISTS pop.mv_player_rfi_counts;

--Foundation Views
DROP VIEW IF EXISTS pop.v_hand_limits;