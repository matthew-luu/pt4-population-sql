DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM pop.v_population_preflop
        WHERE
            ABS(COALESCE(call_hj_vs_fourbet_lj,0) + COALESCE(fivebet_hj_vs_fourbet_lj,0) + COALESCE(fold_hj_vs_fourbet_lj,0) - 100.0) > 0.10 OR

            ABS(COALESCE(call_co_vs_fourbet_lj,0) + COALESCE(fivebet_co_vs_fourbet_lj,0) + COALESCE(fold_co_vs_fourbet_lj,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_co_vs_fourbet_hj,0) + COALESCE(fivebet_co_vs_fourbet_hj,0) + COALESCE(fold_co_vs_fourbet_hj,0) - 100.0) > 0.10 OR

            ABS(COALESCE(call_btn_vs_fourbet_lj,0) + COALESCE(fivebet_btn_vs_fourbet_lj,0) + COALESCE(fold_btn_vs_fourbet_lj,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_btn_vs_fourbet_hj,0) + COALESCE(fivebet_btn_vs_fourbet_hj,0) + COALESCE(fold_btn_vs_fourbet_hj,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_btn_vs_fourbet_co,0) + COALESCE(fivebet_btn_vs_fourbet_co,0) + COALESCE(fold_btn_vs_fourbet_co,0) - 100.0) > 0.10 OR

            ABS(COALESCE(call_sb_vs_fourbet_lj,0) + COALESCE(fivebet_sb_vs_fourbet_lj,0) + COALESCE(fold_sb_vs_fourbet_lj,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_sb_vs_fourbet_hj,0) + COALESCE(fivebet_sb_vs_fourbet_hj,0) + COALESCE(fold_sb_vs_fourbet_hj,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_sb_vs_fourbet_co,0) + COALESCE(fivebet_sb_vs_fourbet_co,0) + COALESCE(fold_sb_vs_fourbet_co,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_sb_vs_fourbet_btn,0) + COALESCE(fivebet_sb_vs_fourbet_btn,0) + COALESCE(fold_sb_vs_fourbet_btn,0) - 100.0) > 0.10 OR

            ABS(COALESCE(call_bb_vs_fourbet_lj,0) + COALESCE(fivebet_bb_vs_fourbet_lj,0) + COALESCE(fold_bb_vs_fourbet_lj,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_bb_vs_fourbet_hj,0) + COALESCE(fivebet_bb_vs_fourbet_hj,0) + COALESCE(fold_bb_vs_fourbet_hj,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_bb_vs_fourbet_co,0) + COALESCE(fivebet_bb_vs_fourbet_co,0) + COALESCE(fold_bb_vs_fourbet_co,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_bb_vs_fourbet_btn,0) + COALESCE(fivebet_bb_vs_fourbet_btn,0) + COALESCE(fold_bb_vs_fourbet_btn,0) - 100.0) > 0.10 OR
            ABS(COALESCE(call_bb_vs_fourbet_sb,0) + COALESCE(fivebet_bb_vs_fourbet_sb,0) + COALESCE(fold_bb_vs_fourbet_sb,0) - 100.0) > 0.10
    ) THEN
        RAISE EXCEPTION 't_006 failed: 4bet-response branches do not sum to 100';
    END IF;
END $$;