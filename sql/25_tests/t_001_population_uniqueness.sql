DO $$
BEGIN
    IF EXISTS (
        SELECT id_limit
        FROM pop.v_population_rfi
        GROUP BY id_limit
        HAVING COUNT(*) > 1
    ) THEN
        RAISE EXCEPTION 't_001 failed: v_population_rfi has duplicate id_limit rows';
    END IF;

    IF EXISTS (
        SELECT id_limit
        FROM pop.v_population_call_vs_open
        GROUP BY id_limit
        HAVING COUNT(*) > 1
    ) THEN
        RAISE EXCEPTION 't_001 failed: v_population_call_vs_open has duplicate id_limit rows';
    END IF;

    IF EXISTS (
        SELECT id_limit
        FROM pop.v_population_3bet_vs_open
        GROUP BY id_limit
        HAVING COUNT(*) > 1
    ) THEN
        RAISE EXCEPTION 't_001 failed: v_population_3bet_vs_open has duplicate id_limit rows';
    END IF;

    IF EXISTS (
        SELECT id_limit
        FROM pop.v_population_fold_vs_open
        GROUP BY id_limit
        HAVING COUNT(*) > 1
    ) THEN
        RAISE EXCEPTION 't_001 failed: v_population_fold_vs_open has duplicate id_limit rows';
    END IF;

    IF EXISTS (
        SELECT id_limit
        FROM pop.v_population_call_vs_3bet
        GROUP BY id_limit
        HAVING COUNT(*) > 1
    ) THEN
        RAISE EXCEPTION 't_001 failed: v_population_call_vs_3bet has duplicate id_limit rows';
    END IF;

    IF EXISTS (
        SELECT id_limit
        FROM pop.v_population_4bet_vs_3bet
        GROUP BY id_limit
        HAVING COUNT(*) > 1
    ) THEN
        RAISE EXCEPTION 't_001 failed: v_population_4bet_vs_3bet has duplicate id_limit rows';
    END IF;

    IF EXISTS (
        SELECT id_limit
        FROM pop.v_population_preflop
        GROUP BY id_limit
        HAVING COUNT(*) > 1
    ) THEN
        RAISE EXCEPTION 't_001 failed: v_population_preflop has duplicate id_limit rows';
    END IF;
END $$;