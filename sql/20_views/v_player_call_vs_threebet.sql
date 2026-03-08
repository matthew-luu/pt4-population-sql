DROP VIEW IF EXISTS pop.v_player_call_vs_threebet;

CREATE VIEW
    pop.v_player_call_vs_threebet AS
SELECT
    id_player,
    id_limit,
    /* ---------- Defender SB (9) ---------- */
    ROUND(
        100.0 * SUM(call_vs_threebet) FILTER (
            WHERE
                threebettor_pos = 8
                AND caller_pos = 9
        ) / NULLIF(
            SUM(call_opp) FILTER (
                WHERE
                    threebettor_pos = 8
                    AND caller_pos = 9
            ),
            0
        ),
        2
    ) AS call_3bet_sb_vs_bb,
    /* ---------- Defender BTN (0) ---------- */
    ROUND(
        100.0 * SUM(call_vs_threebet) FILTER (
            WHERE
                threebettor_pos = 8
                AND caller_pos = 0
        ) / NULLIF(
            SUM(call_opp) FILTER (
                WHERE
                    threebettor_pos = 8
                    AND caller_pos = 0
            ),
            0
        ),
        2
    ) AS call_3bet_btn_vs_bb,
    ROUND(
        100.0 * SUM(call_vs_threebet) FILTER (
            WHERE
                threebettor_pos = 9
                AND caller_pos = 0
        ) / NULLIF(
            SUM(call_opp) FILTER (
                WHERE
                    threebettor_pos = 9
                    AND caller_pos = 0
            ),
            0
        ),
        2
    ) AS call_3bet_btn_vs_sb,
    /* ---------- Defender CO (1) ---------- */
    ROUND(
        100.0 * SUM(call_vs_threebet) FILTER (
            WHERE
                threebettor_pos = 8
                AND caller_pos = 1
        ) / NULLIF(
            SUM(call_opp) FILTER (
                WHERE
                    threebettor_pos = 8
                    AND caller_pos = 1
            ),
            0
        ),
        2
    ) AS call_3bet_co_vs_bb,
    ROUND(
        100.0 * SUM(call_vs_threebet) FILTER (
            WHERE
                threebettor_pos = 9
                AND caller_pos = 1
        ) / NULLIF(
            SUM(call_opp) FILTER (
                WHERE
                    threebettor_pos = 9
                    AND caller_pos = 1
            ),
            0
        ),
        2
    ) AS call_3bet_co_vs_sb,
    ROUND(
        100.0 * SUM(call_vs_threebet) FILTER (
            WHERE
                threebettor_pos = 0
                AND caller_pos = 1
        ) / NULLIF(
            SUM(call_opp) FILTER (
                WHERE
                    threebettor_pos = 0
                    AND caller_pos = 1
            ),
            0
        ),
        2
    ) AS call_3bet_co_vs_btn,
    /* ---------- Defender HJ (2) ---------- */
    ROUND(
        100.0 * SUM(call_vs_threebet) FILTER (
            WHERE
                threebettor_pos = 8
                AND caller_pos = 2
        ) / NULLIF(
            SUM(call_opp) FILTER (
                WHERE
                    threebettor_pos = 8
                    AND caller_pos = 2
            ),
            0
        ),
        2
    ) AS call_3bet_hj_vs_bb,
    ROUND(
        100.0 * SUM(call_vs_threebet) FILTER (
            WHERE
                threebettor_pos = 9
                AND caller_pos = 2
        ) / NULLIF(
            SUM(call_opp) FILTER (
                WHERE
                    threebettor_pos = 9
                    AND caller_pos = 2
            ),
            0
        ),
        2
    ) AS call_3bet_hj_vs_sb,
    ROUND(
        100.0 * SUM(call_vs_threebet) FILTER (
            WHERE
                threebettor_pos = 0
                AND caller_pos = 2
        ) / NULLIF(
            SUM(call_opp) FILTER (
                WHERE
                    threebettor_pos = 0
                    AND caller_pos = 2
            ),
            0
        ),
        2
    ) AS call_3bet_hj_vs_btn,
    ROUND(
        100.0 * SUM(call_vs_threebet) FILTER (
            WHERE
                threebettor_pos = 1
                AND caller_pos = 2
        ) / NULLIF(
            SUM(call_opp) FILTER (
                WHERE
                    threebettor_pos = 1
                    AND caller_pos = 2
            ),
            0
        ),
        2
    ) AS call_3bet_hj_vs_co,
    /* ---------- Defender LJ (3) ---------- */
    ROUND(
        100.0 * SUM(call_vs_threebet) FILTER (
            WHERE
                threebettor_pos = 8
                AND caller_pos = 3
        ) / NULLIF(
            SUM(call_opp) FILTER (
                WHERE
                    threebettor_pos = 8
                    AND caller_pos = 3
            ),
            0
        ),
        2
    ) AS call_3bet_lj_vs_bb,
    ROUND(
        100.0 * SUM(call_vs_threebet) FILTER (
            WHERE
                threebettor_pos = 9
                AND caller_pos = 3
        ) / NULLIF(
            SUM(call_opp) FILTER (
                WHERE
                    threebettor_pos = 9
                    AND caller_pos = 3
            ),
            0
        ),
        2
    ) AS call_3bet_lj_vs_sb,
    ROUND(
        100.0 * SUM(call_vs_threebet) FILTER (
            WHERE
                threebettor_pos = 0
                AND caller_pos = 3
        ) / NULLIF(
            SUM(call_opp) FILTER (
                WHERE
                    threebettor_pos = 0
                    AND caller_pos = 3
            ),
            0
        ),
        2
    ) AS call_3bet_lj_vs_btn,
    ROUND(
        100.0 * SUM(call_vs_threebet) FILTER (
            WHERE
                threebettor_pos = 1
                AND caller_pos = 3
        ) / NULLIF(
            SUM(call_opp) FILTER (
                WHERE
                    threebettor_pos = 1
                    AND caller_pos = 3
            ),
            0
        ),
        2
    ) AS call_3bet_lj_vs_co,
    ROUND(
        100.0 * SUM(call_vs_threebet) FILTER (
            WHERE
                threebettor_pos = 2
                AND caller_pos = 3
        ) / NULLIF(
            SUM(call_opp) FILTER (
                WHERE
                    threebettor_pos = 2
                    AND caller_pos = 3
            ),
            0
        ),
        2
    ) AS call_3bet_lj_vs_hj
FROM
    pop.mv_player_call_vs_threebet_counts
GROUP BY
    id_player,
    id_limit;