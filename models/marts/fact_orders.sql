WITH stg_orders AS(
    SELECT 
        o.order_id,
        o.shipping_service,
        TRY_CAST(REPLACE(o.shipping_cost::STRING, ',', '.') AS NUMBER(18, 2)) as shipping_cost,
        a.country as address_country,
        cast(o.created_at::string AS TIMESTAMP_NTZ) as order_date,
        o.promo_id,
        o.estimated_delivery_at,
        TRY_CAST(REPLACE(o.order_cost::STRING, ',', '.') AS NUMBER(18, 2)) as order_cost,
        o.user_id,
        TRY_CAST(REPLACE(o.order_total::STRING, ',', '.') AS NUMBER(18, 2)) as order_total,
        o.delivered_at,
        o.tracking_id,
        o.status,
        o._fivetran_deleted,
        o._fivetran_synced

FROM {{ ref('dim_orders')}} o
inner JOIN {{ ref('dim_addresses') }} a ON o.addresses_id = a.addresses_id
inner JOIN {{ ref('dim_users') }} u ON o.user_id = u.user_id
)

SELECT * FROM stg_orders



