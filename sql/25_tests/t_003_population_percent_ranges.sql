DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM pop.v_population_preflop
        WHERE
            rfi_lj   NOT BETWEEN 0 AND 100 OR
            rfi_hj   NOT BETWEEN 0 AND 100 OR
            rfi_co   NOT BETWEEN 0 AND 100 OR
            rfi_btn  NOT BETWEEN 0 AND 100 OR
            rfi_sb   NOT BETWEEN 0 AND 100 OR

            call_hj_vs_lj NOT BETWEEN 0 AND 100 OR
            call_co_vs_lj NOT BETWEEN 0 AND 100 OR
            call_co_vs_hj NOT BETWEEN 0 AND 100 OR
            call_btn_vs_lj NOT BETWEEN 0 AND 100 OR
            call_btn_vs_hj NOT BETWEEN 0 AND 100 OR
            call_btn_vs_co NOT BETWEEN 0 AND 100 OR
            call_sb_vs_lj NOT BETWEEN 0 AND 100 OR
            call_sb_vs_hj NOT BETWEEN 0 AND 100 OR
            call_sb_vs_co NOT BETWEEN 0 AND 100 OR
            call_sb_vs_btn NOT BETWEEN 0 AND 100 OR
            call_bb_vs_lj NOT BETWEEN 0 AND 100 OR
            call_bb_vs_hj NOT BETWEEN 0 AND 100 OR
            call_bb_vs_co NOT BETWEEN 0 AND 100 OR
            call_bb_vs_btn NOT BETWEEN 0 AND 100 OR
            call_bb_vs_sb NOT BETWEEN 0 AND 100 OR

            threebet_hj_vs_lj NOT BETWEEN 0 AND 100 OR
            threebet_co_vs_lj NOT BETWEEN 0 AND 100 OR
            threebet_co_vs_hj NOT BETWEEN 0 AND 100 OR
            threebet_btn_vs_lj NOT BETWEEN 0 AND 100 OR
            threebet_btn_vs_hj NOT BETWEEN 0 AND 100 OR
            threebet_btn_vs_co NOT BETWEEN 0 AND 100 OR
            threebet_sb_vs_lj NOT BETWEEN 0 AND 100 OR
            threebet_sb_vs_hj NOT BETWEEN 0 AND 100 OR
            threebet_sb_vs_co NOT BETWEEN 0 AND 100 OR
            threebet_sb_vs_btn NOT BETWEEN 0 AND 100 OR
            threebet_bb_vs_lj NOT BETWEEN 0 AND 100 OR
            threebet_bb_vs_hj NOT BETWEEN 0 AND 100 OR
            threebet_bb_vs_co NOT BETWEEN 0 AND 100 OR
            threebet_bb_vs_btn NOT BETWEEN 0 AND 100 OR
            threebet_bb_vs_sb NOT BETWEEN 0 AND 100 OR

            fold_hj_vs_lj NOT BETWEEN 0 AND 100 OR
            fold_co_vs_lj NOT BETWEEN 0 AND 100 OR
            fold_co_vs_hj NOT BETWEEN 0 AND 100 OR
            fold_btn_vs_lj NOT BETWEEN 0 AND 100 OR
            fold_btn_vs_hj NOT BETWEEN 0 AND 100 OR
            fold_btn_vs_co NOT BETWEEN 0 AND 100 OR
            fold_sb_vs_lj NOT BETWEEN 0 AND 100 OR
            fold_sb_vs_hj NOT BETWEEN 0 AND 100 OR
            fold_sb_vs_co NOT BETWEEN 0 AND 100 OR
            fold_sb_vs_btn NOT BETWEEN 0 AND 100 OR
            fold_bb_vs_lj NOT BETWEEN 0 AND 100 OR
            fold_bb_vs_hj NOT BETWEEN 0 AND 100 OR
            fold_bb_vs_co NOT BETWEEN 0 AND 100 OR
            fold_bb_vs_btn NOT BETWEEN 0 AND 100 OR
            fold_bb_vs_sb NOT BETWEEN 0 AND 100
    ) THEN
        RAISE EXCEPTION 't_003 failed: one or more population percentages are outside 0-100';
    END IF;
END $$;