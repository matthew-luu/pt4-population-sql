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
        FROM pop.mv_player_threebet_vs_open_counts
        WHERE threebet_cnt > threebet_opp
    ) THEN
        RAISE EXCEPTION 't_002 failed: mv_player_threebet_vs_open_counts has threebet_cnt > threebet_opp';
    END IF;

    IF EXISTS (
        SELECT 1
        FROM pop.mv_player_response_vs_threebet_counts
        WHERE fourbet_cnt > defend_opp
    ) THEN
        RAISE EXCEPTION 't_002 failed: mv_player_response_vs_threebet_counts has fourbet_cnt > defend_opp';
    END IF;

    IF EXISTS (
        SELECT 1
        FROM pop.mv_player_response_vs_threebet_counts
        WHERE call_cnt > defend_opp
    ) THEN
        RAISE EXCEPTION 't_002 failed: mv_player_response_vs_threebet_counts has call_vs_threebet > defend_opp';
    END IF;
END $$;