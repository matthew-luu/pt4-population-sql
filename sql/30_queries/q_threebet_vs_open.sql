WITH vars AS (
    SELECT 
        0 AS open_pos,      -- BTN
        9 AS threebet_pos   -- SB
)

SELECT 
    SUM(
        CASE 
            WHEN ps.flg_p_3bet = TRUE
                 AND hs.str_aggressors_p LIKE ('8' || vars.open_pos || '%')
                 AND ps.position = vars.threebet_pos
                 AND ps.amt_p_2bet_facing > 0
            THEN 1 ELSE 0
        END
    ) AS threebet_count,

    SUM(
        CASE 
            WHEN hs.str_aggressors_p LIKE ('8' || vars.open_pos || '%')
                 AND ps.position = vars.threebet_pos
                 AND ps.amt_p_2bet_facing > 0
            THEN 1 ELSE 0
        END
    ) AS opportunities,

    SUM(
        CASE 
            WHEN ps.flg_p_3bet = TRUE
                 AND hs.str_aggressors_p LIKE ('8' || vars.open_pos || '%')
                 AND ps.position = vars.threebet_pos
                 AND ps.amt_p_2bet_facing > 0
            THEN 1 ELSE 0
        END
    )::float
    /
    NULLIF(
        SUM(
            CASE 
                WHEN hs.str_aggressors_p LIKE ('8' || vars.open_pos || '%')
                     AND ps.position = vars.threebet_pos
                     AND ps.amt_p_2bet_facing > 0
                THEN 1 ELSE 0
            END
        ), 0
    ) * 100
    AS threebet_percentage

FROM cash_hand_player_statistics ps
JOIN cash_hand_summary hs
    ON ps.id_hand = hs.id_hand
CROSS JOIN vars

WHERE ps.id_player = 1;