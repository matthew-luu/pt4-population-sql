DROP VIEW IF EXISTS pop.v_player_call_vs_open;

CREATE VIEW
  pop.v_player_call_vs_open AS
SELECT
  id_player,
  id_limit,
  /* ---------- Defender HJ (2) ---------- */
  ROUND(
    100.0 * SUM(call_vs_open) FILTER (
      WHERE
        defender_pos = 2
        AND opener_pos = 3
    ) / NULLIF(
      SUM(def_opp) FILTER (
        WHERE
          defender_pos = 2
          AND opener_pos = 3
      ),
      0
    ),
    2
  ) AS call_hj_vs_utg,
  /* ---------- Defender CO (1) ---------- */
  ROUND(
    100.0 * SUM(call_vs_open) FILTER (
      WHERE
        defender_pos = 1
        AND opener_pos = 3
    ) / NULLIF(
      SUM(def_opp) FILTER (
        WHERE
          defender_pos = 1
          AND opener_pos = 3
      ),
      0
    ),
    2
  ) AS call_co_vs_utg,
  ROUND(
    100.0 * SUM(call_vs_open) FILTER (
      WHERE
        defender_pos = 1
        AND opener_pos = 2
    ) / NULLIF(
      SUM(def_opp) FILTER (
        WHERE
          defender_pos = 1
          AND opener_pos = 2
      ),
      0
    ),
    2
  ) AS call_co_vs_hj,
  /* ---------- Defender BTN (0) ---------- */
  ROUND(
    100.0 * SUM(call_vs_open) FILTER (
      WHERE
        defender_pos = 0
        AND opener_pos = 3
    ) / NULLIF(
      SUM(def_opp) FILTER (
        WHERE
          defender_pos = 0
          AND opener_pos = 3
      ),
      0
    ),
    2
  ) AS call_btn_vs_utg,
  ROUND(
    100.0 * SUM(call_vs_open) FILTER (
      WHERE
        defender_pos = 0
        AND opener_pos = 2
    ) / NULLIF(
      SUM(def_opp) FILTER (
        WHERE
          defender_pos = 0
          AND opener_pos = 2
      ),
      0
    ),
    2
  ) AS call_btn_vs_hj,
  ROUND(
    100.0 * SUM(call_vs_open) FILTER (
      WHERE
        defender_pos = 0
        AND opener_pos = 1
    ) / NULLIF(
      SUM(def_opp) FILTER (
        WHERE
          defender_pos = 0
          AND opener_pos = 1
      ),
      0
    ),
    2
  ) AS call_btn_vs_co,
  /* ---------- Defender SB (9) ---------- */
  ROUND(
    100.0 * SUM(call_vs_open) FILTER (
      WHERE
        defender_pos = 9
        AND opener_pos = 3
    ) / NULLIF(
      SUM(def_opp) FILTER (
        WHERE
          defender_pos = 9
          AND opener_pos = 3
      ),
      0
    ),
    2
  ) AS call_sb_vs_utg,
  ROUND(
    100.0 * SUM(call_vs_open) FILTER (
      WHERE
        defender_pos = 9
        AND opener_pos = 2
    ) / NULLIF(
      SUM(def_opp) FILTER (
        WHERE
          defender_pos = 9
          AND opener_pos = 2
      ),
      0
    ),
    2
  ) AS call_sb_vs_hj,
  ROUND(
    100.0 * SUM(call_vs_open) FILTER (
      WHERE
        defender_pos = 9
        AND opener_pos = 1
    ) / NULLIF(
      SUM(def_opp) FILTER (
        WHERE
          defender_pos = 9
          AND opener_pos = 1
      ),
      0
    ),
    2
  ) AS call_sb_vs_co,
  ROUND(
    100.0 * SUM(call_vs_open) FILTER (
      WHERE
        defender_pos = 9
        AND opener_pos = 0
    ) / NULLIF(
      SUM(def_opp) FILTER (
        WHERE
          defender_pos = 9
          AND opener_pos = 0
      ),
      0
    ),
    2
  ) AS call_sb_vs_btn,
  /* ---------- Defender BB (8) ---------- */
  ROUND(
    100.0 * SUM(call_vs_open) FILTER (
      WHERE
        defender_pos = 8
        AND opener_pos = 3
    ) / NULLIF(
      SUM(def_opp) FILTER (
        WHERE
          defender_pos = 8
          AND opener_pos = 3
      ),
      0
    ),
    2
  ) AS call_bb_vs_utg,
  ROUND(
    100.0 * SUM(call_vs_open) FILTER (
      WHERE
        defender_pos = 8
        AND opener_pos = 2
    ) / NULLIF(
      SUM(def_opp) FILTER (
        WHERE
          defender_pos = 8
          AND opener_pos = 2
      ),
      0
    ),
    2
  ) AS call_bb_vs_hj,
  ROUND(
    100.0 * SUM(call_vs_open) FILTER (
      WHERE
        defender_pos = 8
        AND opener_pos = 1
    ) / NULLIF(
      SUM(def_opp) FILTER (
        WHERE
          defender_pos = 8
          AND opener_pos = 1
      ),
      0
    ),
    2
  ) AS call_bb_vs_co,
  ROUND(
    100.0 * SUM(call_vs_open) FILTER (
      WHERE
        defender_pos = 8
        AND opener_pos = 0
    ) / NULLIF(
      SUM(def_opp) FILTER (
        WHERE
          defender_pos = 8
          AND opener_pos = 0
      ),
      0
    ),
    2
  ) AS call_bb_vs_btn,
  ROUND(
    100.0 * SUM(call_vs_open) FILTER (
      WHERE
        defender_pos = 8
        AND opener_pos = 9
    ) / NULLIF(
      SUM(def_opp) FILTER (
        WHERE
          defender_pos = 8
          AND opener_pos = 9
      ),
      0
    ),
    2
  ) AS call_bb_vs_sb
FROM
  pop.mv_player_call_vs_open_counts
GROUP BY
  id_player,
  id_limit;