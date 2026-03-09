DROP VIEW IF EXISTS pop.v_player_fold_vs_threebet;

CREATE VIEW
    pop.v_player_fold_vs_threebet AS
SELECT
    id_player,
    id_limit,
    ROUND(
        100.0 * (
            SUM(defend_opp) FILTER (
                WHERE
                    threebettor_pos = 8
                    AND defend_pos = 9
            ) - SUM(call_cnt) FILTER (
                WHERE
                    threebettor_pos = 8
                    AND defend_pos = 9
            ) - SUM(fourbet_cnt) FILTER (
                WHERE
                    threebettor_pos = 8
                    AND defend_pos = 9
            )
        ) / NULLIF(
            SUM(defend_opp) FILTER (
                WHERE
                    threebettor_pos = 8
                    AND defend_pos = 9
            ),
            0
        ),
        2
    ) AS fold_sb_vs_threebet_bb,
    ROUND(
        100.0 * (
            SUM(defend_opp) FILTER (
                WHERE
                    threebettor_pos = 8
                    AND defend_pos = 0
            ) - SUM(call_cnt) FILTER (
                WHERE
                    threebettor_pos = 8
                    AND defend_pos = 0
            ) - SUM(fourbet_cnt) FILTER (
                WHERE
                    threebettor_pos = 8
                    AND defend_pos = 0
            )
        ) / NULLIF(
            SUM(defend_opp) FILTER (
                WHERE
                    threebettor_pos = 8
                    AND defend_pos = 0
            ),
            0
        ),
        2
    ) AS fold_btn_vs_threebet_bb,
    ROUND(
        100.0 * (
            SUM(defend_opp) FILTER (
                WHERE
                    threebettor_pos = 9
                    AND defend_pos = 0
            ) - SUM(call_cnt) FILTER (
                WHERE
                    threebettor_pos = 9
                    AND defend_pos = 0
            ) - SUM(fourbet_cnt) FILTER (
                WHERE
                    threebettor_pos = 9
                    AND defend_pos = 0
            )
        ) / NULLIF(
            SUM(defend_opp) FILTER (
                WHERE
                    threebettor_pos = 9
                    AND defend_pos = 0
            ),
            0
        ),
        2
    ) AS fold_btn_vs_threebet_sb,
    ROUND(
        100.0 * (
            SUM(defend_opp) FILTER (
                WHERE
                    threebettor_pos = 8
                    AND defend_pos = 1
            ) - SUM(call_cnt) FILTER (
                WHERE
                    threebettor_pos = 8
                    AND defend_pos = 1
            ) - SUM(fourbet_cnt) FILTER (
                WHERE
                    threebettor_pos = 8
                    AND defend_pos = 1
            )
        ) / NULLIF(
            SUM(defend_opp) FILTER (
                WHERE
                    threebettor_pos = 8
                    AND defend_pos = 1
            ),
            0
        ),
        2
    ) AS fold_co_vs_threebet_bb,
    ROUND(
        100.0 * (
            SUM(defend_opp) FILTER (
                WHERE
                    threebettor_pos = 9
                    AND defend_pos = 1
            ) - SUM(call_cnt) FILTER (
                WHERE
                    threebettor_pos = 9
                    AND defend_pos = 1
            ) - SUM(fourbet_cnt) FILTER (
                WHERE
                    threebettor_pos = 9
                    AND defend_pos = 1
            )
        ) / NULLIF(
            SUM(defend_opp) FILTER (
                WHERE
                    threebettor_pos = 9
                    AND defend_pos = 1
            ),
            0
        ),
        2
    ) AS fold_co_vs_threebet_sb,
    ROUND(
        100.0 * (
            SUM(defend_opp) FILTER (
                WHERE
                    threebettor_pos = 0
                    AND defend_pos = 1
            ) - SUM(call_cnt) FILTER (
                WHERE
                    threebettor_pos = 0
                    AND defend_pos = 1
            ) - SUM(fourbet_cnt) FILTER (
                WHERE
                    threebettor_pos = 0
                    AND defend_pos = 1
            )
        ) / NULLIF(
            SUM(defend_opp) FILTER (
                WHERE
                    threebettor_pos = 0
                    AND defend_pos = 1
            ),
            0
        ),
        2
    ) AS fold_co_vs_threebet_btn,
    ROUND(
        100.0 * (
            SUM(defend_opp) FILTER (
                WHERE
                    threebettor_pos = 8
                    AND defend_pos = 2
            ) - SUM(call_cnt) FILTER (
                WHERE
                    threebettor_pos = 8
                    AND defend_pos = 2
            ) - SUM(fourbet_cnt) FILTER (
                WHERE
                    threebettor_pos = 8
                    AND defend_pos = 2
            )
        ) / NULLIF(
            SUM(defend_opp) FILTER (
                WHERE
                    threebettor_pos = 8
                    AND defend_pos = 2
            ),
            0
        ),
        2
    ) AS fold_hj_vs_threebet_bb,
    ROUND(
        100.0 * (
            SUM(defend_opp) FILTER (
                WHERE
                    threebettor_pos = 9
                    AND defend_pos = 2
            ) - SUM(call_cnt) FILTER (
                WHERE
                    threebettor_pos = 9
                    AND defend_pos = 2
            ) - SUM(fourbet_cnt) FILTER (
                WHERE
                    threebettor_pos = 9
                    AND defend_pos = 2
            )
        ) / NULLIF(
            SUM(defend_opp) FILTER (
                WHERE
                    threebettor_pos = 9
                    AND defend_pos = 2
            ),
            0
        ),
        2
    ) AS fold_hj_vs_threebet_sb,
    ROUND(
        100.0 * (
            SUM(defend_opp) FILTER (
                WHERE
                    threebettor_pos = 0
                    AND defend_pos = 2
            ) - SUM(call_cnt) FILTER (
                WHERE
                    threebettor_pos = 0
                    AND defend_pos = 2
            ) - SUM(fourbet_cnt) FILTER (
                WHERE
                    threebettor_pos = 0
                    AND defend_pos = 2
            )
        ) / NULLIF(
            SUM(defend_opp) FILTER (
                WHERE
                    threebettor_pos = 0
                    AND defend_pos = 2
            ),
            0
        ),
        2
    ) AS fold_hj_vs_threebet_btn,
    ROUND(
        100.0 * (
            SUM(defend_opp) FILTER (
                WHERE
                    threebettor_pos = 1
                    AND defend_pos = 2
            ) - SUM(call_cnt) FILTER (
                WHERE
                    threebettor_pos = 1
                    AND defend_pos = 2
            ) - SUM(fourbet_cnt) FILTER (
                WHERE
                    threebettor_pos = 1
                    AND defend_pos = 2
            )
        ) / NULLIF(
            SUM(defend_opp) FILTER (
                WHERE
                    threebettor_pos = 1
                    AND defend_pos = 2
            ),
            0
        ),
        2
    ) AS fold_hj_vs_threebet_co,
    ROUND(
        100.0 * (
            SUM(defend_opp) FILTER (
                WHERE
                    threebettor_pos = 8
                    AND defend_pos = 3
            ) - SUM(call_cnt) FILTER (
                WHERE
                    threebettor_pos = 8
                    AND defend_pos = 3
            ) - SUM(fourbet_cnt) FILTER (
                WHERE
                    threebettor_pos = 8
                    AND defend_pos = 3
            )
        ) / NULLIF(
            SUM(defend_opp) FILTER (
                WHERE
                    threebettor_pos = 8
                    AND defend_pos = 3
            ),
            0
        ),
        2
    ) AS fold_lj_vs_threebet_bb,
    ROUND(
        100.0 * (
            SUM(defend_opp) FILTER (
                WHERE
                    threebettor_pos = 9
                    AND defend_pos = 3
            ) - SUM(call_cnt) FILTER (
                WHERE
                    threebettor_pos = 9
                    AND defend_pos = 3
            ) - SUM(fourbet_cnt) FILTER (
                WHERE
                    threebettor_pos = 9
                    AND defend_pos = 3
            )
        ) / NULLIF(
            SUM(defend_opp) FILTER (
                WHERE
                    threebettor_pos = 9
                    AND defend_pos = 3
            ),
            0
        ),
        2
    ) AS fold_lj_vs_threebet_sb,
    ROUND(
        100.0 * (
            SUM(defend_opp) FILTER (
                WHERE
                    threebettor_pos = 0
                    AND defend_pos = 3
            ) - SUM(call_cnt) FILTER (
                WHERE
                    threebettor_pos = 0
                    AND defend_pos = 3
            ) - SUM(fourbet_cnt) FILTER (
                WHERE
                    threebettor_pos = 0
                    AND defend_pos = 3
            )
        ) / NULLIF(
            SUM(defend_opp) FILTER (
                WHERE
                    threebettor_pos = 0
                    AND defend_pos = 3
            ),
            0
        ),
        2
    ) AS fold_lj_vs_threebet_btn,
    ROUND(
        100.0 * (
            SUM(defend_opp) FILTER (
                WHERE
                    threebettor_pos = 1
                    AND defend_pos = 3
            ) - SUM(call_cnt) FILTER (
                WHERE
                    threebettor_pos = 1
                    AND defend_pos = 3
            ) - SUM(fourbet_cnt) FILTER (
                WHERE
                    threebettor_pos = 1
                    AND defend_pos = 3
            )
        ) / NULLIF(
            SUM(defend_opp) FILTER (
                WHERE
                    threebettor_pos = 1
                    AND defend_pos = 3
            ),
            0
        ),
        2
    ) AS fold_lj_vs_threebet_co,
    ROUND(
        100.0 * (
            SUM(defend_opp) FILTER (
                WHERE
                    threebettor_pos = 2
                    AND defend_pos = 3
            ) - SUM(call_cnt) FILTER (
                WHERE
                    threebettor_pos = 2
                    AND defend_pos = 3
            ) - SUM(fourbet_cnt) FILTER (
                WHERE
                    threebettor_pos = 2
                    AND defend_pos = 3
            )
        ) / NULLIF(
            SUM(defend_opp) FILTER (
                WHERE
                    threebettor_pos = 2
                    AND defend_pos = 3
            ),
            0
        ),
        2
    ) AS fold_lj_vs_threebet_hj
FROM
    pop.mv_player_response_vs_threebet_counts
GROUP BY
    id_player,
    id_limit;