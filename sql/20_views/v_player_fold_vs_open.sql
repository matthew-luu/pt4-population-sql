DROP VIEW IF EXISTS pop.v_player_fold_vs_open;

CREATE VIEW
    pop.v_player_fold_vs_open AS
SELECT
    tb.id_player,
    tb.id_limit,
    /* ---------- Defender HJ (2) ---------- */
    ROUND(
        100.0 - COALESCE(tb.threebet_hj_vs_lj, 0) - COALESCE(c.call_hj_vs_lj, 0),
        2
    ) AS fold_hj_vs_lj,
    /* ---------- Defender CO (1) ---------- */
    ROUND(
        100.0 - COALESCE(tb.threebet_co_vs_lj, 0) - COALESCE(c.call_co_vs_lj, 0),
        2
    ) AS fold_co_vs_lj,
    ROUND(
        100.0 - COALESCE(tb.threebet_co_vs_hj, 0) - COALESCE(c.call_co_vs_hj, 0),
        2
    ) AS fold_co_vs_hj,
    /* ---------- Defender BTN (0) ---------- */
    ROUND(
        100.0 - COALESCE(tb.threebet_btn_vs_lj, 0) - COALESCE(c.call_btn_vs_lj, 0),
        2
    ) AS fold_btn_vs_lj,
    ROUND(
        100.0 - COALESCE(tb.threebet_btn_vs_hj, 0) - COALESCE(c.call_btn_vs_hj, 0),
        2
    ) AS fold_btn_vs_hj,
    ROUND(
        100.0 - COALESCE(tb.threebet_btn_vs_co, 0) - COALESCE(c.call_btn_vs_co, 0),
        2
    ) AS fold_btn_vs_co,
    /* ---------- Defender SB (9) ---------- */
    ROUND(
        100.0 - COALESCE(tb.threebet_sb_vs_lj, 0) - COALESCE(c.call_sb_vs_lj, 0),
        2
    ) AS fold_sb_vs_lj,
    ROUND(
        100.0 - COALESCE(tb.threebet_sb_vs_hj, 0) - COALESCE(c.call_sb_vs_hj, 0),
        2
    ) AS fold_sb_vs_hj,
    ROUND(
        100.0 - COALESCE(tb.threebet_sb_vs_co, 0) - COALESCE(c.call_sb_vs_co, 0),
        2
    ) AS fold_sb_vs_co,
    ROUND(
        100.0 - COALESCE(tb.threebet_sb_vs_btn, 0) - COALESCE(c.call_sb_vs_btn, 0),
        2
    ) AS fold_sb_vs_btn,
    /* ---------- Defender BB (8) ---------- */
    ROUND(
        100.0 - COALESCE(tb.threebet_bb_vs_lj, 0) - COALESCE(c.call_bb_vs_lj, 0),
        2
    ) AS fold_bb_vs_lj,
    ROUND(
        100.0 - COALESCE(tb.threebet_bb_vs_hj, 0) - COALESCE(c.call_bb_vs_hj, 0),
        2
    ) AS fold_bb_vs_hj,
    ROUND(
        100.0 - COALESCE(tb.threebet_bb_vs_co, 0) - COALESCE(c.call_bb_vs_co, 0),
        2
    ) AS fold_bb_vs_co,
    ROUND(
        100.0 - COALESCE(tb.threebet_bb_vs_btn, 0) - COALESCE(c.call_bb_vs_btn, 0),
        2
    ) AS fold_bb_vs_btn,
    ROUND(
        100.0 - COALESCE(tb.threebet_bb_vs_sb, 0) - COALESCE(c.call_bb_vs_sb, 0),
        2
    ) AS fold_bb_vs_sb
FROM
    pop.v_player_3bet_vs_open tb
    LEFT JOIN pop.v_player_call_vs_open c ON tb.id_player = c.id_player
    AND tb.id_limit = c.id_limit;