/* =========================
Refresh workflow (run when you import new hands)
========================= */
-- Refresh MVs (order doesn't matter here, but keep consistent)
-- Note: CONCURRENTLY requires unique indexes; omit unless you add them.
REFRESH MATERIALIZED VIEW public.mv_pop_rfi_counts;

REFRESH MATERIALIZED VIEW public.mv_pop_2bet_def_counts;

/* =========================
Example usage
========================= */
-- Full report:
-- SELECT * FROM public.v_population_preflop ORDER BY hands DESC;
-- Single player:
-- SELECT * FROM public.v_population_preflop WHERE player_name = 'alex1484';
--Population average:
SELECT
   COUNT(*) AS player_count,
   SUM(hands) AS total_hands,
   ROUND(
      AVG(rfi_utg) FILTER (
         WHERE
            rfi_utg IS NOT NULL
      ),
      2
   ) AS avg_rfi_utg,
   ROUND(
      AVG(rfi_hj) FILTER (
         WHERE
            rfi_hj IS NOT NULL
      ),
      2
   ) AS avg_rfi_hj,
   ROUND(
      AVG(rfi_co) FILTER (
         WHERE
            rfi_co IS NOT NULL
      ),
      2
   ) AS avg_rfi_co,
   ROUND(
      AVG(rfi_btn) FILTER (
         WHERE
            rfi_btn IS NOT NULL
      ),
      2
   ) AS avg_rfi_btn,
   ROUND(
      AVG(rfi_sb) FILTER (
         WHERE
            rfi_sb IS NOT NULL
      ),
      2
   ) AS avg_rfi_sb,
   ROUND(
      AVG(call_hj_vs_utg) FILTER (
         WHERE
            call_hj_vs_utg IS NOT NULL
      ),
      2
   ) AS avg_call_hj_vs_utg,
   ROUND(
      AVG(call_co_vs_utg) FILTER (
         WHERE
            call_co_vs_utg IS NOT NULL
      ),
      2
   ) AS avg_call_co_vs_utg,
   ROUND(
      AVG(call_co_vs_hj) FILTER (
         WHERE
            call_co_vs_hj IS NOT NULL
      ),
      2
   ) AS avg_call_co_vs_hj,
   ROUND(
      AVG(call_btn_vs_utg) FILTER (
         WHERE
            call_btn_vs_utg IS NOT NULL
      ),
      2
   ) AS avg_call_btn_vs_utg,
   ROUND(
      AVG(call_btn_vs_hj) FILTER (
         WHERE
            call_btn_vs_hj IS NOT NULL
      ),
      2
   ) AS avg_call_btn_vs_hj,
   ROUND(
      AVG(call_btn_vs_co) FILTER (
         WHERE
            call_btn_vs_co IS NOT NULL
      ),
      2
   ) AS avg_call_btn_vs_co,
   ROUND(
      AVG(call_sb_vs_utg) FILTER (
         WHERE
            call_sb_vs_utg IS NOT NULL
      ),
      2
   ) AS avg_call_sb_vs_utg,
   ROUND(
      AVG(call_sb_vs_hj) FILTER (
         WHERE
            call_sb_vs_hj IS NOT NULL
      ),
      2
   ) AS avg_call_sb_vs_hj,
   ROUND(
      AVG(call_sb_vs_co) FILTER (
         WHERE
            call_sb_vs_co IS NOT NULL
      ),
      2
   ) AS avg_call_sb_vs_co,
   ROUND(
      AVG(call_sb_vs_btn) FILTER (
         WHERE
            call_sb_vs_btn IS NOT NULL
      ),
      2
   ) AS avg_call_sb_vs_btn,
   ROUND(
      AVG(call_bb_vs_utg) FILTER (
         WHERE
            call_bb_vs_utg IS NOT NULL
      ),
      2
   ) AS avg_call_bb_vs_utg,
   ROUND(
      AVG(call_bb_vs_hj) FILTER (
         WHERE
            call_bb_vs_hj IS NOT NULL
      ),
      2
   ) AS avg_call_bb_vs_hj,
   ROUND(
      AVG(call_bb_vs_co) FILTER (
         WHERE
            call_bb_vs_co IS NOT NULL
      ),
      2
   ) AS avg_call_bb_vs_co,
   ROUND(
      AVG(call_bb_vs_btn) FILTER (
         WHERE
            call_bb_vs_btn IS NOT NULL
      ),
      2
   ) AS avg_call_bb_vs_btn,
   ROUND(
      AVG(call_bb_vs_sb) FILTER (
         WHERE
            call_bb_vs_sb IS NOT NULL
      ),
      2
   ) AS avg_call_bb_vs_sb,
   ROUND(
      AVG(threebet_hj_vs_utg) FILTER (
         WHERE
            threebet_hj_vs_utg IS NOT NULL
      ),
      2
   ) AS avg_3bet_hj_vs_utg,
   ROUND(
      AVG(threebet_co_vs_utg) FILTER (
         WHERE
            threebet_co_vs_utg IS NOT NULL
      ),
      2
   ) AS avg_3bet_co_vs_utg,
   ROUND(
      AVG(threebet_co_vs_hj) FILTER (
         WHERE
            threebet_co_vs_hj IS NOT NULL
      ),
      2
   ) AS avg_3bet_co_vs_hj,
   ROUND(
      AVG(threebet_btn_vs_utg) FILTER (
         WHERE
            threebet_btn_vs_utg IS NOT NULL
      ),
      2
   ) AS avg_3bet_btn_vs_utg,
   ROUND(
      AVG(threebet_btn_vs_hj) FILTER (
         WHERE
            threebet_btn_vs_hj IS NOT NULL
      ),
      2
   ) AS avg_3bet_btn_vs_hj,
   ROUND(
      AVG(threebet_btn_vs_co) FILTER (
         WHERE
            threebet_btn_vs_co IS NOT NULL
      ),
      2
   ) AS avg_3bet_btn_vs_co,
   ROUND(
      AVG(threebet_sb_vs_utg) FILTER (
         WHERE
            threebet_sb_vs_utg IS NOT NULL
      ),
      2
   ) AS avg_3bet_sb_vs_utg,
   ROUND(
      AVG(threebet_sb_vs_hj) FILTER (
         WHERE
            threebet_sb_vs_hj IS NOT NULL
      ),
      2
   ) AS avg_3bet_sb_vs_hj,
   ROUND(
      AVG(threebet_sb_vs_co) FILTER (
         WHERE
            threebet_sb_vs_co IS NOT NULL
      ),
      2
   ) AS avg_3bet_sb_vs_co,
   ROUND(
      AVG(threebet_sb_vs_btn) FILTER (
         WHERE
            threebet_sb_vs_btn IS NOT NULL
      ),
      2
   ) AS avg_3bet_sb_vs_btn,
   ROUND(
      AVG(threebet_bb_vs_utg) FILTER (
         WHERE
            threebet_bb_vs_utg IS NOT NULL
      ),
      2
   ) AS avg_3bet_bb_vs_utg,
   ROUND(
      AVG(threebet_bb_vs_hj) FILTER (
         WHERE
            threebet_bb_vs_hj IS NOT NULL
      ),
      2
   ) AS avg_3bet_bb_vs_hj,
   ROUND(
      AVG(threebet_bb_vs_co) FILTER (
         WHERE
            threebet_bb_vs_co IS NOT NULL
      ),
      2
   ) AS avg_3bet_bb_vs_co,
   ROUND(
      AVG(threebet_bb_vs_btn) FILTER (
         WHERE
            threebet_bb_vs_btn IS NOT NULL
      ),
      2
   ) AS avg_3bet_bb_vs_btn,
   ROUND(
      AVG(threebet_bb_vs_sb) FILTER (
         WHERE
            threebet_bb_vs_sb IS NOT NULL
      ),
      2
   ) AS avg_3bet_bb_vs_sb
FROM
   pop.v_population_preflop;