DROP MATERIALIZED VIEW IF EXISTS pop.mv_player_3bet_counts;

CREATE MATERIALIZED VIEW pop.mv_player_3bet_counts AS
SELECT
  s.id_player,
  s.position AS threebettor_pos,
  o.position AS opener_pos,
  hl.id_limit,
  COUNT(*) FILTER (
    WHERE
      s.flg_p_3bet_opp
  ) AS threebet_opp,
  COUNT(*) FILTER (
    WHERE
      s.flg_p_3bet
      AND s.flg_p_3bet_opp
  ) AS threebet_cnt
FROM
  cash_hand_player_statistics s
  -- opener row in same hand
  JOIN cash_hand_player_statistics o ON o.id_hand = s.id_hand
  AND o.flg_p_open_opp
  AND o.flg_p_first_raise
  JOIN pop.v_hand_limits hl ON hl.id_hand = s.id_hand
WHERE
  s.id_player NOT IN (-1, 0, 1)
  AND s.id_player <> o.id_player
GROUP BY
  s.id_player,
  s.position,
  o.position,
  hl.id_limit;