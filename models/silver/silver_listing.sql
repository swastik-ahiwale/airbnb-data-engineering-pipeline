{{ config(
    materialized='incremental',
    unique_key='LISTING_ID'
) }}

WITH ranked_listings AS (

    SELECT
        LISTING_ID,
        HOST_ID,
        PROPERTY_TYPE,
        ROOM_TYPE,
        CITY,
        COUNTRY,
        ACCOMMODATES,   
        BEDROOMS,
        BATHROOMS,
        PRICE_PER_NIGHT,
        CREATED_AT,

        ROW_NUMBER() OVER (
            PARTITION BY LISTING_ID
            ORDER BY CREATED_AT DESC
        ) AS rn

    FROM {{ ref('bronze_listings') }}

)

SELECT
    LISTING_ID,
    HOST_ID,
    PROPERTY_TYPE,
    ROOM_TYPE,
    CITY,
    COUNTRY,
    ACCOMMODATES,
    BEDROOMS,
    BATHROOMS,
    PRICE_PER_NIGHT,

    CASE
        WHEN PRICE_PER_NIGHT < 50 THEN 'LOW'
        WHEN PRICE_PER_NIGHT < 150 THEN 'MEDIUM'
        ELSE 'HIGH'
    END AS PRICE_PER_NIGHT_TAG,

    CREATED_AT

FROM ranked_listings

WHERE rn = 1