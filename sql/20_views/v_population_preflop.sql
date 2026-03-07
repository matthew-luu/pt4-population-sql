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
            ) AS rfi_utg,
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
            ) AS call_hj_vs_utg,
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
            ) AS call_co_vs_utg,
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
            ) AS call_btn_vs_utg,
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
            ) AS call_sb_vs_utg,
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
            ) AS call_bb_vs_utg,
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
            ) AS threebet_hj_vs_utg,
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
            ) AS threebet_co_vs_utg,
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
            ) AS threebet_btn_vs_utg,
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
            ) AS threebet_sb_vs_utg,
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
            ) AS threebet_bb_vs_utg,
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
                100.0 - COALESCE(t.threebet_hj_vs_utg, 0) - COALESCE(c.call_hj_vs_utg, 0),
                2
            ) AS fold_hj_vs_utg,
            ROUND(
                100.0 - COALESCE(t.threebet_co_vs_utg, 0) - COALESCE(c.call_co_vs_utg, 0),
                2
            ) AS fold_co_vs_utg,
            ROUND(
                100.0 - COALESCE(t.threebet_co_vs_hj, 0) - COALESCE(c.call_co_vs_hj, 0),
                2
            ) AS fold_co_vs_hj,
            ROUND(
                100.0 - COALESCE(t.threebet_btn_vs_utg, 0) - COALESCE(c.call_btn_vs_utg, 0),
                2
            ) AS fold_btn_vs_utg,
            ROUND(
                100.0 - COALESCE(t.threebet_btn_vs_hj, 0) - COALESCE(c.call_btn_vs_hj, 0),
                2
            ) AS fold_btn_vs_hj,
            ROUND(
                100.0 - COALESCE(t.threebet_btn_vs_co, 0) - COALESCE(c.call_btn_vs_co, 0),
                2
            ) AS fold_btn_vs_co,
            ROUND(
                100.0 - COALESCE(t.threebet_sb_vs_utg, 0) - COALESCE(c.call_sb_vs_utg, 0),
                2
            ) AS fold_sb_vs_utg,
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
                100.0 - COALESCE(t.threebet_bb_vs_utg, 0) - COALESCE(c.call_bb_vs_utg, 0),
                2
            ) AS fold_bb_vs_utg,
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
    )
SELECT
    r.id_limit,
    r.limit_name,
    r.amt_sb,
    r.amt_bb,
    r.player_count,
    r.total_hands,
    r.rfi_utg,
    r.rfi_hj,
    r.rfi_co,
    r.rfi_btn,
    r.rfi_sb,
    c.call_hj_vs_utg,
    c.call_co_vs_utg,
    c.call_co_vs_hj,
    c.call_btn_vs_utg,
    c.call_btn_vs_hj,
    c.call_btn_vs_co,
    c.call_sb_vs_utg,
    c.call_sb_vs_hj,
    c.call_sb_vs_co,
    c.call_sb_vs_btn,
    c.call_bb_vs_utg,
    c.call_bb_vs_hj,
    c.call_bb_vs_co,
    c.call_bb_vs_btn,
    c.call_bb_vs_sb,
    t.threebet_hj_vs_utg,
    t.threebet_co_vs_utg,
    t.threebet_co_vs_hj,
    t.threebet_btn_vs_utg,
    t.threebet_btn_vs_hj,
    t.threebet_btn_vs_co,
    t.threebet_sb_vs_utg,
    t.threebet_sb_vs_hj,
    t.threebet_sb_vs_co,
    t.threebet_sb_vs_btn,
    t.threebet_bb_vs_utg,
    t.threebet_bb_vs_hj,
    t.threebet_bb_vs_co,
    t.threebet_bb_vs_btn,
    t.threebet_bb_vs_sb,
    f.fold_hj_vs_utg,
    f.fold_co_vs_utg,
    f.fold_co_vs_hj,
    f.fold_btn_vs_utg,
    f.fold_btn_vs_hj,
    f.fold_btn_vs_co,
    f.fold_sb_vs_utg,
    f.fold_sb_vs_hj,
    f.fold_sb_vs_co,
    f.fold_sb_vs_btn,
    f.fold_bb_vs_utg,
    f.fold_bb_vs_hj,
    f.fold_bb_vs_co,
    f.fold_bb_vs_btn,
    f.fold_bb_vs_sb
FROM
    rfi r
    LEFT JOIN call_vs_open c ON c.id_limit = r.id_limit
    LEFT JOIN threebet t ON t.id_limit = r.id_limit
    LEFT JOIN fold_vs_open f ON f.id_limit = r.id_limit;