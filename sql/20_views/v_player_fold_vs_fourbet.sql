DROP VIEW IF EXISTS pop.v_player_fold_vs_fourbet;

CREATE VIEW
    pop.v_player_fold_vs_fourbet AS
SELECT
    id_player,
    id_limit,
    /* ---------- Defender HJ (2) ---------- */
    ROUND(
        100.0 - COALESCE(
            ROUND(
                100.0 * SUM(fivebet_cnt) FILTER (
                    WHERE
                        defender_pos = 2
                        AND fourbettor_pos = 3
                ) / NULLIF(
                    SUM(fivebet_opp) FILTER (
                        WHERE
                            defender_pos = 2
                            AND fourbettor_pos = 3
                    ),
                    0
                ),
                2
            ),
            0
        ) - COALESCE(
            ROUND(
                100.0 * SUM(call_vs_fourbet) FILTER (
                    WHERE
                        defender_pos = 2
                        AND fourbettor_pos = 3
                ) / NULLIF(
                    SUM(fivebet_opp) FILTER (
                        WHERE
                            defender_pos = 2
                            AND fourbettor_pos = 3
                    ),
                    0
                ),
                2
            ),
            0
        ),
        2
    ) AS fold_hj_vs_fourbet_lj,
    /* ---------- Defender CO (1) ---------- */
    ROUND(
        100.0 - COALESCE(
            ROUND(
                100.0 * SUM(fivebet_cnt) FILTER (
                    WHERE
                        defender_pos = 1
                        AND fourbettor_pos = 3
                ) / NULLIF(
                    SUM(fivebet_opp) FILTER (
                        WHERE
                            defender_pos = 1
                            AND fourbettor_pos = 3
                    ),
                    0
                ),
                2
            ),
            0
        ) - COALESCE(
            ROUND(
                100.0 * SUM(call_vs_fourbet) FILTER (
                    WHERE
                        defender_pos = 1
                        AND fourbettor_pos = 3
                ) / NULLIF(
                    SUM(fivebet_opp) FILTER (
                        WHERE
                            defender_pos = 1
                            AND fourbettor_pos = 3
                    ),
                    0
                ),
                2
            ),
            0
        ),
        2
    ) AS fold_co_vs_fourbet_lj,
    ROUND(
        100.0 - COALESCE(
            ROUND(
                100.0 * SUM(fivebet_cnt) FILTER (
                    WHERE
                        defender_pos = 1
                        AND fourbettor_pos = 2
                ) / NULLIF(
                    SUM(fivebet_opp) FILTER (
                        WHERE
                            defender_pos = 1
                            AND fourbettor_pos = 2
                    ),
                    0
                ),
                2
            ),
            0
        ) - COALESCE(
            ROUND(
                100.0 * SUM(call_vs_fourbet) FILTER (
                    WHERE
                        defender_pos = 1
                        AND fourbettor_pos = 2
                ) / NULLIF(
                    SUM(fivebet_opp) FILTER (
                        WHERE
                            defender_pos = 1
                            AND fourbettor_pos = 2
                    ),
                    0
                ),
                2
            ),
            0
        ),
        2
    ) AS fold_co_vs_fourbet_hj,
    /* ---------- Defender BTN (0) ---------- */
    ROUND(
        100.0 - COALESCE(
            ROUND(
                100.0 * SUM(fivebet_cnt) FILTER (
                    WHERE
                        defender_pos = 0
                        AND fourbettor_pos = 3
                ) / NULLIF(
                    SUM(fivebet_opp) FILTER (
                        WHERE
                            defender_pos = 0
                            AND fourbettor_pos = 3
                    ),
                    0
                ),
                2
            ),
            0
        ) - COALESCE(
            ROUND(
                100.0 * SUM(call_vs_fourbet) FILTER (
                    WHERE
                        defender_pos = 0
                        AND fourbettor_pos = 3
                ) / NULLIF(
                    SUM(fivebet_opp) FILTER (
                        WHERE
                            defender_pos = 0
                            AND fourbettor_pos = 3
                    ),
                    0
                ),
                2
            ),
            0
        ),
        2
    ) AS fold_btn_vs_fourbet_lj,
    ROUND(
        100.0 - COALESCE(
            ROUND(
                100.0 * SUM(fivebet_cnt) FILTER (
                    WHERE
                        defender_pos = 0
                        AND fourbettor_pos = 2
                ) / NULLIF(
                    SUM(fivebet_opp) FILTER (
                        WHERE
                            defender_pos = 0
                            AND fourbettor_pos = 2
                    ),
                    0
                ),
                2
            ),
            0
        ) - COALESCE(
            ROUND(
                100.0 * SUM(call_vs_fourbet) FILTER (
                    WHERE
                        defender_pos = 0
                        AND fourbettor_pos = 2
                ) / NULLIF(
                    SUM(fivebet_opp) FILTER (
                        WHERE
                            defender_pos = 0
                            AND fourbettor_pos = 2
                    ),
                    0
                ),
                2
            ),
            0
        ),
        2
    ) AS fold_btn_vs_fourbet_hj,
    ROUND(
        100.0 - COALESCE(
            ROUND(
                100.0 * SUM(fivebet_cnt) FILTER (
                    WHERE
                        defender_pos = 0
                        AND fourbettor_pos = 1
                ) / NULLIF(
                    SUM(fivebet_opp) FILTER (
                        WHERE
                            defender_pos = 0
                            AND fourbettor_pos = 1
                    ),
                    0
                ),
                2
            ),
            0
        ) - COALESCE(
            ROUND(
                100.0 * SUM(call_vs_fourbet) FILTER (
                    WHERE
                        defender_pos = 0
                        AND fourbettor_pos = 1
                ) / NULLIF(
                    SUM(fivebet_opp) FILTER (
                        WHERE
                            defender_pos = 0
                            AND fourbettor_pos = 1
                    ),
                    0
                ),
                2
            ),
            0
        ),
        2
    ) AS fold_btn_vs_fourbet_co,
    /* ---------- Defender SB (9) ---------- */
    ROUND(
        100.0 - COALESCE(
            ROUND(
                100.0 * SUM(fivebet_cnt) FILTER (
                    WHERE
                        defender_pos = 9
                        AND fourbettor_pos = 3
                ) / NULLIF(
                    SUM(fivebet_opp) FILTER (
                        WHERE
                            defender_pos = 9
                            AND fourbettor_pos = 3
                    ),
                    0
                ),
                2
            ),
            0
        ) - COALESCE(
            ROUND(
                100.0 * SUM(call_vs_fourbet) FILTER (
                    WHERE
                        defender_pos = 9
                        AND fourbettor_pos = 3
                ) / NULLIF(
                    SUM(fivebet_opp) FILTER (
                        WHERE
                            defender_pos = 9
                            AND fourbettor_pos = 3
                    ),
                    0
                ),
                2
            ),
            0
        ),
        2
    ) AS fold_sb_vs_fourbet_lj,
    ROUND(
        100.0 - COALESCE(
            ROUND(
                100.0 * SUM(fivebet_cnt) FILTER (
                    WHERE
                        defender_pos = 9
                        AND fourbettor_pos = 2
                ) / NULLIF(
                    SUM(fivebet_opp) FILTER (
                        WHERE
                            defender_pos = 9
                            AND fourbettor_pos = 2
                    ),
                    0
                ),
                2
            ),
            0
        ) - COALESCE(
            ROUND(
                100.0 * SUM(call_vs_fourbet) FILTER (
                    WHERE
                        defender_pos = 9
                        AND fourbettor_pos = 2
                ) / NULLIF(
                    SUM(fivebet_opp) FILTER (
                        WHERE
                            defender_pos = 9
                            AND fourbettor_pos = 2
                    ),
                    0
                ),
                2
            ),
            0
        ),
        2
    ) AS fold_sb_vs_fourbet_hj,
    ROUND(
        100.0 - COALESCE(
            ROUND(
                100.0 * SUM(fivebet_cnt) FILTER (
                    WHERE
                        defender_pos = 9
                        AND fourbettor_pos = 1
                ) / NULLIF(
                    SUM(fivebet_opp) FILTER (
                        WHERE
                            defender_pos = 9
                            AND fourbettor_pos = 1
                    ),
                    0
                ),
                2
            ),
            0
        ) - COALESCE(
            ROUND(
                100.0 * SUM(call_vs_fourbet) FILTER (
                    WHERE
                        defender_pos = 9
                        AND fourbettor_pos = 1
                ) / NULLIF(
                    SUM(fivebet_opp) FILTER (
                        WHERE
                            defender_pos = 9
                            AND fourbettor_pos = 1
                    ),
                    0
                ),
                2
            ),
            0
        ),
        2
    ) AS fold_sb_vs_fourbet_co,
    ROUND(
        100.0 - COALESCE(
            ROUND(
                100.0 * SUM(fivebet_cnt) FILTER (
                    WHERE
                        defender_pos = 9
                        AND fourbettor_pos = 0
                ) / NULLIF(
                    SUM(fivebet_opp) FILTER (
                        WHERE
                            defender_pos = 9
                            AND fourbettor_pos = 0
                    ),
                    0
                ),
                2
            ),
            0
        ) - COALESCE(
            ROUND(
                100.0 * SUM(call_vs_fourbet) FILTER (
                    WHERE
                        defender_pos = 9
                        AND fourbettor_pos = 0
                ) / NULLIF(
                    SUM(fivebet_opp) FILTER (
                        WHERE
                            defender_pos = 9
                            AND fourbettor_pos = 0
                    ),
                    0
                ),
                2
            ),
            0
        ),
        2
    ) AS fold_sb_vs_fourbet_btn,
    /* ---------- Defender BB (8) ---------- */
    ROUND(
        100.0 - COALESCE(
            ROUND(
                100.0 * SUM(fivebet_cnt) FILTER (
                    WHERE
                        defender_pos = 8
                        AND fourbettor_pos = 3
                ) / NULLIF(
                    SUM(fivebet_opp) FILTER (
                        WHERE
                            defender_pos = 8
                            AND fourbettor_pos = 3
                    ),
                    0
                ),
                2
            ),
            0
        ) - COALESCE(
            ROUND(
                100.0 * SUM(call_vs_fourbet) FILTER (
                    WHERE
                        defender_pos = 8
                        AND fourbettor_pos = 3
                ) / NULLIF(
                    SUM(fivebet_opp) FILTER (
                        WHERE
                            defender_pos = 8
                            AND fourbettor_pos = 3
                    ),
                    0
                ),
                2
            ),
            0
        ),
        2
    ) AS fold_bb_vs_fourbet_lj,
    ROUND(
        100.0 - COALESCE(
            ROUND(
                100.0 * SUM(fivebet_cnt) FILTER (
                    WHERE
                        defender_pos = 8
                        AND fourbettor_pos = 2
                ) / NULLIF(
                    SUM(fivebet_opp) FILTER (
                        WHERE
                            defender_pos = 8
                            AND fourbettor_pos = 2
                    ),
                    0
                ),
                2
            ),
            0
        ) - COALESCE(
            ROUND(
                100.0 * SUM(call_vs_fourbet) FILTER (
                    WHERE
                        defender_pos = 8
                        AND fourbettor_pos = 2
                ) / NULLIF(
                    SUM(fivebet_opp) FILTER (
                        WHERE
                            defender_pos = 8
                            AND fourbettor_pos = 2
                    ),
                    0
                ),
                2
            ),
            0
        ),
        2
    ) AS fold_bb_vs_fourbet_hj,
    ROUND(
        100.0 - COALESCE(
            ROUND(
                100.0 * SUM(fivebet_cnt) FILTER (
                    WHERE
                        defender_pos = 8
                        AND fourbettor_pos = 1
                ) / NULLIF(
                    SUM(fivebet_opp) FILTER (
                        WHERE
                            defender_pos = 8
                            AND fourbettor_pos = 1
                    ),
                    0
                ),
                2
            ),
            0
        ) - COALESCE(
            ROUND(
                100.0 * SUM(call_vs_fourbet) FILTER (
                    WHERE
                        defender_pos = 8
                        AND fourbettor_pos = 1
                ) / NULLIF(
                    SUM(fivebet_opp) FILTER (
                        WHERE
                            defender_pos = 8
                            AND fourbettor_pos = 1
                    ),
                    0
                ),
                2
            ),
            0
        ),
        2
    ) AS fold_bb_vs_fourbet_co,
    ROUND(
        100.0 - COALESCE(
            ROUND(
                100.0 * SUM(fivebet_cnt) FILTER (
                    WHERE
                        defender_pos = 8
                        AND fourbettor_pos = 0
                ) / NULLIF(
                    SUM(fivebet_opp) FILTER (
                        WHERE
                            defender_pos = 8
                            AND fourbettor_pos = 0
                    ),
                    0
                ),
                2
            ),
            0
        ) - COALESCE(
            ROUND(
                100.0 * SUM(call_vs_fourbet) FILTER (
                    WHERE
                        defender_pos = 8
                        AND fourbettor_pos = 0
                ) / NULLIF(
                    SUM(fivebet_opp) FILTER (
                        WHERE
                            defender_pos = 8
                            AND fourbettor_pos = 0
                    ),
                    0
                ),
                2
            ),
            0
        ),
        2
    ) AS fold_bb_vs_fourbet_btn,
    ROUND(
        100.0 - COALESCE(
            ROUND(
                100.0 * SUM(fivebet_cnt) FILTER (
                    WHERE
                        defender_pos = 8
                        AND fourbettor_pos = 9
                ) / NULLIF(
                    SUM(fivebet_opp) FILTER (
                        WHERE
                            defender_pos = 8
                            AND fourbettor_pos = 9
                    ),
                    0
                ),
                2
            ),
            0
        ) - COALESCE(
            ROUND(
                100.0 * SUM(call_vs_fourbet) FILTER (
                    WHERE
                        defender_pos = 8
                        AND fourbettor_pos = 9
                ) / NULLIF(
                    SUM(fivebet_opp) FILTER (
                        WHERE
                            defender_pos = 8
                            AND fourbettor_pos = 9
                    ),
                    0
                ),
                2
            ),
            0
        ),
        2
    ) AS fold_bb_vs_fourbet_sb
FROM
    pop.mv_player_response_vs_fourbet_counts
GROUP BY
    id_player,
    id_limit;