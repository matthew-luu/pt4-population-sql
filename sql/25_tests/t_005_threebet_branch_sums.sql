DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM pop.v_population_preflop
        WHERE
            ABS(COALESCE(call_lj_vs_threebet_hj,0) + COALESCE(fourbet_lj_vs_threebet_hj,0) + COALESCE(fold_lj_vs_threebet_hj,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_lj_vs_threebet_co,0) + COALESCE(fourbet_lj_vs_threebet_co,0) + COALESCE(fold_lj_vs_threebet_co,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_lj_vs_threebet_btn,0) + COALESCE(fourbet_lj_vs_threebet_btn,0) + COALESCE(fold_lj_vs_threebet_btn,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_lj_vs_threebet_sb,0) + COALESCE(fourbet_lj_vs_threebet_sb,0) + COALESCE(fold_lj_vs_threebet_sb,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_lj_vs_threebet_bb,0) + COALESCE(fourbet_lj_vs_threebet_bb,0) + COALESCE(fold_lj_vs_threebet_bb,0) - 100.0) > 0.10 OR

            ABS(COALESCE(call_hj_vs_threebet_co,0) + COALESCE(fourbet_hj_vs_threebet_co,0) + COALESCE(fold_hj_vs_threebet_co,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_hj_vs_threebet_btn,0) + COALESCE(fourbet_hj_vs_threebet_btn,0) + COALESCE(fold_hj_vs_threebet_btn,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_hj_vs_threebet_sb,0) + COALESCE(fourbet_hj_vs_threebet_sb,0) + COALESCE(fold_hj_vs_threebet_sb,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_hj_vs_threebet_bb,0) + COALESCE(fourbet_hj_vs_threebet_bb,0) + COALESCE(fold_hj_vs_threebet_bb,0) - 100.0) > 0.10 OR

            ABS(COALESCE(call_co_vs_threebet_btn,0) + COALESCE(fourbet_co_vs_threebet_btn,0) + COALESCE(fold_co_vs_threebet_btn,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_co_vs_threebet_sb,0) + COALESCE(fourbet_co_vs_threebet_sb,0) + COALESCE(fold_co_vs_threebet_sb,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_co_vs_threebet_bb,0) + COALESCE(fourbet_co_vs_threebet_bb,0) + COALESCE(fold_co_vs_threebet_bb,0) - 100.0) > 0.10 OR

            ABS(COALESCE(call_btn_vs_threebet_sb,0) + COALESCE(fourbet_btn_vs_threebet_sb,0) + COALESCE(fold_btn_vs_threebet_sb,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_btn_vs_threebet_bb,0) + COALESCE(fourbet_btn_vs_threebet_bb,0) + COALESCE(fold_btn_vs_threebet_bb,0) - 100.0) > 0.10 OR

            ABS(COALESCE(call_sb_vs_threebet_bb,0) + COALESCE(fourbet_sb_vs_threebet_bb,0) + COALESCE(fold_sb_vs_threebet_bb,0) - 100.0) > 0.10
    ) THEN
        RAISE EXCEPTION 't_005 failed: 3bet-response branches do not sum to 100';
    END IF;
END $$;