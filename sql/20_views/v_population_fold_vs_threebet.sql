DROP VIEW IF EXISTS pop.v_population_fold_vs_threebet;

CREATE VIEW
    pop.v_population_fold_vs_threebet AS
SELECT
    COALESCE(fb.id_limit, cvt.id_limit) AS id_limit,
    ROUND(
        100.0 - COALESCE(fb.fourbet_lj_vs_threebet_hj, 0) - COALESCE(cvt.call_lj_vs_threebet_hj, 0),
        2
    ) AS fold_lj_vs_threebet_hj,
    ROUND(
        100.0 - COALESCE(fb.fourbet_lj_vs_threebet_co, 0) - COALESCE(cvt.call_lj_vs_threebet_co, 0),
        2
    ) AS fold_lj_vs_threebet_co,
    ROUND(
        100.0 - COALESCE(fb.fourbet_lj_vs_threebet_btn, 0) - COALESCE(cvt.call_lj_vs_threebet_btn, 0),
        2
    ) AS fold_lj_vs_threebet_btn,
    ROUND(
        100.0 - COALESCE(fb.fourbet_lj_vs_threebet_sb, 0) - COALESCE(cvt.call_lj_vs_threebet_sb, 0),
        2
    ) AS fold_lj_vs_threebet_sb,
    ROUND(
        100.0 - COALESCE(fb.fourbet_lj_vs_threebet_bb, 0) - COALESCE(cvt.call_lj_vs_threebet_bb, 0),
        2
    ) AS fold_lj_vs_threebet_bb,
    ROUND(
        100.0 - COALESCE(fb.fourbet_hj_vs_threebet_co, 0) - COALESCE(cvt.call_hj_vs_threebet_co, 0),
        2
    ) AS fold_hj_vs_threebet_co,
    ROUND(
        100.0 - COALESCE(fb.fourbet_hj_vs_threebet_btn, 0) - COALESCE(cvt.call_hj_vs_threebet_btn, 0),
        2
    ) AS fold_hj_vs_threebet_btn,
    ROUND(
        100.0 - COALESCE(fb.fourbet_hj_vs_threebet_sb, 0) - COALESCE(cvt.call_hj_vs_threebet_sb, 0),
        2
    ) AS fold_hj_vs_threebet_sb,
    ROUND(
        100.0 - COALESCE(fb.fourbet_hj_vs_threebet_bb, 0) - COALESCE(cvt.call_hj_vs_threebet_bb, 0),
        2
    ) AS fold_hj_vs_threebet_bb,
    ROUND(
        100.0 - COALESCE(fb.fourbet_co_vs_threebet_btn, 0) - COALESCE(cvt.call_co_vs_threebet_btn, 0),
        2
    ) AS fold_co_vs_threebet_btn,
    ROUND(
        100.0 - COALESCE(fb.fourbet_co_vs_threebet_sb, 0) - COALESCE(cvt.call_co_vs_threebet_sb, 0),
        2
    ) AS fold_co_vs_threebet_sb,
    ROUND(
        100.0 - COALESCE(fb.fourbet_co_vs_threebet_bb, 0) - COALESCE(cvt.call_co_vs_threebet_bb, 0),
        2
    ) AS fold_co_vs_threebet_bb,
    ROUND(
        100.0 - COALESCE(fb.fourbet_btn_vs_threebet_sb, 0) - COALESCE(cvt.call_btn_vs_threebet_sb, 0),
        2
    ) AS fold_btn_vs_threebet_sb,
    ROUND(
        100.0 - COALESCE(fb.fourbet_btn_vs_threebet_bb, 0) - COALESCE(cvt.call_btn_vs_threebet_bb, 0),
        2
    ) AS fold_btn_vs_threebet_bb,
    ROUND(
        100.0 - COALESCE(fb.fourbet_sb_vs_threebet_bb, 0) - COALESCE(cvt.call_sb_vs_threebet_bb, 0),
        2
    ) AS fold_sb_vs_threebet_bb
FROM
    pop.v_population_fourbet_vs_threebet fb
    FULL OUTER JOIN pop.v_population_call_vs_threebet cvt ON fb.id_limit = cvt.id_limit;