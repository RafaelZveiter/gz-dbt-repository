with
    price as (
        select sales.*, product.purchase_price as purchase_price
        from {{ ref("stg_raw__sales") }} as sales
        left join {{ ref("stg_raw__product") }} as product using (products_id)
    ),
    cost as (
        select
            date_date,
            orders_id,
            products_id,
            revenue,
            quantity,
            round(purchase_price * quantity, 2) as purchase_cost,
            round(revenue - (purchase_price * quantity), 2) as margin
        from price
    )
select *
,{{ margin_percent( 'revenue' ,  'purchase_cost') }} as margin_percent
from cost
