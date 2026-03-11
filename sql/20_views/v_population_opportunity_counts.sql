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
                    defend_pos = 2
            ) AS hj_vs_open_opp,
            SUM(def_opp) FILTER (
                WHERE
                    defend_pos = 1
            ) AS co_vs_open_opp,
            SUM(def_opp) FILTER (
                WHERE
                    defend_pos = 0
            ) AS btn_vs_open_opp,
            SUM(def_opp) FILTER (
                WHERE
                    defend_pos = 9
            ) AS sb_vs_open_opp,
            SUM(def_opp) FILTER (
                WHERE
                    defend_pos = 8
            ) AS bb_vs_open_opp
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
            ) AS lj_vs_threebet_opp,
            SUM(defend_opp) FILTER (
                WHERE
                    defend_pos = 2
            ) AS hj_vs_threebet_opp,
            SUM(defend_opp) FILTER (
                WHERE
                    defend_pos = 1
            ) AS co_vs_threebet_opp,
            SUM(defend_opp) FILTER (
                WHERE
                    defend_pos = 0
            ) AS btn_vs_threebet_opp,
            SUM(defend_opp) FILTER (
                WHERE
                    defend_pos = 9
            ) AS sb_vs_threebet_opp
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
            ) AS hj_vs_fourbet_opp,
            SUM(fivebet_opp) FILTER (
                WHERE
                    defender_pos = 1
            ) AS co_vs_fourbet_opp,
            SUM(fivebet_opp) FILTER (
                WHERE
                    defender_pos = 0
            ) AS btn_vs_fourbet_opp,
            SUM(fivebet_opp) FILTER (
                WHERE
                    defender_pos = 9
            ) AS sb_vs_fourbet_opp,
            SUM(fivebet_opp) FILTER (
                WHERE
                    defender_pos = 8
            ) AS bb_vs_fourbet_opp
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
    COALESCE(o.hj_vs_open_opp, 0) AS hj_vs_open_opp,
    COALESCE(o.co_vs_open_opp, 0) AS co_vs_open_opp,
    COALESCE(o.btn_vs_open_opp, 0) AS btn_vs_open_opp,
    COALESCE(o.sb_vs_open_opp, 0) AS sb_vs_open_opp,
    COALESCE(o.bb_vs_open_opp, 0) AS bb_vs_open_opp,
    COALESCE(t.lj_vs_threebet_opp, 0) AS lj_vs_threebet_opp,
    COALESCE(t.hj_vs_threebet_opp, 0) AS hj_vs_threebet_opp,
    COALESCE(t.co_vs_threebet_opp, 0) AS co_vs_threebet_opp,
    COALESCE(t.btn_vs_threebet_opp, 0) AS btn_vs_threebet_opp,
    COALESCE(t.sb_vs_threebet_opp, 0) AS sb_vs_threebet_opp,
    COALESCE(f.hj_vs_fourbet_opp, 0) AS hj_vs_fourbet_opp,
    COALESCE(f.co_vs_fourbet_opp, 0) AS co_vs_fourbet_opp,
    COALESCE(f.btn_vs_fourbet_opp, 0) AS btn_vs_fourbet_opp,
    COALESCE(f.sb_vs_fourbet_opp, 0) AS sb_vs_fourbet_opp,
    COALESCE(f.bb_vs_fourbet_opp, 0) AS bb_vs_fourbet_opp
FROM
    rfi r
    FULL OUTER JOIN open_resp o ON o.id_limit = r.id_limit
    FULL OUTER JOIN threebet_resp t ON t.id_limit = COALESCE(r.id_limit, o.id_limit)
    FULL OUTER JOIN fourbet_resp f ON f.id_limit = COALESCE(r.id_limit, o.id_limit, t.id_limit);