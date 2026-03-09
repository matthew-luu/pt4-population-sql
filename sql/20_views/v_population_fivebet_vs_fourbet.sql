DROP VIEW IF EXISTS pop.v_population_fivebet_vs_fourbet;

CREATE VIEW
    pop.v_population_fivebet_vs_fourbet AS
SELECT
    r.id_limit,
    ROUND(
        100.0 * SUM(r.fivebet_cnt) FILTER (
            WHERE
                r.defender_pos = 2
                AND r.fourbettor_pos = 3
        ) / NULLIF(
            SUM(r.fivebet_opp) FILTER (
                WHERE
                    r.defender_pos = 2
                    AND r.fourbettor_pos = 3
            ),
            0
        ),
        2
    ) AS fivebet_hj_vs_fourbet_lj,
    ROUND(
        100.0 * SUM(r.fivebet_cnt) FILTER (
            WHERE
                r.defender_pos = 1
                AND r.fourbettor_pos = 3
        ) / NULLIF(
            SUM(r.fivebet_opp) FILTER (
                WHERE
                    r.defender_pos = 1
                    AND r.fourbettor_pos = 3
            ),
            0
        ),
        2
    ) AS fivebet_co_vs_fourbet_lj,
    ROUND(
        100.0 * SUM(r.fivebet_cnt) FILTER (
            WHERE
                r.defender_pos = 1
                AND r.fourbettor_pos = 2
        ) / NULLIF(
            SUM(r.fivebet_opp) FILTER (
                WHERE
                    r.defender_pos = 1
                    AND r.fourbettor_pos = 2
            ),
            0
        ),
        2
    ) AS fivebet_co_vs_fourbet_hj,
    ROUND(
        100.0 * SUM(r.fivebet_cnt) FILTER (
            WHERE
                r.defender_pos = 0
                AND r.fourbettor_pos = 3
        ) / NULLIF(
            SUM(r.fivebet_opp) FILTER (
                WHERE
                    r.defender_pos = 0
                    AND r.fourbettor_pos = 3
            ),
            0
        ),
        2
    ) AS fivebet_btn_vs_fourbet_lj,
    ROUND(
        100.0 * SUM(r.fivebet_cnt) FILTER (
            WHERE
                r.defender_pos = 0
                AND r.fourbettor_pos = 2
        ) / NULLIF(
            SUM(r.fivebet_opp) FILTER (
                WHERE
                    r.defender_pos = 0
                    AND r.fourbettor_pos = 2
            ),
            0
        ),
        2
    ) AS fivebet_btn_vs_fourbet_hj,
    ROUND(
        100.0 * SUM(r.fivebet_cnt) FILTER (
            WHERE
                r.defender_pos = 0
                AND r.fourbettor_pos = 1
        ) / NULLIF(
            SUM(r.fivebet_opp) FILTER (
                WHERE
                    r.defender_pos = 0
                    AND r.fourbettor_pos = 1
            ),
            0
        ),
        2
    ) AS fivebet_btn_vs_fourbet_co,
    ROUND(
        100.0 * SUM(r.fivebet_cnt) FILTER (
            WHERE
                r.defender_pos = 9
                AND r.fourbettor_pos = 3
        ) / NULLIF(
            SUM(r.fivebet_opp) FILTER (
                WHERE
                    r.defender_pos = 9
                    AND r.fourbettor_pos = 3
            ),
            0
        ),
        2
    ) AS fivebet_sb_vs_fourbet_lj,
    ROUND(
        100.0 * SUM(r.fivebet_cnt) FILTER (
            WHERE
                r.defender_pos = 9
                AND r.fourbettor_pos = 2
        ) / NULLIF(
            SUM(r.fivebet_opp) FILTER (
                WHERE
                    r.defender_pos = 9
                    AND r.fourbettor_pos = 2
            ),
            0
        ),
        2
    ) AS fivebet_sb_vs_fourbet_hj,
    ROUND(
        100.0 * SUM(r.fivebet_cnt) FILTER (
            WHERE
                r.defender_pos = 9
                AND r.fourbettor_pos = 1
        ) / NULLIF(
            SUM(r.fivebet_opp) FILTER (
                WHERE
                    r.defender_pos = 9
                    AND r.fourbettor_pos = 1
            ),
            0
        ),
        2
    ) AS fivebet_sb_vs_fourbet_co,
    ROUND(
        100.0 * SUM(r.fivebet_cnt) FILTER (
            WHERE
                r.defender_pos = 9
                AND r.fourbettor_pos = 0
        ) / NULLIF(
            SUM(r.fivebet_opp) FILTER (
                WHERE
                    r.defender_pos = 9
                    AND r.fourbettor_pos = 0
            ),
            0
        ),
        2
    ) AS fivebet_sb_vs_fourbet_btn,
    ROUND(
        100.0 * SUM(r.fivebet_cnt) FILTER (
            WHERE
                r.defender_pos = 8
                AND r.fourbettor_pos = 3
        ) / NULLIF(
            SUM(r.fivebet_opp) FILTER (
                WHERE
                    r.defender_pos = 8
                    AND r.fourbettor_pos = 3
            ),
            0
        ),
        2
    ) AS fivebet_bb_vs_fourbet_lj,
    ROUND(
        100.0 * SUM(r.fivebet_cnt) FILTER (
            WHERE
                r.defender_pos = 8
                AND r.fourbettor_pos = 2
        ) / NULLIF(
            SUM(r.fivebet_opp) FILTER (
                WHERE
                    r.defender_pos = 8
                    AND r.fourbettor_pos = 2
            ),
            0
        ),
        2
    ) AS fivebet_bb_vs_fourbet_hj,
    ROUND(
        100.0 * SUM(r.fivebet_cnt) FILTER (
            WHERE
                r.defender_pos = 8
                AND r.fourbettor_pos = 1
        ) / NULLIF(
            SUM(r.fivebet_opp) FILTER (
                WHERE
                    r.defender_pos = 8
                    AND r.fourbettor_pos = 1
            ),
            0
        ),
        2
    ) AS fivebet_bb_vs_fourbet_co,
    ROUND(
        100.0 * SUM(r.fivebet_cnt) FILTER (
            WHERE
                r.defender_pos = 8
                AND r.fourbettor_pos = 0
        ) / NULLIF(
            SUM(r.fivebet_opp) FILTER (
                WHERE
                    r.defender_pos = 8
                    AND r.fourbettor_pos = 0
            ),
            0
        ),
        2
    ) AS fivebet_bb_vs_fourbet_btn,
    ROUND(
        100.0 * SUM(r.fivebet_cnt) FILTER (
            WHERE
                r.defender_pos = 8
                AND r.fourbettor_pos = 9
        ) / NULLIF(
            SUM(r.fivebet_opp) FILTER (
                WHERE
                    r.defender_pos = 8
                    AND r.fourbettor_pos = 9
            ),
            0
        ),
        2
    ) AS fivebet_bb_vs_fourbet_sb
FROM
    pop.mv_player_response_vs_fourbet_counts r
GROUP BY
    r.id_limit;