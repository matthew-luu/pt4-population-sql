DROP FUNCTION IF EXISTS pop.get_population_preflop(smallint);

CREATE FUNCTION pop.get_population_preflop(p_id_limit smallint)
RETURNS SETOF pop.v_population_preflop
LANGUAGE sql
AS $$
    SELECT *
    FROM pop.v_population_preflop
    WHERE id_limit = p_id_limit
    ORDER BY id_limit
$$;