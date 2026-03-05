DROP MATERIALIZED VIEW IF EXISTS pop.mv_pop_2bet_def_counts;

CREATE MATERIALIZED VIEW pop.mv_pop_2bet_def_counts AS
SELECT
  s.id_player,
  s.position AS defender_pos,
  o.position AS opener_pos,
  COUNT(*) FILTER (
    WHERE
      s.amt_p_2bet_facing > 0
  ) AS def_opp,
  COUNT(*) FILTER (
    WHERE
      s.amt_p_2bet_facing > 0
      AND la.action LIKE 'C%'
  ) AS call_vs_open
FROM
  cash_hand_player_statistics s
  -- opener row in same hand
  JOIN cash_hand_player_statistics o ON o.id_hand = s.id_hand
  AND o.flg_p_open_opp
  AND o.flg_p_first_raise
  JOIN lookup_actions la ON la.id_action = s.id_action_p
WHERE
  s.id_player NOT IN (-1, 0, 1)
  AND s.id_player <> o.id_player
GROUP BY
  s.id_player,
  s.position,
  o.position;