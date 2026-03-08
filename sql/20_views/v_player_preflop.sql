DROP VIEW IF EXISTS pop.v_player_preflop;

CREATE VIEW
  pop.v_player_preflop AS
SELECT
  r.id_player,
  r.player_name,
  r.id_limit,
  r.hands,
  r.rfi_lj,
  r.rfi_hj,
  r.rfi_co,
  r.rfi_btn,
  r.rfi_sb,
  -- Call vs open (matrix)
  c.call_hj_vs_lj,
  c.call_co_vs_lj,
  c.call_co_vs_hj,
  c.call_btn_vs_lj,
  c.call_btn_vs_hj,
  c.call_btn_vs_co,
  c.call_sb_vs_lj,
  c.call_sb_vs_hj,
  c.call_sb_vs_co,
  c.call_sb_vs_btn,
  c.call_bb_vs_lj,
  c.call_bb_vs_hj,
  c.call_bb_vs_co,
  c.call_bb_vs_btn,
  c.call_bb_vs_sb,
  -- 3bet vs open (matrix)
  t.threebet_hj_vs_lj,
  t.threebet_co_vs_lj,
  t.threebet_co_vs_hj,
  t.threebet_btn_vs_lj,
  t.threebet_btn_vs_hj,
  t.threebet_btn_vs_co,
  t.threebet_sb_vs_lj,
  t.threebet_sb_vs_hj,
  t.threebet_sb_vs_co,
  t.threebet_sb_vs_btn,
  t.threebet_bb_vs_lj,
  t.threebet_bb_vs_hj,
  t.threebet_bb_vs_co,
  t.threebet_bb_vs_btn,
  t.threebet_bb_vs_sb
FROM
  pop.v_player_rfi r
  LEFT JOIN pop.v_player_call_vs_open c ON c.id_player = r.id_player
  AND c.id_limit = r.id_limit
  LEFT JOIN pop.v_player_threebet_vs_open t ON t.id_player = r.id_player
  AND t.id_limit = r.id_limit;