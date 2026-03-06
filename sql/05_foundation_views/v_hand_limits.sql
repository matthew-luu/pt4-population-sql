DROP VIEW IF EXISTS pop.v_hand_limits;

CREATE VIEW pop.v_hand_limits AS
SELECT
    hs.id_hand,
    hs.id_limit,
    cl.limit_name,
    cl.limit_currency,
    cl.amt_sb,
    cl.amt_bb
FROM public.cash_hand_summary hs
JOIN public.cash_limit cl
    ON cl.id_limit = hs.id_limit;