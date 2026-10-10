{{ config(
    materialized='table'
) }}

SELECT
    b.BOOKING_ID,
    b.LISTING_ID,
    b.BOOKING_DATE,
    b.TOTAL_AMOUNT,
    b.CLEANING_FEE,
    b.SERVICE_FEE,
    b.BOOKING_STATUS,

    l.HOST_ID,
    l.PROPERTY_TYPE,
    l.ROOM_TYPE,
    l.COUNTRY,
    l.ACCOMMODATES,
    l.BEDROOMS,
    l.PRICE_PER_NIGHT_TAG,
    l.BATHROOMS,
    l.PRICE_PER_NIGHT

FROM {{ ref('silver_bookings') }} AS b

LEFT JOIN {{ ref('silver_listing') }} AS l
    ON l.LISTING_ID = b.LISTING_ID