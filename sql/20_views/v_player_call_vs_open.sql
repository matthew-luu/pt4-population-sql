DROP VIEW IF EXISTS pop.v_player_call_vs_open;

CREATE VIEW
  pop.v_player_call_vs_open AS
SELECT
  id_player,
  id_limit,
  /* ---------- Defender HJ (2) ---------- */
  ROUND(
    100.0 * SUM(call_cnt) FILTER (
      WHERE
        defend_pos = 2
        AND open_pos = 3
    ) / NULLIF(
      SUM(def_opp) FILTER (
        WHERE
          defend_pos = 2
          AND open_pos = 3
      ),
      0
    ),
    2
  ) AS call_hj_vs_lj,
  /* ---------- Defender CO (1) ---------- */
  ROUND(
    100.0 * SUM(call_cnt) FILTER (
      WHERE
        defend_pos = 1
        AND open_pos = 3
    ) / NULLIF(
      SUM(def_opp) FILTER (
        WHERE
          defend_pos = 1
          AND open_pos = 3
      ),
      0
    ),
    2
  ) AS call_co_vs_lj,
  ROUND(
    100.0 * SUM(call_cnt) FILTER (
      WHERE
        defend_pos = 1
        AND open_pos = 2
    ) / NULLIF(
      SUM(def_opp) FILTER (
        WHERE
          defend_pos = 1
          AND open_pos = 2
      ),
      0
    ),
    2
  ) AS call_co_vs_hj,
  /* ---------- Defender BTN (0) ---------- */
  ROUND(
    100.0 * SUM(call_cnt) FILTER (
      WHERE
        defend_pos = 0
        AND open_pos = 3
    ) / NULLIF(
      SUM(def_opp) FILTER (
        WHERE
          defend_pos = 0
          AND open_pos = 3
      ),
      0
    ),
    2
  ) AS call_btn_vs_lj,
  ROUND(
    100.0 * SUM(call_cnt) FILTER (
      WHERE
        defend_pos = 0
        AND open_pos = 2
    ) / NULLIF(
      SUM(def_opp) FILTER (
        WHERE
          defend_pos = 0
          AND open_pos = 2
      ),
      0
    ),
    2
  ) AS call_btn_vs_hj,
  ROUND(
    100.0 * SUM(call_cnt) FILTER (
      WHERE
        defend_pos = 0
        AND open_pos = 1
    ) / NULLIF(
      SUM(def_opp) FILTER (
        WHERE
          defend_pos = 0
          AND open_pos = 1
      ),
      0
    ),
    2
  ) AS call_btn_vs_co,
  /* ---------- Defender SB (9) ---------- */
  ROUND(
    100.0 * SUM(call_cnt) FILTER (
      WHERE
        defend_pos = 9
        AND open_pos = 3
    ) / NULLIF(
      SUM(def_opp) FILTER (
        WHERE
          defend_pos = 9
          AND open_pos = 3
      ),
      0
    ),
    2
  ) AS call_sb_vs_lj,
  ROUND(
    100.0 * SUM(call_cnt) FILTER (
      WHERE
        defend_pos = 9
        AND open_pos = 2
    ) / NULLIF(
      SUM(def_opp) FILTER (
        WHERE
          defend_pos = 9
          AND open_pos = 2
      ),
      0
    ),
    2
  ) AS call_sb_vs_hj,
  ROUND(
    100.0 * SUM(call_cnt) FILTER (
      WHERE
        defend_pos = 9
        AND open_pos = 1
    ) / NULLIF(
      SUM(def_opp) FILTER (
        WHERE
          defend_pos = 9
          AND open_pos = 1
      ),
      0
    ),
    2
  ) AS call_sb_vs_co,
  ROUND(
    100.0 * SUM(call_cnt) FILTER (
      WHERE
        defend_pos = 9
        AND open_pos = 0
    ) / NULLIF(
      SUM(def_opp) FILTER (
        WHERE
          defend_pos = 9
          AND open_pos = 0
      ),
      0
    ),
    2
  ) AS call_sb_vs_btn,
  /* ---------- Defender BB (8) ---------- */
  ROUND(
    100.0 * SUM(call_cnt) FILTER (
      WHERE
        defend_pos = 8
        AND open_pos = 3
    ) / NULLIF(
      SUM(def_opp) FILTER (
        WHERE
          defend_pos = 8
          AND open_pos = 3
      ),
      0
    ),
    2
  ) AS call_bb_vs_lj,
  ROUND(
    100.0 * SUM(call_cnt) FILTER (
      WHERE
        defend_pos = 8
        AND open_pos = 2
    ) / NULLIF(
      SUM(def_opp) FILTER (
        WHERE
          defend_pos = 8
          AND open_pos = 2
      ),
      0
    ),
    2
  ) AS call_bb_vs_hj,
  ROUND(
    100.0 * SUM(call_cnt) FILTER (
      WHERE
        defend_pos = 8
        AND open_pos = 1
    ) / NULLIF(
      SUM(def_opp) FILTER (
        WHERE
          defend_pos = 8
          AND open_pos = 1
      ),
      0
    ),
    2
  ) AS call_bb_vs_co,
  ROUND(
    100.0 * SUM(call_cnt) FILTER (
      WHERE
        defend_pos = 8
        AND open_pos = 0
    ) / NULLIF(
      SUM(def_opp) FILTER (
        WHERE
          defend_pos = 8
          AND open_pos = 0
      ),
      0
    ),
    2
  ) AS call_bb_vs_btn,
  ROUND(
    100.0 * SUM(call_cnt) FILTER (
      WHERE
        defend_pos = 8
        AND open_pos = 9
    ) / NULLIF(
      SUM(def_opp) FILTER (
        WHERE
          defend_pos = 8
          AND open_pos = 9
      ),
      0
    ),
    2
  ) AS call_bb_vs_sb
FROM
  pop.mv_player_response_vs_open_counts
GROUP BY
  id_player,
  id_limit;