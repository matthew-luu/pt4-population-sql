DROP VIEW IF EXISTS pop.v_population_fold_vs_open;

CREATE VIEW
    pop.v_population_fold_vs_open AS

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
    pop.v_population_call_vs_open c
    FULL OUTER JOIN pop.v_population_3bet_vs_open t ON t.id_limit = c.id_limit