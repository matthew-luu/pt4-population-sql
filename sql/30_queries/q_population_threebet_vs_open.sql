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
    row_label AS "threebet_vs_open",
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
            threebet_hj_vs_lj AS hj,
            threebet_co_vs_lj AS co,
            threebet_btn_vs_lj AS btn,
            threebet_sb_vs_lj AS sb,
            threebet_bb_vs_lj AS bb
        FROM
            base
        UNION ALL
        SELECT
            2,
            'vs HJ',
            NULL,
            NULL,
            threebet_co_vs_hj,
            threebet_btn_vs_hj,
            threebet_sb_vs_hj,
            threebet_bb_vs_hj
        FROM
            base
        UNION ALL
        SELECT
            3,
            'vs CO',
            NULL,
            NULL,
            NULL,
            threebet_btn_vs_co,
            threebet_sb_vs_co,
            threebet_bb_vs_co
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
            threebet_sb_vs_btn,
            threebet_bb_vs_btn
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
            threebet_bb_vs_sb
        FROM
            base
    ) x
ORDER BY
    sort_order;