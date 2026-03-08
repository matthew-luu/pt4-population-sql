DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM pop.mv_player_rfi_counts
        WHERE rfi > open_opp
    ) THEN
        RAISE EXCEPTION 't_002 failed: mv_player_rfi_counts has rfi > open_opp';
    END IF;

    IF EXISTS (
        SELECT 1
        FROM pop.mv_player_call_vs_open_counts
        WHERE call_vs_open > def_opp
    ) THEN
        RAISE EXCEPTION 't_002 failed: mv_player_call_vs_open_counts has call_vs_open > def_opp';
    END IF;

    IF EXISTS (
        SELECT 1
        FROM pop.mv_player_3bet_vs_open_counts
        WHERE threebet_cnt > threebet_opp
    ) THEN
        RAISE EXCEPTION 't_002 failed: mv_player_3bet_vs_open_counts has threebet_cnt > threebet_opp';
    END IF;

    IF EXISTS (
        SELECT 1
        FROM pop.mv_player_4bet_vs_3bet_counts
        WHERE fourbet_cnt > fourbet_opp
    ) THEN
        RAISE EXCEPTION 't_002 failed: mv_player_4bet_vs_3bet_counts has fourbettor_cnt > fourbettor_opp';
    END IF;

    IF EXISTS (
        SELECT 1
        FROM pop.mv_player_call_vs_3bet_counts
        WHERE call_vs_3bet > call_opp
    ) THEN
        RAISE EXCEPTION 't_002 failed: mv_player_call_vs_3bet_counts has call_vs_3bet > call_opp';
    END IF;
END $$;