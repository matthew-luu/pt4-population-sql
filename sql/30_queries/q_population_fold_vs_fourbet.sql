WITH
    vars AS (
        SELECT
            2 AS id_limit
    ),
    base AS (
        SELECT
            *
        FROM
            pop.v_population_preflop p
            JOIN vars v ON p.id_limit = v.id_limit
    )
SELECT
    row_label AS "fold_vs_fourbet",
    LJ,
    HJ,
    CO,
    BTN,
    SB,
    BB
FROM
    (
        SELECT
            1 AS sort_order,
            'HJ' AS row_label,
            fold_hj_vs_fourbet_lj AS lj,
            NULL AS hj,
            NULL AS co,
            NULL AS btn,
            NULL AS sb,
            NULL AS bb
        FROM
            base
        UNION ALL
        SELECT
            2,
            'CO',
            fold_co_vs_fourbet_lj,
            fold_co_vs_fourbet_hj,
            NULL,
            NULL,
            NULL,
            NULL
        FROM
            base
        UNION ALL
        SELECT
            3,
            'BTN',
            fold_btn_vs_fourbet_lj,
            fold_btn_vs_fourbet_hj,
            fold_btn_vs_fourbet_co,
            NULL,
            NULL,
            NULL
        FROM
            base
        UNION ALL
        SELECT
            4,
            'SB',
            fold_sb_vs_fourbet_lj,
            fold_sb_vs_fourbet_hj,
            fold_sb_vs_fourbet_co,
            fold_sb_vs_fourbet_btn,
            NULL,
            NULL
        FROM
            base
        UNION ALL
        SELECT
            5,
            'BB',
            fold_bb_vs_fourbet_lj,
            fold_bb_vs_fourbet_hj,
            fold_bb_vs_fourbet_co,
            fold_bb_vs_fourbet_btn,
            fold_bb_vs_fourbet_sb,
            NULL
        FROM
            base
    ) x
ORDER BY
    sort_order;