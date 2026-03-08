DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM pop.v_population_preflop
        WHERE
            ABS(COALESCE(call_hj_vs_lj,0) + COALESCE(threebet_hj_vs_lj,0) + COALESCE(fold_hj_vs_lj,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_co_vs_lj,0) + COALESCE(threebet_co_vs_lj,0) + COALESCE(fold_co_vs_lj,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_co_vs_hj,0) + COALESCE(threebet_co_vs_hj,0) + COALESCE(fold_co_vs_hj,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_btn_vs_lj,0) + COALESCE(threebet_btn_vs_lj,0) + COALESCE(fold_btn_vs_lj,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_btn_vs_hj,0) + COALESCE(threebet_btn_vs_hj,0) + COALESCE(fold_btn_vs_hj,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_btn_vs_co,0) + COALESCE(threebet_btn_vs_co,0) + COALESCE(fold_btn_vs_co,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_sb_vs_lj,0) + COALESCE(threebet_sb_vs_lj,0) + COALESCE(fold_sb_vs_lj,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_sb_vs_hj,0) + COALESCE(threebet_sb_vs_hj,0) + COALESCE(fold_sb_vs_hj,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_sb_vs_co,0) + COALESCE(threebet_sb_vs_co,0) + COALESCE(fold_sb_vs_co,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_sb_vs_btn,0) + COALESCE(threebet_sb_vs_btn,0) + COALESCE(fold_sb_vs_btn,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_bb_vs_lj,0) + COALESCE(threebet_bb_vs_lj,0) + COALESCE(fold_bb_vs_lj,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_bb_vs_hj,0) + COALESCE(threebet_bb_vs_hj,0) + COALESCE(fold_bb_vs_hj,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_bb_vs_co,0) + COALESCE(threebet_bb_vs_co,0) + COALESCE(fold_bb_vs_co,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_bb_vs_btn,0) + COALESCE(threebet_bb_vs_btn,0) + COALESCE(fold_bb_vs_btn,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_bb_vs_sb,0) + COALESCE(threebet_bb_vs_sb,0) + COALESCE(fold_bb_vs_sb,0) - 100.0) > 0.10
    ) THEN
        RAISE EXCEPTION 't_004 failed: open-defense branches do not sum to 100';
    END IF;
END $$;