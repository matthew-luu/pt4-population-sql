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
    row_label AS fold_vs_threebet,
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
            NULL::numeric AS ep,
            NULL::numeric AS mp,
            NULL::numeric AS co,
            NULL::numeric AS btn,
            NULL::numeric AS sb,
            NULL::numeric AS bb
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
            6,
            'vs BB',
            fold_lj_vs_3bet_bb,
            fold_hj_vs_3bet_bb,
            fold_co_vs_3bet_bb,
            fold_btn_vs_3bet_bb,
            fold_sb_vs_3bet_bb,
            NULL        
        FROM
            base
    )
ORDER BY
    sort_order;