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
    row_label AS vs_open,
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
            call_hj_vs_utg AS mp,
            call_co_vs_utg AS co,
            call_btn_vs_utg AS btn,
            call_sb_vs_utg AS sb,
            call_bb_vs_utg AS bb
        FROM
            base
        UNION ALL
        SELECT
            2,
            'MP',
            NULL,
            NULL,
            call_co_vs_hj,
            call_btn_vs_hj,
            call_sb_vs_hj,
            call_bb_vs_hj
        FROM
            base
        UNION ALL
        SELECT
            3,
            'CO',
            NULL,
            NULL,
            NULL,
            call_btn_vs_co,
            call_sb_vs_co,
            call_bb_vs_co
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
            call_sb_vs_btn,
            call_bb_vs_btn
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
            call_bb_vs_sb
        FROM
            base
    ) x
ORDER BY
    sort_order;