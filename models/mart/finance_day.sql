SELECT
    date_date
    , COUNT(orders_id) AS nb_transactions
    , ROUND(SUM(revenue), 1) AS revenue
    , ROUND(SAFE_DIVIDE(SUM(revenue), COUNT(orders_id)), 1) AS average_basket
    , ROUND(SUM(margin), 1) AS margin
    , ROUND(SUM(operational_margin), 1) AS operational_margin
    , ROUND(SUM(purchase_cost), 1) AS purchase_cost
    , ROUND(SUM(shipping_fee), 1) AS shipping_fee
    , ROUND(SUM(logcost), 1) AS log_cost
    , SUM(quantity) AS quantity
FROM {{ ref('int_orders_operational') }}
GROUP BY date_date
ORDER BY date_date DESC


