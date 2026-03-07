DROP VIEW IF EXISTS pop.v_player_3bet_vs_open;

CREATE VIEW
  pop.v_player_3bet_vs_open AS
SELECT
  id_player,
  id_limit,
  /* ---------- Threebettor HJ (2) ---------- */
  ROUND(
    100.0 * SUM(threebet_cnt) FILTER (
      WHERE
        threebettor_pos = 2
        AND opener_pos = 3
    ) / NULLIF(
      SUM(threebet_opp) FILTER (
        WHERE
          threebettor_pos = 2
          AND opener_pos = 3
      ),
      0
    ),
    2
  ) AS threebet_hj_vs_utg,
  /* ---------- Threebettor CO (1) ---------- */
  ROUND(
    100.0 * SUM(threebet_cnt) FILTER (
      WHERE
        threebettor_pos = 1
        AND opener_pos = 3
    ) / NULLIF(
      SUM(threebet_opp) FILTER (
        WHERE
          threebettor_pos = 1
          AND opener_pos = 3
      ),
      0
    ),
    2
  ) AS threebet_co_vs_utg,
  ROUND(
    100.0 * SUM(threebet_cnt) FILTER (
      WHERE
        threebettor_pos = 1
        AND opener_pos = 2
    ) / NULLIF(
      SUM(threebet_opp) FILTER (
        WHERE
          threebettor_pos = 1
          AND opener_pos = 2
      ),
      0
    ),
    2
  ) AS threebet_co_vs_hj,
  /* ---------- Threebettor BTN (0) ---------- */
  ROUND(
    100.0 * SUM(threebet_cnt) FILTER (
      WHERE
        threebettor_pos = 0
        AND opener_pos = 3
    ) / NULLIF(
      SUM(threebet_opp) FILTER (
        WHERE
          threebettor_pos = 0
          AND opener_pos = 3
      ),
      0
    ),
    2
  ) AS threebet_btn_vs_utg,
  ROUND(
    100.0 * SUM(threebet_cnt) FILTER (
      WHERE
        threebettor_pos = 0
        AND opener_pos = 2
    ) / NULLIF(
      SUM(threebet_opp) FILTER (
        WHERE
          threebettor_pos = 0
          AND opener_pos = 2
      ),
      0
    ),
    2
  ) AS threebet_btn_vs_hj,
  ROUND(
    100.0 * SUM(threebet_cnt) FILTER (
      WHERE
        threebettor_pos = 0
        AND opener_pos = 1
    ) / NULLIF(
      SUM(threebet_opp) FILTER (
        WHERE
          threebettor_pos = 0
          AND opener_pos = 1
      ),
      0
    ),
    2
  ) AS threebet_btn_vs_co,
  /* ---------- Threebettor SB (9) ---------- */
  ROUND(
    100.0 * SUM(threebet_cnt) FILTER (
      WHERE
        threebettor_pos = 9
        AND opener_pos = 3
    ) / NULLIF(
      SUM(threebet_opp) FILTER (
        WHERE
          threebettor_pos = 9
          AND opener_pos = 3
      ),
      0
    ),
    2
  ) AS threebet_sb_vs_utg,
  ROUND(
    100.0 * SUM(threebet_cnt) FILTER (
      WHERE
        threebettor_pos = 9
        AND opener_pos = 2
    ) / NULLIF(
      SUM(threebet_opp) FILTER (
        WHERE
          threebettor_pos = 9
          AND opener_pos = 2
      ),
      0
    ),
    2
  ) AS threebet_sb_vs_hj,
  ROUND(
    100.0 * SUM(threebet_cnt) FILTER (
      WHERE
        threebettor_pos = 9
        AND opener_pos = 1
    ) / NULLIF(
      SUM(threebet_opp) FILTER (
        WHERE
          threebettor_pos = 9
          AND opener_pos = 1
      ),
      0
    ),
    2
  ) AS threebet_sb_vs_co,
  ROUND(
    100.0 * SUM(threebet_cnt) FILTER (
      WHERE
        threebettor_pos = 9
        AND opener_pos = 0
    ) / NULLIF(
      SUM(threebet_opp) FILTER (
        WHERE
          threebettor_pos = 9
          AND opener_pos = 0
      ),
      0
    ),
    2
  ) AS threebet_sb_vs_btn,
  /* ---------- Threebettor BB (8) ---------- */
  ROUND(
    100.0 * SUM(threebet_cnt) FILTER (
      WHERE
        threebettor_pos = 8
        AND opener_pos = 3
    ) / NULLIF(
      SUM(threebet_opp) FILTER (
        WHERE
          threebettor_pos = 8
          AND opener_pos = 3
      ),
      0
    ),
    2
  ) AS threebet_bb_vs_utg,
  ROUND(
    100.0 * SUM(threebet_cnt) FILTER (
      WHERE
        threebettor_pos = 8
        AND opener_pos = 2
    ) / NULLIF(
      SUM(threebet_opp) FILTER (
        WHERE
          threebettor_pos = 8
          AND opener_pos = 2
      ),
      0
    ),
    2
  ) AS threebet_bb_vs_hj,
  ROUND(
    100.0 * SUM(threebet_cnt) FILTER (
      WHERE
        threebettor_pos = 8
        AND opener_pos = 1
    ) / NULLIF(
      SUM(threebet_opp) FILTER (
        WHERE
          threebettor_pos = 8
          AND opener_pos = 1
      ),
      0
    ),
    2
  ) AS threebet_bb_vs_co,
  ROUND(
    100.0 * SUM(threebet_cnt) FILTER (
      WHERE
        threebettor_pos = 8
        AND opener_pos = 0
    ) / NULLIF(
      SUM(threebet_opp) FILTER (
        WHERE
          threebettor_pos = 8
          AND opener_pos = 0
      ),
      0
    ),
    2
  ) AS threebet_bb_vs_btn,
  ROUND(
    100.0 * SUM(threebet_cnt) FILTER (
      WHERE
        threebettor_pos = 8
        AND opener_pos = 9
    ) / NULLIF(
      SUM(threebet_opp) FILTER (
        WHERE
          threebettor_pos = 8
          AND opener_pos = 9
      ),
      0
    ),
    2
  ) AS threebet_bb_vs_sb
FROM
  pop.mv_player_3bet_vs_open_counts
GROUP BY
  id_player,
  id_limit;