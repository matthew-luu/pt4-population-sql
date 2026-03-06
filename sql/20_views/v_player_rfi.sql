DROP VIEW IF EXISTS pop.v_player_rfi;

CREATE VIEW
  pop.v_player_rfi AS
SELECT
  id_player,
  id_limit,
  MAX(player_name) AS player_name,
  -- total hands for player across positions (optional)
  SUM(hands_in_pos) AS hands,
  ROUND(
    100.0 * SUM(rfi) FILTER (
      WHERE
        pos = 3
    ) / NULLIF(
      SUM(open_opp) FILTER (
        WHERE
          pos = 3
      ),
      0
    ),
    2
  ) AS rfi_utg,
  ROUND(
    100.0 * SUM(rfi) FILTER (
      WHERE
        pos = 2
    ) / NULLIF(
      SUM(open_opp) FILTER (
        WHERE
          pos = 2
      ),
      0
    ),
    2
  ) AS rfi_hj,
  ROUND(
    100.0 * SUM(rfi) FILTER (
      WHERE
        pos = 1
    ) / NULLIF(
      SUM(open_opp) FILTER (
        WHERE
          pos = 1
      ),
      0
    ),
    2
  ) AS rfi_co,
  ROUND(
    100.0 * SUM(rfi) FILTER (
      WHERE
        pos = 0
    ) / NULLIF(
      SUM(open_opp) FILTER (
        WHERE
          pos = 0
      ),
      0
    ),
    2
  ) AS rfi_btn,
  ROUND(
    100.0 * SUM(rfi) FILTER (
      WHERE
        pos = 9
    ) / NULLIF(
      SUM(open_opp) FILTER (
        WHERE
          pos = 9
      ),
      0
    ),
    2
  ) AS rfi_sb
FROM
  pop.mv_player_rfi_counts
GROUP BY
  id_player,
  id_limit;