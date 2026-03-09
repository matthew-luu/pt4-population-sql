DROP VIEW IF EXISTS pop.v_population_fold_vs_fourbet;

CREATE VIEW
    pop.v_population_fold_vs_fourbet AS
SELECT
    COALESCE(fb.id_limit, cvt.id_limit) AS id_limit,
    ROUND(
        100.0 - COALESCE(fb.fivebet_hj_vs_fourbet_lj, 0) - COALESCE(cvt.call_hj_vs_fourbet_lj, 0),
        2
    ) AS fold_hj_vs_fourbet_lj,
    ROUND(
        100.0 - COALESCE(fb.fivebet_co_vs_fourbet_lj, 0) - COALESCE(cvt.call_co_vs_fourbet_lj, 0),
        2
    ) AS fold_co_vs_fourbet_lj,
    ROUND(
        100.0 - COALESCE(fb.fivebet_co_vs_fourbet_hj, 0) - COALESCE(cvt.call_co_vs_fourbet_hj, 0),
        2
    ) AS fold_co_vs_fourbet_hj,
    ROUND(
        100.0 - COALESCE(fb.fivebet_btn_vs_fourbet_lj, 0) - COALESCE(cvt.call_btn_vs_fourbet_lj, 0),
        2
    ) AS fold_btn_vs_fourbet_lj,
    ROUND(
        100.0 - COALESCE(fb.fivebet_btn_vs_fourbet_hj, 0) - COALESCE(cvt.call_btn_vs_fourbet_hj, 0),
        2
    ) AS fold_btn_vs_fourbet_hj,
    ROUND(
        100.0 - COALESCE(fb.fivebet_btn_vs_fourbet_co, 0) - COALESCE(cvt.call_btn_vs_fourbet_co, 0),
        2
    ) AS fold_btn_vs_fourbet_co,
    ROUND(
        100.0 - COALESCE(fb.fivebet_sb_vs_fourbet_lj, 0) - COALESCE(cvt.call_sb_vs_fourbet_lj, 0),
        2
    ) AS fold_sb_vs_fourbet_lj,
    ROUND(
        100.0 - COALESCE(fb.fivebet_sb_vs_fourbet_hj, 0) - COALESCE(cvt.call_sb_vs_fourbet_hj, 0),
        2
    ) AS fold_sb_vs_fourbet_hj,
    ROUND(
        100.0 - COALESCE(fb.fivebet_sb_vs_fourbet_co, 0) - COALESCE(cvt.call_sb_vs_fourbet_co, 0),
        2
    ) AS fold_sb_vs_fourbet_co,
    ROUND(
        100.0 - COALESCE(fb.fivebet_sb_vs_fourbet_btn, 0) - COALESCE(cvt.call_sb_vs_fourbet_btn, 0),
        2
    ) AS fold_sb_vs_fourbet_btn,
    ROUND(
        100.0 - COALESCE(fb.fivebet_bb_vs_fourbet_lj, 0) - COALESCE(cvt.call_bb_vs_fourbet_lj, 0),
        2
    ) AS fold_bb_vs_fourbet_lj,
    ROUND(
        100.0 - COALESCE(fb.fivebet_bb_vs_fourbet_hj, 0) - COALESCE(cvt.call_bb_vs_fourbet_hj, 0),
        2
    ) AS fold_bb_vs_fourbet_hj,
    ROUND(
        100.0 - COALESCE(fb.fivebet_bb_vs_fourbet_co, 0) - COALESCE(cvt.call_bb_vs_fourbet_co, 0),
        2
    ) AS fold_bb_vs_fourbet_co,
    ROUND(
        100.0 - COALESCE(fb.fivebet_bb_vs_fourbet_btn, 0) - COALESCE(cvt.call_bb_vs_fourbet_btn, 0),
        2
    ) AS fold_bb_vs_fourbet_btn,
    ROUND(
        100.0 - COALESCE(fb.fivebet_bb_vs_fourbet_sb, 0) - COALESCE(cvt.call_bb_vs_fourbet_sb, 0),
        2
    ) AS fold_bb_vs_fourbet_sb
FROM
    pop.v_population_fivebet_vs_fourbet fb
    FULL OUTER JOIN pop.v_population_call_vs_fourbet cvt ON fb.id_limit = cvt.id_limit; 