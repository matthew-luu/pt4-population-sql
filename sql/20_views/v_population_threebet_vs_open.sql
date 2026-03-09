DROP VIEW IF EXISTS pop.v_population_threebet_vs_open;

CREATE VIEW
    pop.v_population_threebet_vs_open AS
SELECT
    t.id_limit,
    ROUND(
        100.0 * SUM(t.threebet_cnt) FILTER (
            WHERE
                t.defend_pos = 2
                AND t.open_pos = 3
        ) / NULLIF(
            SUM(t.def_opp) FILTER (
                WHERE
                    t.defend_pos = 2
                    AND t.open_pos = 3
            ),
            0
        ),
        2
    ) AS threebet_hj_vs_lj,
    ROUND(
        100.0 * SUM(t.threebet_cnt) FILTER (
            WHERE
                t.defend_pos = 1
                AND t.open_pos = 3
        ) / NULLIF(
            SUM(t.def_opp) FILTER (
                WHERE
                    t.defend_pos = 1
                    AND t.open_pos = 3
            ),
            0
        ),
        2
    ) AS threebet_co_vs_lj,
    ROUND(
        100.0 * SUM(t.threebet_cnt) FILTER (
            WHERE
                t.defend_pos = 1
                AND t.open_pos = 2
        ) / NULLIF(
            SUM(t.def_opp) FILTER (
                WHERE
                    t.defend_pos = 1
                    AND t.open_pos = 2
            ),
            0
        ),
        2
    ) AS threebet_co_vs_hj,
    ROUND(
        100.0 * SUM(t.threebet_cnt) FILTER (
            WHERE
                t.defend_pos = 0
                AND t.open_pos = 3
        ) / NULLIF(
            SUM(t.def_opp) FILTER (
                WHERE
                    t.defend_pos = 0
                    AND t.open_pos = 3
            ),
            0
        ),
        2
    ) AS threebet_btn_vs_lj,
    ROUND(
        100.0 * SUM(t.threebet_cnt) FILTER (
            WHERE
                t.defend_pos = 0
                AND t.open_pos = 2
        ) / NULLIF(
            SUM(t.def_opp) FILTER (
                WHERE
                    t.defend_pos = 0
                    AND t.open_pos = 2
            ),
            0
        ),
        2
    ) AS threebet_btn_vs_hj,
    ROUND(
        100.0 * SUM(t.threebet_cnt) FILTER (
            WHERE
                t.defend_pos = 0
                AND t.open_pos = 1
        ) / NULLIF(
            SUM(t.def_opp) FILTER (
                WHERE
                    t.defend_pos = 0
                    AND t.open_pos = 1
            ),
            0
        ),
        2
    ) AS threebet_btn_vs_co,
    ROUND(
        100.0 * SUM(t.threebet_cnt) FILTER (
            WHERE
                t.defend_pos = 9
                AND t.open_pos = 3
        ) / NULLIF(
            SUM(t.def_opp) FILTER (
                WHERE
                    t.defend_pos = 9
                    AND t.open_pos = 3
            ),
            0
        ),
        2
    ) AS threebet_sb_vs_lj,
    ROUND(
        100.0 * SUM(t.threebet_cnt) FILTER (
            WHERE
                t.defend_pos = 9
                AND t.open_pos = 2
        ) / NULLIF(
            SUM(t.def_opp) FILTER (
                WHERE
                    t.defend_pos = 9
                    AND t.open_pos = 2
            ),
            0
        ),
        2
    ) AS threebet_sb_vs_hj,
    ROUND(
        100.0 * SUM(t.threebet_cnt) FILTER (
            WHERE
                t.defend_pos = 9
                AND t.open_pos = 1
        ) / NULLIF(
            SUM(t.def_opp) FILTER (
                WHERE
                    t.defend_pos = 9
                    AND t.open_pos = 1
            ),
            0
        ),
        2
    ) AS threebet_sb_vs_co,
    ROUND(
        100.0 * SUM(t.threebet_cnt) FILTER (
            WHERE
                t.defend_pos = 9
                AND t.open_pos = 0
        ) / NULLIF(
            SUM(t.def_opp) FILTER (
                WHERE
                    t.defend_pos = 9
                    AND t.open_pos = 0
            ),
            0
        ),
        2
    ) AS threebet_sb_vs_btn,
    ROUND(
        100.0 * SUM(t.threebet_cnt) FILTER (
            WHERE
                t.defend_pos = 8
                AND t.open_pos = 3
        ) / NULLIF(
            SUM(t.def_opp) FILTER (
                WHERE
                    t.defend_pos = 8
                    AND t.open_pos = 3
            ),
            0
        ),
        2
    ) AS threebet_bb_vs_lj,
    ROUND(
        100.0 * SUM(t.threebet_cnt) FILTER (
            WHERE
                t.defend_pos = 8
                AND t.open_pos = 2
        ) / NULLIF(
            SUM(t.def_opp) FILTER (
                WHERE
                    t.defend_pos = 8
                    AND t.open_pos = 2
            ),
            0
        ),
        2
    ) AS threebet_bb_vs_hj,
    ROUND(
        100.0 * SUM(t.threebet_cnt) FILTER (
            WHERE
                t.defend_pos = 8
                AND t.open_pos = 1
        ) / NULLIF(
            SUM(t.def_opp) FILTER (
                WHERE
                    t.defend_pos = 8
                    AND t.open_pos = 1
            ),
            0
        ),
        2
    ) AS threebet_bb_vs_co,
    ROUND(
        100.0 * SUM(t.threebet_cnt) FILTER (
            WHERE
                t.defend_pos = 8
                AND t.open_pos = 0
        ) / NULLIF(
            SUM(t.def_opp) FILTER (
                WHERE
                    t.defend_pos = 8
                    AND t.open_pos = 0
            ),
            0
        ),
        2
    ) AS threebet_bb_vs_btn,
    ROUND(
        100.0 * SUM(t.threebet_cnt) FILTER (
            WHERE
                t.defend_pos = 8
                AND t.open_pos = 9
        ) / NULLIF(
            SUM(t.def_opp) FILTER (
                WHERE
                    t.defend_pos = 8
                    AND t.open_pos = 9
            ),
            0
        ),
        2
    ) AS threebet_bb_vs_sb
FROM
    pop.mv_player_response_vs_open_counts t
GROUP BY
    t.id_limit