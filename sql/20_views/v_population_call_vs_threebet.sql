DROP VIEW IF EXISTS pop.v_population_call_vs_threebet;

CREATE VIEW
    pop.v_population_call_vs_threebet AS
SELECT
    cvt.id_limit,
    ROUND(
        100.0 * SUM(cvt.call_vs_3bet) FILTER (
            WHERE
                cvt.caller_pos = 3
                AND cvt.threebettor_pos = 2
        ) / NULLIF(
            SUM(cvt.call_opp) FILTER (
                WHERE
                    cvt.caller_pos = 3
                    AND cvt.threebettor_pos = 2
            ),
            0
        ),
        2
    ) AS call_lj_vs_3bet_hj,
    ROUND(
        100.0 * SUM(cvt.call_vs_3bet) FILTER (
            WHERE
                cvt.caller_pos = 3
                AND cvt.threebettor_pos = 1
        ) / NULLIF(
            SUM(cvt.call_opp) FILTER (
                WHERE
                    cvt.caller_pos = 3
                    AND cvt.threebettor_pos = 1
            ),
            0
        ),
        2
    ) AS call_lj_vs_3bet_co,
    ROUND(
        100.0 * SUM(cvt.call_vs_3bet) FILTER (
            WHERE
                cvt.caller_pos = 3
                AND cvt.threebettor_pos = 0
        ) / NULLIF(
            SUM(cvt.call_opp) FILTER (
                WHERE
                    cvt.caller_pos = 3
                    AND cvt.threebettor_pos = 0
            ),
            0
        ),
        2
    ) AS call_lj_vs_3bet_btn,
    ROUND(
        100.0 * SUM(cvt.call_vs_3bet) FILTER (
            WHERE
                cvt.caller_pos = 3
                AND cvt.threebettor_pos = 9
        ) / NULLIF(
            SUM(cvt.call_opp) FILTER (
                WHERE
                    cvt.caller_pos = 3
                    AND cvt.threebettor_pos = 9
            ),
            0
        ),
        2
    ) AS call_lj_vs_3bet_sb,
    ROUND(
        100.0 * SUM(cvt.call_vs_3bet) FILTER (
            WHERE
                cvt.caller_pos = 3
                AND cvt.threebettor_pos = 8
        ) / NULLIF(
            SUM(cvt.call_opp) FILTER (
                WHERE
                    cvt.caller_pos = 3
                    AND cvt.threebettor_pos = 8
            ),
            0
        ),
        2
    ) AS call_lj_vs_3bet_bb,
    ROUND(
        100.0 * SUM(cvt.call_vs_3bet) FILTER (
            WHERE
                cvt.caller_pos = 2
                AND cvt.threebettor_pos = 1
        ) / NULLIF(
            SUM(cvt.call_opp) FILTER (
                WHERE
                    cvt.caller_pos = 2
                    AND cvt.threebettor_pos = 1
            ),
            0
        ),
        2
    ) AS call_hj_vs_3bet_co,
    ROUND(
        100.0 * SUM(cvt.call_vs_3bet) FILTER (
            WHERE
                cvt.caller_pos = 2
                AND cvt.threebettor_pos = 0
        ) / NULLIF(
            SUM(cvt.call_opp) FILTER (
                WHERE
                    cvt.caller_pos = 2
                    AND cvt.threebettor_pos = 0
            ),
            0
        ),
        2
    ) AS call_hj_vs_3bet_btn,
    ROUND(
        100.0 * SUM(cvt.call_vs_3bet) FILTER (
            WHERE
                cvt.caller_pos = 2
                AND cvt.threebettor_pos = 9
        ) / NULLIF(
            SUM(cvt.call_opp) FILTER (
                WHERE
                    cvt.caller_pos = 2
                    AND cvt.threebettor_pos = 9
            ),
            0
        ),
        2
    ) AS call_hj_vs_3bet_sb,
    ROUND(
        100.0 * SUM(cvt.call_vs_3bet) FILTER (
            WHERE
                cvt.caller_pos = 2
                AND cvt.threebettor_pos = 8
        ) / NULLIF(
            SUM(cvt.call_opp) FILTER (
                WHERE
                    cvt.caller_pos = 2
                    AND cvt.threebettor_pos = 8
            ),
            0
        ),
        2
    ) AS call_hj_vs_3bet_bb,
    ROUND(
        100.0 * SUM(cvt.call_vs_3bet) FILTER (
            WHERE
                cvt.caller_pos = 1
                AND cvt.threebettor_pos = 0
        ) / NULLIF(
            SUM(cvt.call_opp) FILTER (
                WHERE
                    cvt.caller_pos = 1
                    AND cvt.threebettor_pos = 0
            ),
            0
        ),
        2
    ) AS call_co_vs_3bet_btn,
    ROUND(
        100.0 * SUM(cvt.call_vs_3bet) FILTER (
            WHERE
                cvt.caller_pos = 1
                AND cvt.threebettor_pos = 9
        ) / NULLIF(
            SUM(cvt.call_opp) FILTER (
                WHERE
                    cvt.caller_pos = 1
                    AND cvt.threebettor_pos = 9
            ),
            0
        ),
        2
    ) AS call_co_vs_3bet_sb,
    ROUND(
        100.0 * SUM(cvt.call_vs_3bet) FILTER (
            WHERE
                cvt.caller_pos = 1
                AND cvt.threebettor_pos = 8
        ) / NULLIF(
            SUM(cvt.call_opp) FILTER (
                WHERE
                    cvt.caller_pos = 1
                    AND cvt.threebettor_pos = 8
            ),
            0
        ),
        2
    ) AS call_co_vs_3bet_bb,
    ROUND(
        100.0 * SUM(cvt.call_vs_3bet) FILTER (
            WHERE
                cvt.caller_pos = 0
                AND cvt.threebettor_pos = 9
        ) / NULLIF(
            SUM(cvt.call_opp) FILTER (
                WHERE
                    cvt.caller_pos = 0
                    AND cvt.threebettor_pos = 9
            ),
            0
        ),
        2
    ) AS call_btn_vs_3bet_sb,
    ROUND(
        100.0 * SUM(cvt.call_vs_3bet) FILTER (
            WHERE
                cvt.caller_pos = 0
                AND cvt.threebettor_pos = 8
        ) / NULLIF(
            SUM(cvt.call_opp) FILTER (
                WHERE
                    cvt.caller_pos = 0
                    AND cvt.threebettor_pos = 8
            ),
            0
        ),
        2
    ) AS call_btn_vs_3bet_bb,
    ROUND(
        100.0 * SUM(cvt.call_vs_3bet) FILTER (
            WHERE
                cvt.caller_pos = 9
                AND cvt.threebettor_pos = 8
        ) / NULLIF(
            SUM(cvt.call_opp) FILTER (
                WHERE
                    cvt.caller_pos = 9
                    AND cvt.threebettor_pos = 8
            ),
            0
        ),
        2
    ) AS call_sb_vs_3bet_bb
FROM
    pop.mv_player_call_vs_threebet_counts cvt
GROUP BY
    cvt.id_limit