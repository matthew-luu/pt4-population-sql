DROP VIEW IF EXISTS pop.v_population_fourbet_vs_threebet;

CREATE VIEW
    pop.v_population_fourbet_vs_threebet AS
SELECT
    fb.id_limit,
    ROUND(
        100.0 * SUM(fb.fourbet_cnt) FILTER (
            WHERE
                fb.defend_pos = 3
                AND fb.threebettor_pos = 2
        ) / NULLIF(
            SUM(fb.defend_opp) FILTER (
                WHERE
                    fb.defend_pos = 3
                    AND fb.threebettor_pos = 2
            ),
            0
        ),
        2
    ) AS fourbet_lj_vs_hj,
    ROUND(
        100.0 * SUM(fb.fourbet_cnt) FILTER (
            WHERE
                fb.defend_pos = 3
                AND fb.threebettor_pos = 1
        ) / NULLIF(
            SUM(fb.defend_opp) FILTER (
                WHERE
                    fb.defend_pos = 3
                    AND fb.threebettor_pos = 1
            ),
            0
        ),
        2
    ) AS fourbet_lj_vs_co,
    ROUND(
        100.0 * SUM(fb.fourbet_cnt) FILTER (
            WHERE
                fb.defend_pos = 3
                AND fb.threebettor_pos = 0
        ) / NULLIF(
            SUM(fb.defend_opp) FILTER (
                WHERE
                    fb.defend_pos = 3
                    AND fb.threebettor_pos = 0
            ),
            0
        ),
        2
    ) AS fourbet_lj_vs_btn,
    ROUND(
        100.0 * SUM(fb.fourbet_cnt) FILTER (
            WHERE
                fb.defend_pos = 3
                AND fb.threebettor_pos = 9
        ) / NULLIF(
            SUM(fb.defend_opp) FILTER (
                WHERE
                    fb.defend_pos = 3
                    AND fb.threebettor_pos = 9
            ),
            0
        ),
        2
    ) AS fourbet_lj_vs_sb,
    ROUND(
        100.0 * SUM(fb.fourbet_cnt) FILTER (
            WHERE
                fb.defend_pos = 3
                AND fb.threebettor_pos = 8
        ) / NULLIF(
            SUM(fb.defend_opp) FILTER (
                WHERE
                    fb.defend_pos = 3
                    AND fb.threebettor_pos = 8
            ),
            0
        ),
        2
    ) AS fourbet_lj_vs_bb,
    ROUND(
        100.0 * SUM(fb.fourbet_cnt) FILTER (
            WHERE
                fb.defend_pos = 2
                AND fb.threebettor_pos = 1
        ) / NULLIF(
            SUM(fb.defend_opp) FILTER (
                WHERE
                    fb.defend_pos = 2
                    AND fb.threebettor_pos = 1
            ),
            0
        ),
        2
    ) AS fourbet_hj_vs_co,
    ROUND(
        100.0 * SUM(fb.fourbet_cnt) FILTER (
            WHERE
                fb.defend_pos = 2
                AND fb.threebettor_pos = 0
        ) / NULLIF(
            SUM(fb.defend_opp) FILTER (
                WHERE
                    fb.defend_pos = 2
                    AND fb.threebettor_pos = 0
            ),
            0
        ),
        2
    ) AS fourbet_hj_vs_btn,
    ROUND(
        100.0 * SUM(fb.fourbet_cnt) FILTER (
            WHERE
                fb.defend_pos = 2
                AND fb.threebettor_pos = 9
        ) / NULLIF(
            SUM(fb.defend_opp) FILTER (
                WHERE
                    fb.defend_pos = 2
                    AND fb.threebettor_pos = 9
            ),
            0
        ),
        2
    ) AS fourbet_hj_vs_sb,
    ROUND(
        100.0 * SUM(fb.fourbet_cnt) FILTER (
            WHERE
                fb.defend_pos = 2
                AND fb.threebettor_pos = 8
        ) / NULLIF(
            SUM(fb.defend_opp) FILTER (
                WHERE
                    fb.defend_pos = 2
                    AND fb.threebettor_pos = 8
            ),
            0
        ),
        2
    ) AS fourbet_hj_vs_bb,
    ROUND(
        100.0 * SUM(fb.fourbet_cnt) FILTER (
            WHERE
                fb.defend_pos = 1
                AND fb.threebettor_pos = 0
        ) / NULLIF(
            SUM(fb.defend_opp) FILTER (
                WHERE
                    fb.defend_pos = 1
                    AND fb.threebettor_pos = 0
            ),
            0
        ),
        2
    ) AS fourbet_co_vs_btn,
    ROUND(
        100.0 * SUM(fb.fourbet_cnt) FILTER (
            WHERE
                fb.defend_pos = 1
                AND fb.threebettor_pos = 9
        ) / NULLIF(
            SUM(fb.defend_opp) FILTER (
                WHERE
                    fb.defend_pos = 1
                    AND fb.threebettor_pos = 9
            ),
            0
        ),
        2
    ) AS fourbet_co_vs_sb,
    ROUND(
        100.0 * SUM(fb.fourbet_cnt) FILTER (
            WHERE
                fb.defend_pos = 1
                AND fb.threebettor_pos = 8
        ) / NULLIF(
            SUM(fb.defend_opp) FILTER (
                WHERE
                    fb.defend_pos = 1
                    AND fb.threebettor_pos = 8
            ),
            0
        ),
        2
    ) AS fourbet_co_vs_bb,
    ROUND(
        100.0 * SUM(fb.fourbet_cnt) FILTER (
            WHERE
                fb.defend_pos = 0
                AND fb.threebettor_pos = 9
        ) / NULLIF(
            SUM(fb.defend_opp) FILTER (
                WHERE
                    fb.defend_pos = 0
                    AND fb.threebettor_pos = 9
            ),
            0
        ),
        2
    ) AS fourbet_btn_vs_sb,
    ROUND(
        100.0 * SUM(fb.fourbet_cnt) FILTER (
            WHERE
                fb.defend_pos = 0
                AND fb.threebettor_pos = 8
        ) / NULLIF(
            SUM(fb.defend_opp) FILTER (
                WHERE
                    fb.defend_pos = 0
                    AND fb.threebettor_pos = 8
            ),
            0
        ),
        2
    ) AS fourbet_btn_vs_bb,
    ROUND(
        100.0 * SUM(fb.fourbet_cnt) FILTER (
            WHERE
                fb.defend_pos = 9
                AND fb.threebettor_pos = 8
        ) / NULLIF(
            SUM(fb.defend_opp) FILTER (
                WHERE
                    fb.defend_pos = 9
                    AND fb.threebettor_pos = 8
            ),
            0
        ),
        2
    ) AS fourbet_sb_vs_bb
FROM
    pop.mv_player_response_vs_threebet_counts fb
GROUP BY
    fb.id_limit