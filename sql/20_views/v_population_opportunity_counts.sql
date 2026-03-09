DROP VIEW IF EXISTS pop.v_population_opportunity_counts;

CREATE VIEW pop.v_population_opportunity_counts AS
WITH
    rfi AS (
        SELECT
            id_limit,
            SUM(open_opp) AS rfi_opp_total
        FROM
            pop.mv_player_rfi_counts
        GROUP BY
            id_limit
    ),
    open_resp AS (
        SELECT
            id_limit,
            SUM(def_opp) AS vs_open_opp_total
        FROM
            pop.mv_player_response_vs_open_counts
        GROUP BY
            id_limit
    ),
    threebet_resp AS (
        SELECT
            id_limit,
            SUM(defend_opp) AS vs_threebet_opp_total
        FROM
            pop.mv_player_response_vs_threebet_counts
        GROUP BY
            id_limit
    ),
    fourbet_resp AS (
        SELECT
            id_limit,
            SUM(fivebet_opp) AS vs_fourbet_opp_total
        FROM
            pop.mv_player_response_vs_fourbet_counts
        GROUP BY
            id_limit
    )
SELECT
    COALESCE(rfi.id_limit, o.id_limit, t.id_limit, f.id_limit) AS id_limit,
    COALESCE(rfi.rfi_opp_total, 0) AS rfi_opp_total,
    COALESCE(o.vs_open_opp_total, 0) AS vs_open_opp_total,
    COALESCE(t.vs_threebet_opp_total, 0) AS vs_threebet_opp_total,
    COALESCE(f.vs_fourbet_opp_total, 0) AS vs_fourbet_opp_total
FROM
    rfi
    FULL OUTER JOIN open_resp o ON o.id_limit = rfi.id_limit
    FULL OUTER JOIN threebet_resp t ON t.id_limit = COALESCE(rfi.id_limit, o.id_limit)
    FULL OUTER JOIN fourbet_resp f ON f.id_limit = COALESCE(rfi.id_limit, o.id_limit, t.id_limit);