DROP MATERIALIZED VIEW IF EXISTS pop.mv_player_response_vs_fourbet_counts;

CREATE MATERIALIZED VIEW pop.mv_player_response_vs_fourbet_counts AS
SELECT
    s.id_player,
    s.position AS defender_pos,
    f.position AS fourbettor_pos,
    hl.id_limit,

    COUNT(*) FILTER (
        WHERE
            s.flg_p_4bet_def_opp
    ) AS fivebet_opp,

    COUNT(*) FILTER (
        WHERE
            s.enum_p_4bet_action = 'C'
    ) AS call_vs_fourbet,

    COUNT(*) FILTER (
        WHERE
            char_length(hs.str_aggressors_p) >= 4
            AND substring(hs.str_aggressors_p from 4 for 1)::int <> s.position
            AND s.flg_p_4bet
    ) AS fivebet_cnt

FROM cash_hand_player_statistics s
JOIN cash_hand_player_statistics f
    ON f.id_hand = s.id_hand
   AND f.id_player <> s.id_player
   AND f.flg_p_4bet
JOIN cash_hand_summary hs
    ON hs.id_hand = s.id_hand
JOIN pop.v_hand_limits hl
    ON hl.id_hand = s.id_hand
WHERE
    s.id_player NOT IN (-1, 0, 1)
GROUP BY
    s.id_player,
    s.position,
    f.position,
    hl.id_limit;