WITH
    vars AS (
        SELECT
            2 AS id_limit
    )
SELECT
    p.rfi_lj AS LJ,
    p.rfi_hj AS HJ,
    p.rfi_co AS CO,
    p.rfi_btn AS BTN,
    p.rfi_sb AS SB
FROM
    pop.v_population_preflop p
    CROSS JOIN vars
WHERE
    p.id_limit = vars.id_limit;