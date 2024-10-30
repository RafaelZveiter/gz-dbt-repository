WITH op AS(
SELECT
    orders.*
    , ship.shipping_fee 
    , ship.ship_cost 
    , ship.logcost
FROM {{ ref('int_orders_margin') }} AS orders
LEFT JOIN {{ ref('stg_raw__ship') }} AS ship
USING (orders_id)
)
SELECT
    orders_id
    , date_date
    , ROUND(margin + shipping_fee - logcost - ship_cost, 2) AS operational_margin
    , quantity
    , margin
    , revenue
    , shipping_fee
    , logcost
    , purchase_cost
FROM op
ORDER BY date_date