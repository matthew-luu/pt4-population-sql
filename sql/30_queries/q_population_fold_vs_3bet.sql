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
    row_label AS fold_vs_3bet,
    EP,
    MP,
    CO,
    BTN,
    SB,
    BB
FROM
    (
        SELECT
            1 AS sort_order,
            'vs EP' AS row_label,
            NULL AS EP,
            NULL AS MP,
            NULL AS CO,
            NULL AS BTN,
            NULL AS SB,
            NULL AS BB
        FROM
            base
        UNION ALL
        SELECT
            2,
            'vs MP',
            fold_lj_vs_3bet_hj,
            NULL,
            NULL,
            NULL,
            NULL,
            NULL
        FROM
            base
        UNION ALL
        SELECT
            3,
            'vs CO',
            fold_lj_vs_3bet_co,
            fold_hj_vs_3bet_co,
            NULL,
            NULL,
            NULL,
            NULL
        FROM
            base
        UNION ALL
        SELECT
            4,
            'vs BTN',
            fold_lj_vs_3bet_btn,
            fold_hj_vs_3bet_btn,
            fold_co_vs_3bet_btn,
            NULL,
            NULL,
            NULL
        FROM
            base
        UNION ALL
        SELECT
            5,
            'vs SB',
            fold_lj_vs_3bet_sb,
            fold_hj_vs_3bet_sb,
            fold_co_vs_3bet_sb,
            fold_btn_vs_3bet_sb,
            NULL,
            NULL
        FROM
            base
        UNION ALL
        SELECT
            5,
            'vs BB',
            fold_lj_vs_3bet_bb,
            fold_hj_vs_3bet_bb,
            fold_co_vs_3bet_bb,
            fold_btn_vs_3bet_bb,
            fold_sb_vs_3bet_bb,
            null
        FROM
            base
    ) x
ORDER BY
    sort_order;