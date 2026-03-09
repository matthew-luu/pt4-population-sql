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
    row_label AS call_vs_open,
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
            call_hj_vs_lj AS hj,
            call_co_vs_lj AS co,
            call_btn_vs_lj AS btn,
            call_sb_vs_lj AS sb,
            call_bb_vs_lj AS bb
        FROM
            base
        UNION ALL
        SELECT
            2,
            'vs HJ',
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
            'vs CO',
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
            'vs BTN',
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
            'vs SB',
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