DROP VIEW IF EXISTS pop.v_population_opportunity_counts;

CREATE VIEW
    pop.v_population_opportunity_counts AS
WITH
    rfi AS (
        SELECT
            id_limit,
            SUM(open_opp) FILTER (
                WHERE
                    pos = 3
            ) AS rfi_lj_opp,
            SUM(open_opp) FILTER (
                WHERE
                    pos = 2
            ) AS rfi_hj_opp,
            SUM(open_opp) FILTER (
                WHERE
                    pos = 1
            ) AS rfi_co_opp,
            SUM(open_opp) FILTER (
                WHERE
                    pos = 0
            ) AS rfi_btn_opp,
            SUM(open_opp) FILTER (
                WHERE
                    pos = 9
            ) AS rfi_sb_opp
        FROM
            pop.mv_player_rfi_counts
        GROUP BY
            id_limit
    ),
    open_resp AS (
        SELECT
            id_limit,
            SUM(def_opp) FILTER (
                WHERE
                    open_pos = 3
            ) AS vs_open_lj_opp,
            SUM(def_opp) FILTER (
                WHERE
                    open_pos = 2
            ) AS vs_open_hj_opp,
            SUM(def_opp) FILTER (
                WHERE
                    open_pos = 1
            ) AS vs_open_co_opp,
            SUM(def_opp) FILTER (
                WHERE
                    open_pos = 0
            ) AS vs_open_btn_opp,
            SUM(def_opp) FILTER (
                WHERE
                    open_pos = 9
            ) AS vs_open_sb_opp
        FROM
            pop.mv_player_response_vs_open_counts
        GROUP BY
            id_limit
    ),
    threebet_resp AS (
        SELECT
            id_limit,
            SUM(defend_opp) FILTER (
                WHERE
                    defend_pos = 3
            ) AS vs_threebet_lj_opp,
            SUM(defend_opp) FILTER (
                WHERE
                    defend_pos = 2
            ) AS vs_threebet_hj_opp,
            SUM(defend_opp) FILTER (
                WHERE
                    defend_pos = 1
            ) AS vs_threebet_co_opp,
            SUM(defend_opp) FILTER (
                WHERE
                    defend_pos = 0
            ) AS vs_threebet_btn_opp,
            SUM(defend_opp) FILTER (
                WHERE
                    defend_pos = 9
            ) AS vs_threebet_sb_opp
        FROM
            pop.mv_player_response_vs_threebet_counts
        GROUP BY
            id_limit
    ),
    fourbet_resp AS (
        SELECT
            id_limit,
            SUM(fivebet_opp) FILTER (
                WHERE
                    defender_pos = 2
            ) AS vs_fourbet_hj_opp,
            SUM(fivebet_opp) FILTER (
                WHERE
                    defender_pos = 1
            ) AS vs_fourbet_co_opp,
            SUM(fivebet_opp) FILTER (
                WHERE
                    defender_pos = 0
            ) AS vs_fourbet_btn_opp,
            SUM(fivebet_opp) FILTER (
                WHERE
                    defender_pos = 9
            ) AS vs_fourbet_sb_opp,
            SUM(fivebet_opp) FILTER (
                WHERE
                    defender_pos = 8
            ) AS vs_fourbet_bb_opp
        FROM
            pop.mv_player_response_vs_fourbet_counts
        GROUP BY
            id_limit
    )
SELECT
    COALESCE(r.id_limit, o.id_limit, t.id_limit, f.id_limit) AS id_limit,
    COALESCE(r.rfi_lj_opp, 0) AS rfi_lj_opp,
    COALESCE(r.rfi_hj_opp, 0) AS rfi_hj_opp,
    COALESCE(r.rfi_co_opp, 0) AS rfi_co_opp,
    COALESCE(r.rfi_btn_opp, 0) AS rfi_btn_opp,
    COALESCE(r.rfi_sb_opp, 0) AS rfi_sb_opp,
    COALESCE(o.vs_open_lj_opp, 0) AS vs_open_lj_opp,
    COALESCE(o.vs_open_hj_opp, 0) AS vs_open_hj_opp,
    COALESCE(o.vs_open_co_opp, 0) AS vs_open_co_opp,
    COALESCE(o.vs_open_btn_opp, 0) AS vs_open_btn_opp,
    COALESCE(o.vs_open_sb_opp, 0) AS vs_open_sb_opp,
    COALESCE(t.vs_threebet_lj_opp, 0) AS vs_threebet_lj_opp,
    COALESCE(t.vs_threebet_hj_opp, 0) AS vs_threebet_hj_opp,
    COALESCE(t.vs_threebet_co_opp, 0) AS vs_threebet_co_opp,
    COALESCE(t.vs_threebet_btn_opp, 0) AS vs_threebet_btn_opp,
    COALESCE(t.vs_threebet_sb_opp, 0) AS vs_threebet_sb_opp,
    COALESCE(f.vs_fourbet_hj_opp, 0) AS vs_fourbet_hj_opp,
    COALESCE(f.vs_fourbet_co_opp, 0) AS vs_fourbet_co_opp,
    COALESCE(f.vs_fourbet_btn_opp, 0) AS vs_fourbet_btn_opp,
    COALESCE(f.vs_fourbet_sb_opp, 0) AS vs_fourbet_sb_opp,
    COALESCE(f.vs_fourbet_bb_opp, 0) AS vs_fourbet_bb_opp
FROM
    rfi r
    FULL OUTER JOIN open_resp o ON o.id_limit = r.id_limit
    FULL OUTER JOIN threebet_resp t ON t.id_limit = COALESCE(r.id_limit, o.id_limit)
    FULL OUTER JOIN fourbet_resp f ON f.id_limit = COALESCE(r.id_limit, o.id_limit, t.id_limit);