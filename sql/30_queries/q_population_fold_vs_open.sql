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
    ep,
    mp,
    co,
    btn,
    sb,
    bb
FROM
    (
        SELECT
            1 AS sort_order,
            'EP' AS row_label,
            NULL AS ep,
            fold_hj_vs_utg AS mp,
            fold_co_vs_utg AS co,
            fold_btn_vs_utg AS btn,
            fold_sb_vs_utg AS sb,
            fold_bb_vs_utg AS bb
        FROM
            base
        UNION ALL
        SELECT
            2,
            'MP',
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
            'CO',
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
            'BTN',
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
            'SB',
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