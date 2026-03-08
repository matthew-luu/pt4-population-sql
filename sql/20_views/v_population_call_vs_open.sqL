DROP VIEW IF EXISTS pop.v_population_call_vs_open;

CREATE VIEW
    pop.v_population_call_vs_open AS
SELECT
    c.id_limit,
    ROUND(
        100.0 * SUM(c.call_vs_open) FILTER (
            WHERE
                c.defender_pos = 2
                AND c.opener_pos = 3
        ) / NULLIF(
            SUM(c.def_opp) FILTER (
                WHERE
                    c.defender_pos = 2
                    AND c.opener_pos = 3
            ),
            0
        ),
        2
    ) AS call_hj_vs_lj,
    ROUND(
        100.0 * SUM(c.call_vs_open) FILTER (
            WHERE
                c.defender_pos = 1
                AND c.opener_pos = 3
        ) / NULLIF(
            SUM(c.def_opp) FILTER (
                WHERE
                    c.defender_pos = 1
                    AND c.opener_pos = 3
            ),
            0
        ),
        2
    ) AS call_co_vs_lj,
    ROUND(
        100.0 * SUM(c.call_vs_open) FILTER (
            WHERE
                c.defender_pos = 1
                AND c.opener_pos = 2
        ) / NULLIF(
            SUM(c.def_opp) FILTER (
                WHERE
                    c.defender_pos = 1
                    AND c.opener_pos = 2
            ),
            0
        ),
        2
    ) AS call_co_vs_hj,
    ROUND(
        100.0 * SUM(c.call_vs_open) FILTER (
            WHERE
                c.defender_pos = 0
                AND c.opener_pos = 3
        ) / NULLIF(
            SUM(c.def_opp) FILTER (
                WHERE
                    c.defender_pos = 0
                    AND c.opener_pos = 3
            ),
            0
        ),
        2
    ) AS call_btn_vs_lj,
    ROUND(
        100.0 * SUM(c.call_vs_open) FILTER (
            WHERE
                c.defender_pos = 0
                AND c.opener_pos = 2
        ) / NULLIF(
            SUM(c.def_opp) FILTER (
                WHERE
                    c.defender_pos = 0
                    AND c.opener_pos = 2
            ),
            0
        ),
        2
    ) AS call_btn_vs_hj,
    ROUND(
        100.0 * SUM(c.call_vs_open) FILTER (
            WHERE
                c.defender_pos = 0
                AND c.opener_pos = 1
        ) / NULLIF(
            SUM(c.def_opp) FILTER (
                WHERE
                    c.defender_pos = 0
                    AND c.opener_pos = 1
            ),
            0
        ),
        2
    ) AS call_btn_vs_co,
    ROUND(
        100.0 * SUM(c.call_vs_open) FILTER (
            WHERE
                c.defender_pos = 9
                AND c.opener_pos = 3
        ) / NULLIF(
            SUM(c.def_opp) FILTER (
                WHERE
                    c.defender_pos = 9
                    AND c.opener_pos = 3
            ),
            0
        ),
        2
    ) AS call_sb_vs_lj,
    ROUND(
        100.0 * SUM(c.call_vs_open) FILTER (
            WHERE
                c.defender_pos = 9
                AND c.opener_pos = 2
        ) / NULLIF(
            SUM(c.def_opp) FILTER (
                WHERE
                    c.defender_pos = 9
                    AND c.opener_pos = 2
            ),
            0
        ),
        2
    ) AS call_sb_vs_hj,
    ROUND(
        100.0 * SUM(c.call_vs_open) FILTER (
            WHERE
                c.defender_pos = 9
                AND c.opener_pos = 1
        ) / NULLIF(
            SUM(c.def_opp) FILTER (
                WHERE
                    c.defender_pos = 9
                    AND c.opener_pos = 1
            ),
            0
        ),
        2
    ) AS call_sb_vs_co,
    ROUND(
        100.0 * SUM(c.call_vs_open) FILTER (
            WHERE
                c.defender_pos = 9
                AND c.opener_pos = 0
        ) / NULLIF(
            SUM(c.def_opp) FILTER (
                WHERE
                    c.defender_pos = 9
                    AND c.opener_pos = 0
            ),
            0
        ),
        2
    ) AS call_sb_vs_btn,
    ROUND(
        100.0 * SUM(c.call_vs_open) FILTER (
            WHERE
                c.defender_pos = 8
                AND c.opener_pos = 3
        ) / NULLIF(
            SUM(c.def_opp) FILTER (
                WHERE
                    c.defender_pos = 8
                    AND c.opener_pos = 3
            ),
            0
        ),
        2
    ) AS call_bb_vs_lj,
    ROUND(
        100.0 * SUM(c.call_vs_open) FILTER (
            WHERE
                c.defender_pos = 8
                AND c.opener_pos = 2
        ) / NULLIF(
            SUM(c.def_opp) FILTER (
                WHERE
                    c.defender_pos = 8
                    AND c.opener_pos = 2
            ),
            0
        ),
        2
    ) AS call_bb_vs_hj,
    ROUND(
        100.0 * SUM(c.call_vs_open) FILTER (
            WHERE
                c.defender_pos = 8
                AND c.opener_pos = 1
        ) / NULLIF(
            SUM(c.def_opp) FILTER (
                WHERE
                    c.defender_pos = 8
                    AND c.opener_pos = 1
            ),
            0
        ),
        2
    ) AS call_bb_vs_co,
    ROUND(
        100.0 * SUM(c.call_vs_open) FILTER (
            WHERE
                c.defender_pos = 8
                AND c.opener_pos = 0
        ) / NULLIF(
            SUM(c.def_opp) FILTER (
                WHERE
                    c.defender_pos = 8
                    AND c.opener_pos = 0
            ),
            0
        ),
        2
    ) AS call_bb_vs_btn,
    ROUND(
        100.0 * SUM(c.call_vs_open) FILTER (
            WHERE
                c.defender_pos = 8
                AND c.opener_pos = 9
        ) / NULLIF(
            SUM(c.def_opp) FILTER (
                WHERE
                    c.defender_pos = 8
                    AND c.opener_pos = 9
            ),
            0
        ),
        2
    ) AS call_bb_vs_sb
FROM
    pop.mv_player_call_vs_open_counts c
GROUP BY
    c.id_limit