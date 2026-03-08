WITH vars AS (
    SELECT 
        0 AS open_pos,     -- opener position code (6-max: BTN=0 CO=1 HJ=2 lj/EP=3 SB=9 BB=8)
        8 AS call_pos,     -- caller position code
        1 AS hero_id       -- id_player to measure
)
SELECT
    SUM(
        CASE
            WHEN la.action LIKE 'C%'
                 AND hs.str_aggressors_p LIKE ('8' || vars.open_pos || '%')
                 AND ps.position = vars.call_pos
                 AND ps.amt_p_2bet_facing > 0
            THEN 1 ELSE 0
        END
    ) AS call_count,

    SUM(
        CASE
            WHEN hs.str_aggressors_p LIKE ('8' || vars.open_pos || '%')
                 AND ps.position = vars.call_pos
                 AND ps.amt_p_2bet_facing > 0
            THEN 1 ELSE 0
        END
    ) AS opportunities,

    SUM(
        CASE
            WHEN la.action LIKE 'C%'
                 AND hs.str_aggressors_p LIKE ('8' || vars.open_pos || '%')
                 AND ps.position = vars.call_pos
                 AND ps.amt_p_2bet_facing > 0
            THEN 1 ELSE 0
        END
    )::float
    /
    NULLIF(
        SUM(
            CASE
                WHEN hs.str_aggressors_p LIKE ('8' || vars.open_pos || '%')
                     AND ps.position = vars.call_pos
                     AND ps.amt_p_2bet_facing > 0
                THEN 1 ELSE 0
            END
        ),
        0
    ) * 100 AS call_vs_open_pct
FROM cash_hand_player_statistics ps
JOIN cash_hand_summary hs
    ON hs.id_hand = ps.id_hand
JOIN lookup_actions la
    ON la.id_action = ps.id_action_p
CROSS JOIN vars
WHERE ps.id_player = vars.hero_id;