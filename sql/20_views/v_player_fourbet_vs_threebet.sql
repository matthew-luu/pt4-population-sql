DROP VIEW IF EXISTS pop.v_player_fourbet_vs_threebet;

CREATE VIEW
  pop.v_player_fourbet_vs_threebet AS
SELECT
  id_player,
  id_limit,
  /* ---------- Fourbettor SB (9) ---------- */
  ROUND(
    100.0 * SUM(fourbet_cnt) FILTER (
      WHERE
        threebettor_pos = 8
        AND defend_pos = 9
    ) / NULLIF(
      SUM(defend_opp) FILTER (
        WHERE
          threebettor_pos = 8
          AND defend_pos = 9
      ),
      0
    ),
    2
  ) AS fourbet_sb_vs_threebet_bb,
  /* ---------- Fourbettor BTN (0) ---------- */
  ROUND(
    100.0 * SUM(fourbet_cnt) FILTER (
      WHERE
        threebettor_pos = 8
        AND defend_pos = 0
    ) / NULLIF(
      SUM(defend_opp) FILTER (
        WHERE
          threebettor_pos = 8
          AND defend_pos = 0
      ),
      0
    ),
    2
  ) AS fourbet_btn_vs_threebet_bb,
  ROUND(
    100.0 * SUM(fourbet_cnt) FILTER (
      WHERE
        threebettor_pos = 9
        AND defend_pos = 0
    ) / NULLIF(
      SUM(defend_opp) FILTER (
        WHERE
          threebettor_pos = 9
          AND defend_pos = 0
      ),
      0
    ),
    2
  ) AS fourbet_btn_vs_threebet_sb,
  /* ---------- Fourbettor CO (1) ---------- */
  ROUND(
    100.0 * SUM(fourbet_cnt) FILTER (
      WHERE
        threebettor_pos = 8
        AND defend_pos = 1
    ) / NULLIF(
      SUM(defend_opp) FILTER (
        WHERE
          threebettor_pos = 8
          AND defend_pos = 1
      ),
      0
    ),
    2
  ) AS fourbet_co_vs_threebet_bb,
  ROUND(
    100.0 * SUM(fourbet_cnt) FILTER (
      WHERE
        threebettor_pos = 9
        AND defend_pos = 1
    ) / NULLIF(
      SUM(defend_opp) FILTER (
        WHERE
          threebettor_pos = 9
          AND defend_pos = 1
      ),
      0
    ),
    2
  ) AS fourbet_co_vs_threebet_sb,
  ROUND(
    100.0 * SUM(fourbet_cnt) FILTER (
      WHERE
        threebettor_pos = 0
        AND defend_pos = 1
    ) / NULLIF(
      SUM(defend_opp) FILTER (
        WHERE
          threebettor_pos = 0
          AND defend_pos = 1
      ),
      0
    ),
    2
  ) AS fourbet_co_vs_threebet_btn,
  /* ---------- Fourbettor HJ (2) ---------- */
  ROUND(
    100.0 * SUM(fourbet_cnt) FILTER (
      WHERE
        threebettor_pos = 8
        AND defend_pos = 2
    ) / NULLIF(
      SUM(defend_opp) FILTER (
        WHERE
          threebettor_pos = 8
          AND defend_pos = 2
      ),
      0
    ),
    2
  ) AS fourbet_hj_vs_threebet_bb,
  ROUND(
    100.0 * SUM(fourbet_cnt) FILTER (
      WHERE
        threebettor_pos = 9
        AND defend_pos = 2
    ) / NULLIF(
      SUM(defend_opp) FILTER (
        WHERE
          threebettor_pos = 9
          AND defend_pos = 2
      ),
      0
    ),
    2
  ) AS fourbet_hj_vs_threebet_sb,
  ROUND(
    100.0 * SUM(fourbet_cnt) FILTER (
      WHERE
        threebettor_pos = 0
        AND defend_pos = 2
    ) / NULLIF(
      SUM(defend_opp) FILTER (
        WHERE
          threebettor_pos = 0
          AND defend_pos = 2
      ),
      0
    ),
    2
  ) AS fourbet_hj_vs_threebet_btn,
  ROUND(
    100.0 * SUM(fourbet_cnt) FILTER (
      WHERE
        threebettor_pos = 1
        AND defend_pos = 2
    ) / NULLIF(
      SUM(defend_opp) FILTER (
        WHERE
          threebettor_pos = 1
          AND defend_pos = 2
      ),
      0
    ),
    2
  ) AS fourbet_hj_vs_threebet_co,
  /* ---------- Fourbettor LJ (3) ---------- */
  ROUND(
    100.0 * SUM(fourbet_cnt) FILTER (
      WHERE
        threebettor_pos = 8
        AND defend_pos = 3
    ) / NULLIF(
      SUM(defend_opp) FILTER (
        WHERE
          threebettor_pos = 8
          AND defend_pos = 3
      ),
      0
    ),
    2
  ) AS fourbet_lj_vs_threebet_bb,
  ROUND(
    100.0 * SUM(fourbet_cnt) FILTER (
      WHERE
        threebettor_pos = 9
        AND defend_pos = 3
    ) / NULLIF(
      SUM(defend_opp) FILTER (
        WHERE
          threebettor_pos = 9
          AND defend_pos = 3
      ),
      0
    ),
    2
  ) AS fourbet_lj_vs_threebet_sb,
  ROUND(
    100.0 * SUM(fourbet_cnt) FILTER (
      WHERE
        threebettor_pos = 0
        AND defend_pos = 3
    ) / NULLIF(
      SUM(defend_opp) FILTER (
        WHERE
          threebettor_pos = 0
          AND defend_pos = 3
      ),
      0
    ),
    2
  ) AS fourbet_lj_vs_threebet_btn,
  ROUND(
    100.0 * SUM(fourbet_cnt) FILTER (
      WHERE
        threebettor_pos = 1
        AND defend_pos = 3
    ) / NULLIF(
      SUM(defend_opp) FILTER (
        WHERE
          threebettor_pos = 1
          AND defend_pos = 3
      ),
      0
    ),
    2
  ) AS fourbet_lj_vs_threebet_co,
  ROUND(
    100.0 * SUM(fourbet_cnt) FILTER (
      WHERE
        threebettor_pos = 2
        AND defend_pos = 3
    ) / NULLIF(
      SUM(defend_opp) FILTER (
        WHERE
          threebettor_pos = 2
          AND defend_pos = 3
      ),
      0
    ),
    2
  ) AS fourbet_lj_vs_threebet_hj
FROM
  pop.mv_player_response_vs_threebet_counts
GROUP BY
  id_player,
  id_limit;