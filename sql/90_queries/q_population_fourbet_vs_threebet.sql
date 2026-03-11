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
    row_label AS fourbet_vs_threebet,
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
            NULL::numeric AS lj,
            NULL::numeric AS hj,
            NULL::numeric AS co,
            NULL::numeric AS btn,
            NULL::numeric AS sb,
            NULL::numeric AS bb
        FROM
            base
        UNION ALL
        SELECT
            2,
            'vs HJ',
            fourbet_lj_vs_hj,
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
            fourbet_lj_vs_co,
            fourbet_hj_vs_co,
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
            fourbet_lj_vs_btn,
            fourbet_hj_vs_btn,
            fourbet_co_vs_btn,
            NULL,
            NULL,
            NULL
        FROM
            base
        UNION ALL
        SELECT
            5,
            'vs SB',
            fourbet_lj_vs_sb,
            fourbet_hj_vs_sb,
            fourbet_co_vs_sb,
            fourbet_btn_vs_sb,
            NULL,
            NULL
        FROM
            base
        UNION ALL
        SELECT
            6,
            'vs BB',
            fourbet_lj_vs_bb,
            fourbet_hj_vs_bb,
            fourbet_co_vs_bb,
            fourbet_btn_vs_bb,
            fourbet_sb_vs_bb,
            null
        FROM
            base
    )
ORDER BY
    sort_order;