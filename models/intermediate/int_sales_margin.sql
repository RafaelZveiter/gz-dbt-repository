WITH price AS (SELECT
 sales.*
 , product.purchase_price AS purchase_price
FROM {{ ref('stg_raw__sales') }} AS sales
LEFT JOIN {{ ref('stg_raw__product') }} AS product
USING(products_id)
)
SELECT
 date_date
 , orders_id
 , products_id
 , revenue
 , quantity
 , ROUND(purchase_price * quantity, 2) AS purchase_cost
 , ROUND(revenue - (purchase_price * quantity), 2) AS margin
FROM price
