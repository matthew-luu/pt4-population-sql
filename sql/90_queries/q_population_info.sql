WITH
    vars AS (
        SELECT
            2 AS id_limit
    )
SELECT
    p.id_limit,
    p.limit_name,
    p.amt_sb,
    p.amt_bb,
    p.player_count,
    p.total_hands
FROM
    pop.v_population_preflop p
    CROSS JOIN vars
WHERE
    p.id_limit = vars.id_limit;