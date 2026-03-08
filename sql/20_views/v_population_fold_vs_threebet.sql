DROP VIEW IF EXISTS pop.v_population_fold_vs_threebet;

CREATE VIEW
    pop.v_population_fold_vs_threebet AS
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
    pop.v_population_call_vs_threebet cvt
    FULL OUTER JOIN pop.v_population_fourbet_vs_threebet fb ON fb.id_limit = cvt.id_limit