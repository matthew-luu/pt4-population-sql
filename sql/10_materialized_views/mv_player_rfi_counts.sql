DROP MATERIALIZED VIEW IF EXISTS pop.mv_player_rfi_counts;

CREATE MATERIALIZED VIEW pop.mv_player_rfi_counts AS
SELECT
  p.id_player,
  p.player_name,
  s.position AS pos,
  hl.id_limit,
  COUNT(*) FILTER (
    WHERE
      s.flg_p_open_opp
  ) AS open_opp,
  COUNT(*) FILTER (
    WHERE
      s.flg_p_open_opp
      AND s.flg_p_first_raise
  ) AS rfi,
  COUNT(*) AS hands_in_pos
FROM
  player p
  JOIN cash_hand_player_statistics s ON s.id_player = p.id_player
  JOIN pop.v_hand_limits hl ON hl.id_hand = s.id_hand
WHERE
  p.id_player NOT IN (-1, 0, 1)
GROUP BY
  p.id_player,
  p.player_name,
  s.position,
  hl.id_limit;