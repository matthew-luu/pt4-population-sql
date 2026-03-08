DROP VIEW IF EXISTS pop.v_population_rfi;

CREATE VIEW
    pop.v_population_rfi AS
SELECT
    cl.id_limit,
    cl.limit_name,
    cl.amt_sb,
    cl.amt_bb,
    COUNT(DISTINCT r.id_player) AS player_count,
    SUM(r.hands_in_pos) AS total_hands,
    ROUND(
        100.0 * SUM(r.rfi) FILTER (
            WHERE
                r.pos = 3
        ) / NULLIF(
            SUM(r.open_opp) FILTER (
                WHERE
                    r.pos = 3
            ),
            0
        ),
        2
    ) AS rfi_lj,
    ROUND(
        100.0 * SUM(r.rfi) FILTER (
            WHERE
                r.pos = 2
        ) / NULLIF(
            SUM(r.open_opp) FILTER (
                WHERE
                    r.pos = 2
            ),
            0
        ),
        2
    ) AS rfi_hj,
    ROUND(
        100.0 * SUM(r.rfi) FILTER (
            WHERE
                r.pos = 1
        ) / NULLIF(
            SUM(r.open_opp) FILTER (
                WHERE
                    r.pos = 1
            ),
            0
        ),
        2
    ) AS rfi_co,
    ROUND(
        100.0 * SUM(r.rfi) FILTER (
            WHERE
                r.pos = 0
        ) / NULLIF(
            SUM(r.open_opp) FILTER (
                WHERE
                    r.pos = 0
            ),
            0
        ),
        2
    ) AS rfi_btn,
    ROUND(
        100.0 * SUM(r.rfi) FILTER (
            WHERE
                r.pos = 9
        ) / NULLIF(
            SUM(r.open_opp) FILTER (
                WHERE
                    r.pos = 9
            ),
            0
        ),
        2
    ) AS rfi_sb
FROM
    pop.mv_player_rfi_counts r
    JOIN public.cash_limit cl ON cl.id_limit = r.id_limit
GROUP BY
    cl.id_limit,
    cl.limit_name,
    cl.amt_sb,
    cl.amt_bb