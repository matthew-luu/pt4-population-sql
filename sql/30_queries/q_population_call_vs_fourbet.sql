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
    row_label AS "call_vs_fourbet",
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
            call_hj_vs_fourbet_lj AS ep,
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
            call_co_vs_fourbet_lj,
            call_co_vs_fourbet_hj,
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
            call_btn_vs_fourbet_lj,
            call_btn_vs_fourbet_hj,
            call_btn_vs_fourbet_co,
            NULL,
            NULL,
            NULL
        FROM
            base
        UNION ALL
        SELECT
            4,
            'SB',
            call_sb_vs_fourbet_lj,
            call_sb_vs_fourbet_hj,
            call_sb_vs_fourbet_co,
            call_sb_vs_fourbet_btn,
            NULL,
            NULL
        FROM
            base
        UNION ALL
        SELECT
            5,
            'BB',
            call_bb_vs_fourbet_lj,
            call_bb_vs_fourbet_hj,
            call_bb_vs_fourbet_co,
            call_bb_vs_fourbet_btn,
            call_bb_vs_fourbet_sb,
            NULL
        FROM
            base
    ) x
ORDER BY
    sort_order;