DROP VIEW IF EXISTS pop.v_player_fold_vs_open;

CREATE VIEW
    pop.v_player_fold_vs_open AS
SELECT
    id_player,
    id_limit,
    /* ---------- Defender HJ (2) ---------- */
    ROUND(
        100.0 - COALESCE(
            ROUND(
                100.0 * SUM(threebet_cnt) FILTER (
                    WHERE
                        defend_pos = 2
                        AND open_pos = 3
                ) / NULLIF(
                    SUM(def_opp) FILTER (
                        WHERE
                            defend_pos = 2
                            AND open_pos = 3
                    ),
                    0
                ),
                2
            ),
            0
        ) - COALESCE(
            ROUND(
                100.0 * SUM(call_cnt) FILTER (
                    WHERE
                        defend_pos = 2
                        AND open_pos = 3
                ) / NULLIF(
                    SUM(def_opp) FILTER (
                        WHERE
                            defend_pos = 2
                            AND open_pos = 3
                    ),
                    0
                ),
                2
            ),
            0
        ),
        2
    ) AS fold_hj_vs_open_lj,
    /* ---------- Defender CO (1) ---------- */
    ROUND(
        100.0 - COALESCE(
            ROUND(
                100.0 * SUM(threebet_cnt) FILTER (
                    WHERE
                        defend_pos = 1
                        AND open_pos = 3
                ) / NULLIF(
                    SUM(def_opp) FILTER (
                        WHERE
                            defend_pos = 1
                            AND open_pos = 3
                    ),
                    0
                ),
                2
            ),
            0
        ) - COALESCE(
            ROUND(
                100.0 * SUM(call_cnt) FILTER (
                    WHERE
                        defend_pos = 1
                        AND open_pos = 3
                ) / NULLIF(
                    SUM(def_opp) FILTER (
                        WHERE
                            defend_pos = 1
                            AND open_pos = 3
                    ),
                    0
                ),
                2
            ),
            0
        ),
        2
    ) AS fold_co_vs_open_lj,
    ROUND(
        100.0 - COALESCE(
            ROUND(
                100.0 * SUM(threebet_cnt) FILTER (
                    WHERE
                        defend_pos = 1
                        AND open_pos = 2
                ) / NULLIF(
                    SUM(def_opp) FILTER (
                        WHERE
                            defend_pos = 1
                            AND open_pos = 2
                    ),
                    0
                ),
                2
            ),
            0
        ) - COALESCE(
            ROUND(
                100.0 * SUM(call_cnt) FILTER (
                    WHERE
                        defend_pos = 1
                        AND open_pos = 2
                ) / NULLIF(
                    SUM(def_opp) FILTER (
                        WHERE
                            defend_pos = 1
                            AND open_pos = 2
                    ),
                    0
                ),
                2
            ),
            0
        ),
        2
    ) AS fold_co_vs_open_hj,
    /* ---------- Defender BTN (0) ---------- */
    ROUND(
        100.0 - COALESCE(
            ROUND(
                100.0 * SUM(threebet_cnt) FILTER (
                    WHERE
                        defend_pos = 0
                        AND open_pos = 3
                ) / NULLIF(
                    SUM(def_opp) FILTER (
                        WHERE
                            defend_pos = 0
                            AND open_pos = 3
                    ),
                    0
                ),
                2
            ),
            0
        ) - COALESCE(
            ROUND(
                100.0 * SUM(call_cnt) FILTER (
                    WHERE
                        defend_pos = 0
                        AND open_pos = 3
                ) / NULLIF(
                    SUM(def_opp) FILTER (
                        WHERE
                            defend_pos = 0
                            AND open_pos = 3
                    ),
                    0
                ),
                2
            ),
            0
        ),
        2
    ) AS fold_btn_vs_open_lj,
    ROUND(
        100.0 - COALESCE(
            ROUND(
                100.0 * SUM(threebet_cnt) FILTER (
                    WHERE
                        defend_pos = 0
                        AND open_pos = 2
                ) / NULLIF(
                    SUM(def_opp) FILTER (
                        WHERE
                            defend_pos = 0
                            AND open_pos = 2
                    ),
                    0
                ),
                2
            ),
            0
        ) - COALESCE(
            ROUND(
                100.0 * SUM(call_cnt) FILTER (
                    WHERE
                        defend_pos = 0
                        AND open_pos = 2
                ) / NULLIF(
                    SUM(def_opp) FILTER (
                        WHERE
                            defend_pos = 0
                            AND open_pos = 2
                    ),
                    0
                ),
                2
            ),
            0
        ),
        2
    ) AS fold_btn_vs_open_hj,
    ROUND(
        100.0 - COALESCE(
            ROUND(
                100.0 * SUM(threebet_cnt) FILTER (
                    WHERE
                        defend_pos = 0
                        AND open_pos = 1
                ) / NULLIF(
                    SUM(def_opp) FILTER (
                        WHERE
                            defend_pos = 0
                            AND open_pos = 1
                    ),
                    0
                ),
                2
            ),
            0
        ) - COALESCE(
            ROUND(
                100.0 * SUM(call_cnt) FILTER (
                    WHERE
                        defend_pos = 0
                        AND open_pos = 1
                ) / NULLIF(
                    SUM(def_opp) FILTER (
                        WHERE
                            defend_pos = 0
                            AND open_pos = 1
                    ),
                    0
                ),
                2
            ),
            0
        ),
        2
    ) AS fold_btn_vs_open_co,
    /* ---------- Defender SB (9) ---------- */
    ROUND(
        100.0 - COALESCE(
            ROUND(
                100.0 * SUM(threebet_cnt) FILTER (
                    WHERE
                        defend_pos = 9
                        AND open_pos = 3
                ) / NULLIF(
                    SUM(def_opp) FILTER (
                        WHERE
                            defend_pos = 9
                            AND open_pos = 3
                    ),
                    0
                ),
                2
            ),
            0
        ) - COALESCE(
            ROUND(
                100.0 * SUM(call_cnt) FILTER (
                    WHERE
                        defend_pos = 9
                        AND open_pos = 3
                ) / NULLIF(
                    SUM(def_opp) FILTER (
                        WHERE
                            defend_pos = 9
                            AND open_pos = 3
                    ),
                    0
                ),
                2
            ),
            0
        ),
        2
    ) AS fold_sb_vs_open_lj,
    ROUND(
        100.0 - COALESCE(
            ROUND(
                100.0 * SUM(threebet_cnt) FILTER (
                    WHERE
                        defend_pos = 9
                        AND open_pos = 2
                ) / NULLIF(
                    SUM(def_opp) FILTER (
                        WHERE
                            defend_pos = 9
                            AND open_pos = 2
                    ),
                    0
                ),
                2
            ),
            0
        ) - COALESCE(
            ROUND(
                100.0 * SUM(call_cnt) FILTER (
                    WHERE
                        defend_pos = 9
                        AND open_pos = 2
                ) / NULLIF(
                    SUM(def_opp) FILTER (
                        WHERE
                            defend_pos = 9
                            AND open_pos = 2
                    ),
                    0
                ),
                2
            ),
            0
        ),
        2
    ) AS fold_sb_vs_open_hj,
    ROUND(
        100.0 - COALESCE(
            ROUND(
                100.0 * SUM(threebet_cnt) FILTER (
                    WHERE
                        defend_pos = 9
                        AND open_pos = 1
                ) / NULLIF(
                    SUM(def_opp) FILTER (
                        WHERE
                            defend_pos = 9
                            AND open_pos = 1
                    ),
                    0
                ),
                2
            ),
            0
        ) - COALESCE(
            ROUND(
                100.0 * SUM(call_cnt) FILTER (
                    WHERE
                        defend_pos = 9
                        AND open_pos = 1
                ) / NULLIF(
                    SUM(def_opp) FILTER (
                        WHERE
                            defend_pos = 9
                            AND open_pos = 1
                    ),
                    0
                ),
                2
            ),
            0
        ),
        2
    ) AS fold_sb_vs_open_co,
    ROUND(
        100.0 - COALESCE(
            ROUND(
                100.0 * SUM(threebet_cnt) FILTER (
                    WHERE
                        defend_pos = 9
                        AND open_pos = 0
                ) / NULLIF(
                    SUM(def_opp) FILTER (
                        WHERE
                            defend_pos = 9
                            AND open_pos = 0
                    ),
                    0
                ),
                2
            ),
            0
        ) - COALESCE(
            ROUND(
                100.0 * SUM(call_cnt) FILTER (
                    WHERE
                        defend_pos = 9
                        AND open_pos = 0
                ) / NULLIF(
                    SUM(def_opp) FILTER (
                        WHERE
                            defend_pos = 9
                            AND open_pos = 0
                    ),
                    0
                ),
                2
            ),
            0
        ),
        2
    ) AS fold_sb_vs_open_btn,
    /* ---------- Defender BB (8) ---------- */
    ROUND(
        100.0 - COALESCE(
            ROUND(
                100.0 * SUM(threebet_cnt) FILTER (
                    WHERE
                        defend_pos = 8
                        AND open_pos = 3
                ) / NULLIF(
                    SUM(def_opp) FILTER (
                        WHERE
                            defend_pos = 8
                            AND open_pos = 3
                    ),
                    0
                ),
                2
            ),
            0
        ) - COALESCE(
            ROUND(
                100.0 * SUM(call_cnt) FILTER (
                    WHERE
                        defend_pos = 8
                        AND open_pos = 3
                ) / NULLIF(
                    SUM(def_opp) FILTER (
                        WHERE
                            defend_pos = 8
                            AND open_pos = 3
                    ),
                    0
                ),
                2
            ),
            0
        ),
        2
    ) AS fold_bb_vs_open_lj,
    ROUND(
        100.0 - COALESCE(
            ROUND(
                100.0 * SUM(threebet_cnt) FILTER (
                    WHERE
                        defend_pos = 8
                        AND open_pos = 2
                ) / NULLIF(
                    SUM(def_opp) FILTER (
                        WHERE
                            defend_pos = 8
                            AND open_pos = 2
                    ),
                    0
                ),
                2
            ),
            0
        ) - COALESCE(
            ROUND(
                100.0 * SUM(call_cnt) FILTER (
                    WHERE
                        defend_pos = 8
                        AND open_pos = 2
                ) / NULLIF(
                    SUM(def_opp) FILTER (
                        WHERE
                            defend_pos = 8
                            AND open_pos = 2
                    ),
                    0
                ),
                2
            ),
            0
        ),
        2
    ) AS fold_bb_vs_open_hj,
    ROUND(
        100.0 - COALESCE(
            ROUND(
                100.0 * SUM(threebet_cnt) FILTER (
                    WHERE
                        defend_pos = 8
                        AND open_pos = 1
                ) / NULLIF(
                    SUM(def_opp) FILTER (
                        WHERE
                            defend_pos = 8
                            AND open_pos = 1
                    ),
                    0
                ),
                2
            ),
            0
        ) - COALESCE(
            ROUND(
                100.0 * SUM(call_cnt) FILTER (
                    WHERE
                        defend_pos = 8
                        AND open_pos = 1
                ) / NULLIF(
                    SUM(def_opp) FILTER (
                        WHERE
                            defend_pos = 8
                            AND open_pos = 1
                    ),
                    0
                ),
                2
            ),
            0
        ),
        2
    ) AS fold_bb_vs_open_co,
    ROUND(
        100.0 - COALESCE(
            ROUND(
                100.0 * SUM(threebet_cnt) FILTER (
                    WHERE
                        defend_pos = 8
                        AND open_pos = 0
                ) / NULLIF(
                    SUM(def_opp) FILTER (
                        WHERE
                            defend_pos = 8
                            AND open_pos = 0
                    ),
                    0
                ),
                2
            ),
            0
        ) - COALESCE(
            ROUND(
                100.0 * SUM(call_cnt) FILTER (
                    WHERE
                        defend_pos = 8
                        AND open_pos = 0
                ) / NULLIF(
                    SUM(def_opp) FILTER (
                        WHERE
                            defend_pos = 8
                            AND open_pos = 0
                    ),
                    0
                ),
                2
            ),
            0
        ),
        2
    ) AS fold_bb_vs_open_btn,
    ROUND(
        100.0 - COALESCE(
            ROUND(
                100.0 * SUM(threebet_cnt) FILTER (
                    WHERE
                        defend_pos = 8
                        AND open_pos = 9
                ) / NULLIF(
                    SUM(def_opp) FILTER (
                        WHERE
                            defend_pos = 8
                            AND open_pos = 9
                    ),
                    0
                ),
                2
            ),
            0
        ) - COALESCE(
            ROUND(
                100.0 * SUM(call_cnt) FILTER (
                    WHERE
                        defend_pos = 8
                        AND open_pos = 9
                ) / NULLIF(
                    SUM(def_opp) FILTER (
                        WHERE
                            defend_pos = 8
                            AND open_pos = 9
                    ),
                    0
                ),
                2
            ),
            0
        ),
        2
    ) AS fold_bb_vs_open_sb
FROM
    mv_player_response_vs_open_counts
GROUP BY
    id_player,
    id_limit;