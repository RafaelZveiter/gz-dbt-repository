SELECT
 finance.*
 , campaign.ads_cost
 , campaign.ads_impressions
 , campaign.ads_clicks
 , finance.operational_margin - campaign.ads_cost AS ads_margin
FROM {{ ref('finance_day') }} AS finance
LEFT JOIN {{ ref('int_campaign_day') }} AS campaign
USING (date_date)
