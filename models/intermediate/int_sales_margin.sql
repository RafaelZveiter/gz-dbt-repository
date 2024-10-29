WITH price AS (SELECT
 sales.*
 , product.purchase_price AS purchase_price
FROM {{ ref('stg_raw__sales') }} AS sales
LEFT JOIN {{ ref('stg_raw__product') }} AS product
USING(products_id)
)
SELECT
 date_date
 , products_id
 , revenue
 , quantity
 , purchase_price * quantity AS purchase_cost
FROM price
