DROP MATERIALIZED VIEW IF EXISTS pop.mv_player_call_vs_threebet_counts;

CREATE MATERIALIZED VIEW pop.mv_player_call_vs_threebet_counts AS
SELECT
    s.id_player,
    s.position AS caller_pos,
    t.position AS threebettor_pos,
    hl.id_limit,
    COUNT(*) FILTER (
        WHERE
            s.flg_p_3bet_def_opp
    ) AS call_opp,
    COUNT(*) FILTER (
        WHERE
            s.enum_p_3bet_action like 'C%'
    ) AS call_vs_threebet
FROM
    cash_hand_player_statistics s
    JOIN cash_hand_player_statistics t ON t.id_hand = s.id_hand
    AND t.id_player <> s.id_player
    AND t.flg_p_3bet
    JOIN lookup_actions la ON la.id_action = s.id_action_p
    JOIN pop.v_hand_limits hl ON hl.id_hand = s.id_hand
WHERE
    s.id_player NOT IN (-1, 0, 1)
    AND s.flg_p_first_raise
GROUP BY
    s.id_player,
    s.position,
    t.position,
    hl.id_limit;