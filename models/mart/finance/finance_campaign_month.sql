WITH month AS (
SELECT
 *
 , EXTRACT(MONTH FROM date_date) AS datemonth
FROM {{ ref('finance_campaign_day') }}
)
SELECT
 datemonth
 , ROUND(SUM(ads_margin), 1) AS ads_margin
 , ROUND(SUM(average_basket), 1) AS average_basket
 , ROUND(SUM(operational_margin), 1) AS operational_margin
 , ROUND(SUM(ads_cost), 1) AS ads_cost
 , ROUND(SUM(ads_impressions), 1) AS ads_impressions
 , ROUND(SUM(ads_clicks), 1) AS ads_clicks
 , ROUND(SUM(quantity), 1) AS quantity
 , ROUND(SUM(revenue), 1) AS revenue
 , ROUND(SUM(purchase_cost), 1) AS purchase_cost
 , ROUND(SUM(margin), 1) AS margin
 , ROUND(SUM(shipping_fee), 1) AS shipping_fee
 , ROUND(SUM(log_cost), 1) AS log_cost
 , ROUND(SUM(ship_cost), 1) AS ship_cost
FROM month
GROUP BY datemonth
ORDER BY datemonth DESC