WITH 
l AS (
    SELECT * FROM {{ ref('dim_listings_cleansed')}}
),
h AS (
    SELECT * FROM {{ ref('dim_hosts_cleansed')}}
)

SELECT 
    l.listing_id,
    l.listing_name,
    l.room_type,
    l.minimum_nights,
    l.price,
    l.host_id,
    h.host_name,
    h.is_superhost as host_is_superhost,
    l.created_at,
    GREATEST(l.updated_at, h.updated_at) as last_updated_at --가장 최근 값을 updated_at으로 설정
FROM l
LEFT JOIN h ON (l.host_id = h.host_id)