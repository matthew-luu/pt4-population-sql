DROP PROCEDURE IF EXISTS pop.refresh_population_views();

CREATE PROCEDURE pop.refresh_population_views()
LANGUAGE sql
AS $$
    REFRESH MATERIALIZED VIEW pop.mv_player_rfi_counts;
    REFRESH MATERIALIZED VIEW pop.mv_player_response_vs_open_counts;
    REFRESH MATERIALIZED VIEW pop.mv_player_response_vs_threebet_counts;
    REFRESH MATERIALIZED VIEW pop.mv_player_response_vs_fourbet_counts;
$$;