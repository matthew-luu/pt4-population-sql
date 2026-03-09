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
    row_label AS "fivebet_vs_fourbet",
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
            'MP' AS row_label,
            fivebet_hj_vs_fourbet_lj AS ep,
            NULL AS mp,
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
            fivebet_co_vs_fourbet_lj,
            fivebet_co_vs_fourbet_hj,
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
            fivebet_btn_vs_fourbet_lj,
            fivebet_btn_vs_fourbet_hj,
            fivebet_btn_vs_fourbet_co,
            NULL,
            NULL,
            NULL
        FROM
            base
        UNION ALL
        SELECT
            4,
            'SB',
            fivebet_sb_vs_fourbet_lj,
            fivebet_sb_vs_fourbet_hj,
            fivebet_sb_vs_fourbet_co,
            fivebet_sb_vs_fourbet_btn,
            NULL,
            NULL
        FROM
            base
        UNION ALL
        SELECT
            5,
            'BB',
            fivebet_bb_vs_fourbet_lj,
            fivebet_bb_vs_fourbet_hj,
            fivebet_bb_vs_fourbet_co,
            fivebet_bb_vs_fourbet_btn,
            fivebet_bb_vs_fourbet_sb,
            NULL
        FROM
            base
    ) x
ORDER BY
    sort_order;