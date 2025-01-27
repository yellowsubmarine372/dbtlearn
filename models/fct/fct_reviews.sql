{{ config(
    materialized='incremental',
    on_schema_change='fail'
    ) 
}}
WITH src_reviews AS (
    SELECT * FROM {{ ref('src_reviews') }}
)
SELECT * FROM src_reviews
WHERE review_text is not null
{% if is_incremental() %} 
    AND review_date > (SELECT MAX(review_date) FROM {{ this }}) 
    --when incremental mode is true, if review_date is greater than the max review_date in the table, then append the new data (가장 최근의 review_date를 가져온다는 의미)
    --this referes to fct_reviews.sql
{% endif %}