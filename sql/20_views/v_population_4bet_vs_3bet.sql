DROP VIEW IF EXISTS pop.v_population_4bet_vs_3bet;

CREATE VIEW
    pop.v_population_4bet_vs_3bet AS
SELECT
    fb.id_limit,
    ROUND(
        100.0 * SUM(fb.fourbet_cnt) FILTER (
            WHERE
                fb.fourbettor_pos = 3
                AND fb.threebettor_pos = 2
        ) / NULLIF(
            SUM(fb.fourbet_opp) FILTER (
                WHERE
                    fb.fourbettor_pos = 3
                    AND fb.threebettor_pos = 2
            ),
            0
        ),
        2
    ) AS fourbet_lj_vs_hj,
    ROUND(
        100.0 * SUM(fb.fourbet_cnt) FILTER (
            WHERE
                fb.fourbettor_pos = 3
                AND fb.threebettor_pos = 1
        ) / NULLIF(
            SUM(fb.fourbet_opp) FILTER (
                WHERE
                    fb.fourbettor_pos = 3
                    AND fb.threebettor_pos = 1
            ),
            0
        ),
        2
    ) AS fourbet_lj_vs_co,
    ROUND(
        100.0 * SUM(fb.fourbet_cnt) FILTER (
            WHERE
                fb.fourbettor_pos = 3
                AND fb.threebettor_pos = 0
        ) / NULLIF(
            SUM(fb.fourbet_opp) FILTER (
                WHERE
                    fb.fourbettor_pos = 3
                    AND fb.threebettor_pos = 0
            ),
            0
        ),
        2
    ) AS fourbet_lj_vs_btn,
    ROUND(
        100.0 * SUM(fb.fourbet_cnt) FILTER (
            WHERE
                fb.fourbettor_pos = 3
                AND fb.threebettor_pos = 9
        ) / NULLIF(
            SUM(fb.fourbet_opp) FILTER (
                WHERE
                    fb.fourbettor_pos = 3
                    AND fb.threebettor_pos = 9
            ),
            0
        ),
        2
    ) AS fourbet_lj_vs_sb,
    ROUND(
        100.0 * SUM(fb.fourbet_cnt) FILTER (
            WHERE
                fb.fourbettor_pos = 3
                AND fb.threebettor_pos = 8
        ) / NULLIF(
            SUM(fb.fourbet_opp) FILTER (
                WHERE
                    fb.fourbettor_pos = 3
                    AND fb.threebettor_pos = 8
            ),
            0
        ),
        2
    ) AS fourbet_lj_vs_bb,
    ROUND(
        100.0 * SUM(fb.fourbet_cnt) FILTER (
            WHERE
                fb.fourbettor_pos = 2
                AND fb.threebettor_pos = 1
        ) / NULLIF(
            SUM(fb.fourbet_opp) FILTER (
                WHERE
                    fb.fourbettor_pos = 2
                    AND fb.threebettor_pos = 1
            ),
            0
        ),
        2
    ) AS fourbet_hj_vs_co,
    ROUND(
        100.0 * SUM(fb.fourbet_cnt) FILTER (
            WHERE
                fb.fourbettor_pos = 2
                AND fb.threebettor_pos = 0
        ) / NULLIF(
            SUM(fb.fourbet_opp) FILTER (
                WHERE
                    fb.fourbettor_pos = 2
                    AND fb.threebettor_pos = 0
            ),
            0
        ),
        2
    ) AS fourbet_hj_vs_btn,
    ROUND(
        100.0 * SUM(fb.fourbet_cnt) FILTER (
            WHERE
                fb.fourbettor_pos = 2
                AND fb.threebettor_pos = 9
        ) / NULLIF(
            SUM(fb.fourbet_opp) FILTER (
                WHERE
                    fb.fourbettor_pos = 2
                    AND fb.threebettor_pos = 9
            ),
            0
        ),
        2
    ) AS fourbet_hj_vs_sb,
    ROUND(
        100.0 * SUM(fb.fourbet_cnt) FILTER (
            WHERE
                fb.fourbettor_pos = 2
                AND fb.threebettor_pos = 8
        ) / NULLIF(
            SUM(fb.fourbet_opp) FILTER (
                WHERE
                    fb.fourbettor_pos = 2
                    AND fb.threebettor_pos = 8
            ),
            0
        ),
        2
    ) AS fourbet_hj_vs_bb,
    ROUND(
        100.0 * SUM(fb.fourbet_cnt) FILTER (
            WHERE
                fb.fourbettor_pos = 1
                AND fb.threebettor_pos = 0
        ) / NULLIF(
            SUM(fb.fourbet_opp) FILTER (
                WHERE
                    fb.fourbettor_pos = 1
                    AND fb.threebettor_pos = 0
            ),
            0
        ),
        2
    ) AS fourbet_co_vs_btn,
    ROUND(
        100.0 * SUM(fb.fourbet_cnt) FILTER (
            WHERE
                fb.fourbettor_pos = 1
                AND fb.threebettor_pos = 9
        ) / NULLIF(
            SUM(fb.fourbet_opp) FILTER (
                WHERE
                    fb.fourbettor_pos = 1
                    AND fb.threebettor_pos = 9
            ),
            0
        ),
        2
    ) AS fourbet_co_vs_sb,
    ROUND(
        100.0 * SUM(fb.fourbet_cnt) FILTER (
            WHERE
                fb.fourbettor_pos = 1
                AND fb.threebettor_pos = 8
        ) / NULLIF(
            SUM(fb.fourbet_opp) FILTER (
                WHERE
                    fb.fourbettor_pos = 1
                    AND fb.threebettor_pos = 8
            ),
            0
        ),
        2
    ) AS fourbet_co_vs_bb,
    ROUND(
        100.0 * SUM(fb.fourbet_cnt) FILTER (
            WHERE
                fb.fourbettor_pos = 0
                AND fb.threebettor_pos = 9
        ) / NULLIF(
            SUM(fb.fourbet_opp) FILTER (
                WHERE
                    fb.fourbettor_pos = 0
                    AND fb.threebettor_pos = 9
            ),
            0
        ),
        2
    ) AS fourbet_btn_vs_sb,
    ROUND(
        100.0 * SUM(fb.fourbet_cnt) FILTER (
            WHERE
                fb.fourbettor_pos = 0
                AND fb.threebettor_pos = 8
        ) / NULLIF(
            SUM(fb.fourbet_opp) FILTER (
                WHERE
                    fb.fourbettor_pos = 0
                    AND fb.threebettor_pos = 8
            ),
            0
        ),
        2
    ) AS fourbet_btn_vs_bb,
    ROUND(
        100.0 * SUM(fb.fourbet_cnt) FILTER (
            WHERE
                fb.fourbettor_pos = 9
                AND fb.threebettor_pos = 8
        ) / NULLIF(
            SUM(fb.fourbet_opp) FILTER (
                WHERE
                    fb.fourbettor_pos = 9
                    AND fb.threebettor_pos = 8
            ),
            0
        ),
        2
    ) AS fourbet_sb_vs_bb
FROM
    pop.mv_player_4bet_vs_3bet_counts fb
GROUP BY
    fb.id_limit