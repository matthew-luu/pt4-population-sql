DROP VIEW IF EXISTS pop.v_population_preflop;

CREATE VIEW
    pop.v_population_preflop AS
WITH
    rfi AS (
        SELECT
            cl.id_limit,
            cl.limit_name,
            cl.amt_sb,
            cl.amt_bb,
            COUNT(DISTINCT r.id_player) AS player_count,
            SUM(r.hands_in_pos) AS total_hands,
            ROUND(
                100.0 * SUM(r.rfi) FILTER (
                    WHERE
                        r.pos = 3
                ) / NULLIF(
                    SUM(r.open_opp) FILTER (
                        WHERE
                            r.pos = 3
                    ),
                    0
                ),
                2
            ) AS rfi_lj,
            ROUND(
                100.0 * SUM(r.rfi) FILTER (
                    WHERE
                        r.pos = 2
                ) / NULLIF(
                    SUM(r.open_opp) FILTER (
                        WHERE
                            r.pos = 2
                    ),
                    0
                ),
                2
            ) AS rfi_hj,
            ROUND(
                100.0 * SUM(r.rfi) FILTER (
                    WHERE
                        r.pos = 1
                ) / NULLIF(
                    SUM(r.open_opp) FILTER (
                        WHERE
                            r.pos = 1
                    ),
                    0
                ),
                2
            ) AS rfi_co,
            ROUND(
                100.0 * SUM(r.rfi) FILTER (
                    WHERE
                        r.pos = 0
                ) / NULLIF(
                    SUM(r.open_opp) FILTER (
                        WHERE
                            r.pos = 0
                    ),
                    0
                ),
                2
            ) AS rfi_btn,
            ROUND(
                100.0 * SUM(r.rfi) FILTER (
                    WHERE
                        r.pos = 9
                ) / NULLIF(
                    SUM(r.open_opp) FILTER (
                        WHERE
                            r.pos = 9
                    ),
                    0
                ),
                2
            ) AS rfi_sb
        FROM
            pop.mv_player_rfi_counts r
            JOIN public.cash_limit cl ON cl.id_limit = r.id_limit
        GROUP BY
            cl.id_limit,
            cl.limit_name,
            cl.amt_sb,
            cl.amt_bb
    ),
    call_vs_open AS (
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
    ),
    threebet AS (
        SELECT
            t.id_limit,
            ROUND(
                100.0 * SUM(t.threebet_cnt) FILTER (
                    WHERE
                        t.threebettor_pos = 2
                        AND t.opener_pos = 3
                ) / NULLIF(
                    SUM(t.threebet_opp) FILTER (
                        WHERE
                            t.threebettor_pos = 2
                            AND t.opener_pos = 3
                    ),
                    0
                ),
                2
            ) AS threebet_hj_vs_lj,
            ROUND(
                100.0 * SUM(t.threebet_cnt) FILTER (
                    WHERE
                        t.threebettor_pos = 1
                        AND t.opener_pos = 3
                ) / NULLIF(
                    SUM(t.threebet_opp) FILTER (
                        WHERE
                            t.threebettor_pos = 1
                            AND t.opener_pos = 3
                    ),
                    0
                ),
                2
            ) AS threebet_co_vs_lj,
            ROUND(
                100.0 * SUM(t.threebet_cnt) FILTER (
                    WHERE
                        t.threebettor_pos = 1
                        AND t.opener_pos = 2
                ) / NULLIF(
                    SUM(t.threebet_opp) FILTER (
                        WHERE
                            t.threebettor_pos = 1
                            AND t.opener_pos = 2
                    ),
                    0
                ),
                2
            ) AS threebet_co_vs_hj,
            ROUND(
                100.0 * SUM(t.threebet_cnt) FILTER (
                    WHERE
                        t.threebettor_pos = 0
                        AND t.opener_pos = 3
                ) / NULLIF(
                    SUM(t.threebet_opp) FILTER (
                        WHERE
                            t.threebettor_pos = 0
                            AND t.opener_pos = 3
                    ),
                    0
                ),
                2
            ) AS threebet_btn_vs_lj,
            ROUND(
                100.0 * SUM(t.threebet_cnt) FILTER (
                    WHERE
                        t.threebettor_pos = 0
                        AND t.opener_pos = 2
                ) / NULLIF(
                    SUM(t.threebet_opp) FILTER (
                        WHERE
                            t.threebettor_pos = 0
                            AND t.opener_pos = 2
                    ),
                    0
                ),
                2
            ) AS threebet_btn_vs_hj,
            ROUND(
                100.0 * SUM(t.threebet_cnt) FILTER (
                    WHERE
                        t.threebettor_pos = 0
                        AND t.opener_pos = 1
                ) / NULLIF(
                    SUM(t.threebet_opp) FILTER (
                        WHERE
                            t.threebettor_pos = 0
                            AND t.opener_pos = 1
                    ),
                    0
                ),
                2
            ) AS threebet_btn_vs_co,
            ROUND(
                100.0 * SUM(t.threebet_cnt) FILTER (
                    WHERE
                        t.threebettor_pos = 9
                        AND t.opener_pos = 3
                ) / NULLIF(
                    SUM(t.threebet_opp) FILTER (
                        WHERE
                            t.threebettor_pos = 9
                            AND t.opener_pos = 3
                    ),
                    0
                ),
                2
            ) AS threebet_sb_vs_lj,
            ROUND(
                100.0 * SUM(t.threebet_cnt) FILTER (
                    WHERE
                        t.threebettor_pos = 9
                        AND t.opener_pos = 2
                ) / NULLIF(
                    SUM(t.threebet_opp) FILTER (
                        WHERE
                            t.threebettor_pos = 9
                            AND t.opener_pos = 2
                    ),
                    0
                ),
                2
            ) AS threebet_sb_vs_hj,
            ROUND(
                100.0 * SUM(t.threebet_cnt) FILTER (
                    WHERE
                        t.threebettor_pos = 9
                        AND t.opener_pos = 1
                ) / NULLIF(
                    SUM(t.threebet_opp) FILTER (
                        WHERE
                            t.threebettor_pos = 9
                            AND t.opener_pos = 1
                    ),
                    0
                ),
                2
            ) AS threebet_sb_vs_co,
            ROUND(
                100.0 * SUM(t.threebet_cnt) FILTER (
                    WHERE
                        t.threebettor_pos = 9
                        AND t.opener_pos = 0
                ) / NULLIF(
                    SUM(t.threebet_opp) FILTER (
                        WHERE
                            t.threebettor_pos = 9
                            AND t.opener_pos = 0
                    ),
                    0
                ),
                2
            ) AS threebet_sb_vs_btn,
            ROUND(
                100.0 * SUM(t.threebet_cnt) FILTER (
                    WHERE
                        t.threebettor_pos = 8
                        AND t.opener_pos = 3
                ) / NULLIF(
                    SUM(t.threebet_opp) FILTER (
                        WHERE
                            t.threebettor_pos = 8
                            AND t.opener_pos = 3
                    ),
                    0
                ),
                2
            ) AS threebet_bb_vs_lj,
            ROUND(
                100.0 * SUM(t.threebet_cnt) FILTER (
                    WHERE
                        t.threebettor_pos = 8
                        AND t.opener_pos = 2
                ) / NULLIF(
                    SUM(t.threebet_opp) FILTER (
                        WHERE
                            t.threebettor_pos = 8
                            AND t.opener_pos = 2
                    ),
                    0
                ),
                2
            ) AS threebet_bb_vs_hj,
            ROUND(
                100.0 * SUM(t.threebet_cnt) FILTER (
                    WHERE
                        t.threebettor_pos = 8
                        AND t.opener_pos = 1
                ) / NULLIF(
                    SUM(t.threebet_opp) FILTER (
                        WHERE
                            t.threebettor_pos = 8
                            AND t.opener_pos = 1
                    ),
                    0
                ),
                2
            ) AS threebet_bb_vs_co,
            ROUND(
                100.0 * SUM(t.threebet_cnt) FILTER (
                    WHERE
                        t.threebettor_pos = 8
                        AND t.opener_pos = 0
                ) / NULLIF(
                    SUM(t.threebet_opp) FILTER (
                        WHERE
                            t.threebettor_pos = 8
                            AND t.opener_pos = 0
                    ),
                    0
                ),
                2
            ) AS threebet_bb_vs_btn,
            ROUND(
                100.0 * SUM(t.threebet_cnt) FILTER (
                    WHERE
                        t.threebettor_pos = 8
                        AND t.opener_pos = 9
                ) / NULLIF(
                    SUM(t.threebet_opp) FILTER (
                        WHERE
                            t.threebettor_pos = 8
                            AND t.opener_pos = 9
                    ),
                    0
                ),
                2
            ) AS threebet_bb_vs_sb
        FROM
            pop.mv_player_3bet_vs_open_counts t
        GROUP BY
            t.id_limit
    ),
    fold_vs_open AS (
        SELECT
            COALESCE(c.id_limit, t.id_limit) AS id_limit,
            ROUND(
                100.0 - COALESCE(t.threebet_hj_vs_lj, 0) - COALESCE(c.call_hj_vs_lj, 0),
                2
            ) AS fold_hj_vs_lj,
            ROUND(
                100.0 - COALESCE(t.threebet_co_vs_lj, 0) - COALESCE(c.call_co_vs_lj, 0),
                2
            ) AS fold_co_vs_lj,
            ROUND(
                100.0 - COALESCE(t.threebet_co_vs_hj, 0) - COALESCE(c.call_co_vs_hj, 0),
                2
            ) AS fold_co_vs_hj,
            ROUND(
                100.0 - COALESCE(t.threebet_btn_vs_lj, 0) - COALESCE(c.call_btn_vs_lj, 0),
                2
            ) AS fold_btn_vs_lj,
            ROUND(
                100.0 - COALESCE(t.threebet_btn_vs_hj, 0) - COALESCE(c.call_btn_vs_hj, 0),
                2
            ) AS fold_btn_vs_hj,
            ROUND(
                100.0 - COALESCE(t.threebet_btn_vs_co, 0) - COALESCE(c.call_btn_vs_co, 0),
                2
            ) AS fold_btn_vs_co,
            ROUND(
                100.0 - COALESCE(t.threebet_sb_vs_lj, 0) - COALESCE(c.call_sb_vs_lj, 0),
                2
            ) AS fold_sb_vs_lj,
            ROUND(
                100.0 - COALESCE(t.threebet_sb_vs_hj, 0) - COALESCE(c.call_sb_vs_hj, 0),
                2
            ) AS fold_sb_vs_hj,
            ROUND(
                100.0 - COALESCE(t.threebet_sb_vs_co, 0) - COALESCE(c.call_sb_vs_co, 0),
                2
            ) AS fold_sb_vs_co,
            ROUND(
                100.0 - COALESCE(t.threebet_sb_vs_btn, 0) - COALESCE(c.call_sb_vs_btn, 0),
                2
            ) AS fold_sb_vs_btn,
            ROUND(
                100.0 - COALESCE(t.threebet_bb_vs_lj, 0) - COALESCE(c.call_bb_vs_lj, 0),
                2
            ) AS fold_bb_vs_lj,
            ROUND(
                100.0 - COALESCE(t.threebet_bb_vs_hj, 0) - COALESCE(c.call_bb_vs_hj, 0),
                2
            ) AS fold_bb_vs_hj,
            ROUND(
                100.0 - COALESCE(t.threebet_bb_vs_co, 0) - COALESCE(c.call_bb_vs_co, 0),
                2
            ) AS fold_bb_vs_co,
            ROUND(
                100.0 - COALESCE(t.threebet_bb_vs_btn, 0) - COALESCE(c.call_bb_vs_btn, 0),
                2
            ) AS fold_bb_vs_btn,
            ROUND(
                100.0 - COALESCE(t.threebet_bb_vs_sb, 0) - COALESCE(c.call_bb_vs_sb, 0),
                2
            ) AS fold_bb_vs_sb
        FROM
            call_vs_open c
            FULL OUTER JOIN threebet t ON t.id_limit = c.id_limit
    ),
    fourbet_vs_3bet AS (
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
    ),
    call_vs_3bet AS (
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
            pop.mv_player_call_vs_3bet_counts cvt
        GROUP BY
            cvt.id_limit
    ),
    fold_vs_3bet AS (
        SELECT
            COALESCE(cvt.id_limit, fb.id_limit) AS id_limit,
            ROUND(
                100.0 - COALESCE(fb.fourbet_lj_vs_hj, 0) - COALESCE(cvt.call_lj_vs_3bet_hj, 0),
                2
            ) AS fold_lj_vs_3bet_hj,
            ROUND(
                100.0 - COALESCE(fb.fourbet_lj_vs_co, 0) - COALESCE(cvt.call_lj_vs_3bet_co, 0),
                2
            ) AS fold_lj_vs_3bet_co,
            ROUND(
                100.0 - COALESCE(fb.fourbet_lj_vs_btn, 0) - COALESCE(cvt.call_lj_vs_3bet_btn, 0),
                2
            ) AS fold_lj_vs_3bet_btn,
            ROUND(
                100.0 - COALESCE(fb.fourbet_lj_vs_sb, 0) - COALESCE(cvt.call_lj_vs_3bet_sb, 0),
                2
            ) AS fold_lj_vs_3bet_sb,
            ROUND(
                100.0 - COALESCE(fb.fourbet_lj_vs_bb, 0) - COALESCE(cvt.call_lj_vs_3bet_bb, 0),
                2
            ) AS fold_lj_vs_3bet_bb,
            ROUND(
                100.0 - COALESCE(fb.fourbet_hj_vs_co, 0) - COALESCE(cvt.call_hj_vs_3bet_co, 0),
                2
            ) AS fold_hj_vs_3bet_co,
            ROUND(
                100.0 - COALESCE(fb.fourbet_hj_vs_btn, 0) - COALESCE(cvt.call_hj_vs_3bet_btn, 0),
                2
            ) AS fold_hj_vs_3bet_btn,
            ROUND(
                100.0 - COALESCE(fb.fourbet_hj_vs_sb, 0) - COALESCE(cvt.call_hj_vs_3bet_sb, 0),
                2
            ) AS fold_hj_vs_3bet_sb,
            ROUND(
                100.0 - COALESCE(fb.fourbet_hj_vs_bb, 0) - COALESCE(cvt.call_hj_vs_3bet_bb, 0),
                2
            ) AS fold_hj_vs_3bet_bb,
            ROUND(
                100.0 - COALESCE(fb.fourbet_co_vs_btn, 0) - COALESCE(cvt.call_co_vs_3bet_btn, 0),
                2
            ) AS fold_co_vs_3bet_btn,
            ROUND(
                100.0 - COALESCE(fb.fourbet_co_vs_sb, 0) - COALESCE(cvt.call_co_vs_3bet_sb, 0),
                2
            ) AS fold_co_vs_3bet_sb,
            ROUND(
                100.0 - COALESCE(fb.fourbet_co_vs_bb, 0) - COALESCE(cvt.call_co_vs_3bet_bb, 0),
                2
            ) AS fold_co_vs_3bet_bb,
            ROUND(
                100.0 - COALESCE(fb.fourbet_btn_vs_sb, 0) - COALESCE(cvt.call_btn_vs_3bet_sb, 0),
                2
            ) AS fold_btn_vs_3bet_sb,
            ROUND(
                100.0 - COALESCE(fb.fourbet_btn_vs_bb, 0) - COALESCE(cvt.call_btn_vs_3bet_bb, 0),
                2
            ) AS fold_btn_vs_3bet_bb,
            ROUND(
                100.0 - COALESCE(fb.fourbet_sb_vs_bb, 0) - COALESCE(cvt.call_sb_vs_3bet_bb, 0),
                2
            ) AS fold_sb_vs_3bet_bb
        FROM
            call_vs_3bet cvt
            FULL OUTER JOIN fourbet_vs_3bet fb ON fb.id_limit = cvt.id_limit
    )
SELECT
    r.id_limit,
    r.limit_name,
    r.amt_sb,
    r.amt_bb,
    r.player_count,
    r.total_hands,
    r.rfi_lj,
    r.rfi_hj,
    r.rfi_co,
    r.rfi_btn,
    r.rfi_sb,
    c.call_hj_vs_lj,
    c.call_co_vs_lj,
    c.call_co_vs_hj,
    c.call_btn_vs_lj,
    c.call_btn_vs_hj,
    c.call_btn_vs_co,
    c.call_sb_vs_lj,
    c.call_sb_vs_hj,
    c.call_sb_vs_co,
    c.call_sb_vs_btn,
    c.call_bb_vs_lj,
    c.call_bb_vs_hj,
    c.call_bb_vs_co,
    c.call_bb_vs_btn,
    c.call_bb_vs_sb,
    t.threebet_hj_vs_lj,
    t.threebet_co_vs_lj,
    t.threebet_co_vs_hj,
    t.threebet_btn_vs_lj,
    t.threebet_btn_vs_hj,
    t.threebet_btn_vs_co,
    t.threebet_sb_vs_lj,
    t.threebet_sb_vs_hj,
    t.threebet_sb_vs_co,
    t.threebet_sb_vs_btn,
    t.threebet_bb_vs_lj,
    t.threebet_bb_vs_hj,
    t.threebet_bb_vs_co,
    t.threebet_bb_vs_btn,
    t.threebet_bb_vs_sb,
    f.fold_hj_vs_lj,
    f.fold_co_vs_lj,
    f.fold_co_vs_hj,
    f.fold_btn_vs_lj,
    f.fold_btn_vs_hj,
    f.fold_btn_vs_co,
    f.fold_sb_vs_lj,
    f.fold_sb_vs_hj,
    f.fold_sb_vs_co,
    f.fold_sb_vs_btn,
    f.fold_bb_vs_lj,
    f.fold_bb_vs_hj,
    f.fold_bb_vs_co,
    f.fold_bb_vs_btn,
    f.fold_bb_vs_sb,
    fb.fourbet_lj_vs_hj,
    fb.fourbet_lj_vs_co,
    fb.fourbet_lj_vs_btn,
    fb.fourbet_lj_vs_sb,
    fb.fourbet_lj_vs_bb,
    fb.fourbet_hj_vs_co,
    fb.fourbet_hj_vs_btn,
    fb.fourbet_hj_vs_sb,
    fb.fourbet_hj_vs_bb,
    fb.fourbet_co_vs_btn,
    fb.fourbet_co_vs_sb,
    fb.fourbet_co_vs_bb,
    fb.fourbet_btn_vs_sb,
    fb.fourbet_btn_vs_bb,
    fb.fourbet_sb_vs_bb,
    cvt.call_lj_vs_3bet_hj,
    cvt.call_lj_vs_3bet_co,
    cvt.call_lj_vs_3bet_btn,
    cvt.call_lj_vs_3bet_sb,
    cvt.call_lj_vs_3bet_bb,
    cvt.call_hj_vs_3bet_co,
    cvt.call_hj_vs_3bet_btn,
    cvt.call_hj_vs_3bet_sb,
    cvt.call_hj_vs_3bet_bb,
    cvt.call_co_vs_3bet_btn,
    cvt.call_co_vs_3bet_sb,
    cvt.call_co_vs_3bet_bb,
    cvt.call_btn_vs_3bet_sb,
    cvt.call_btn_vs_3bet_bb,
    cvt.call_sb_vs_3bet_bb,
    fvt.fold_lj_vs_3bet_hj,
    fvt.fold_lj_vs_3bet_co,
    fvt.fold_lj_vs_3bet_btn,
    fvt.fold_lj_vs_3bet_sb,
    fvt.fold_lj_vs_3bet_bb,
    fvt.fold_hj_vs_3bet_co,
    fvt.fold_hj_vs_3bet_btn,
    fvt.fold_hj_vs_3bet_sb,
    fvt.fold_hj_vs_3bet_bb,
    fvt.fold_co_vs_3bet_btn,
    fvt.fold_co_vs_3bet_sb,
    fvt.fold_co_vs_3bet_bb,
    fvt.fold_btn_vs_3bet_sb,
    fvt.fold_btn_vs_3bet_bb,
    fvt.fold_sb_vs_3bet_bb
FROM
    rfi r
    LEFT JOIN call_vs_open c ON c.id_limit = r.id_limit
    LEFT JOIN threebet t ON t.id_limit = r.id_limit
    LEFT JOIN fold_vs_open f ON f.id_limit = r.id_limit
    LEFT JOIN fourbet_vs_3bet fb on fb.id_limit = r.id_limit
    LEFT JOIN call_vs_3bet cvt on cvt.id_limit = r.id_limit
    LEFT JOIN fold_vs_3bet fvt on fvt.id_limit = r.id_limit;