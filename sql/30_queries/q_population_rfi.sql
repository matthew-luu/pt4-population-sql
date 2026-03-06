WITH
    vars AS (
        SELECT
            2 AS id_limit
    )
SELECT
    p.rfi_utg AS ep,
    p.rfi_hj AS mp,
    p.rfi_co AS co,
    p.rfi_btn AS btn,
    p.rfi_sb AS sb
FROM
    pop.v_population_preflop p
    CROSS JOIN vars
WHERE
    p.id_limit = vars.id_limit;