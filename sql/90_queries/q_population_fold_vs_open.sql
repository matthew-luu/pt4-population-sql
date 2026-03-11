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
    row_label AS fold_vs_open,
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
            'vs LJ' AS row_label,
            NULL AS lj,
            fold_hj_vs_lj AS hj,
            fold_co_vs_lj AS co,
            fold_btn_vs_lj AS btn,
            fold_sb_vs_lj AS sb,
            fold_bb_vs_lj AS bb
        FROM
            base
        UNION ALL
        SELECT
            2,
            'vs HJ',
            NULL,
            NULL,
            fold_co_vs_hj,
            fold_btn_vs_hj,
            fold_sb_vs_hj,
            fold_bb_vs_hj
        FROM
            base
        UNION ALL
        SELECT
            3,
            'vs CO',
            NULL,
            NULL,
            NULL,
            fold_btn_vs_co,
            fold_sb_vs_co,
            fold_bb_vs_co
        FROM
            base
        UNION ALL
        SELECT
            4,
            'vs BTN',
            NULL,
            NULL,
            NULL,
            NULL,
            fold_sb_vs_btn,
            fold_bb_vs_btn
        FROM
            base
        UNION ALL
        SELECT
            5,
            'vs SB',
            NULL,
            NULL,
            NULL,
            NULL,
            NULL,
            fold_bb_vs_sb
        FROM
            base
    ) x
ORDER BY
    sort_order;