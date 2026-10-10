
{{ config(
    materialized='table'
) }}

SELECT
    -- Booking keys
    b.BOOKING_ID,
    b.LISTING_ID,

    -- Date
    b.BOOKING_DATE,

    -- Booking measures
    b.TOTAL_AMOUNT,
    b.CLEANING_FEE,
    b.SERVICE_FEE,

    -- Booking status
    b.BOOKING_STATUS,

    -- Listing attributes
    l.HOST_ID,
    l.PROPERTY_TYPE,
    l.ROOM_TYPE,
    l.COUNTRY,
    l.ACCOMMODATES,
    l.BEDROOMS,
    l.BATHROOMS,

    -- Listing pricing
    l.PRICE_PER_NIGHT,
    l.PRICE_PER_NIGHT_TAG,

    -- Host attributes
    h.HOST_NAME,
    h.HOST_SINCE,
    h.IS_SUPERHOST,
    h.RESPONSE_RATE,
    

FROM {{ ref('silver_bookings') }} AS b

LEFT JOIN {{ ref('silver_listing') }} AS l
    ON b.LISTING_ID = l.LISTING_ID

LEFT JOIN {{ ref('silver_hosts') }} AS h
    ON l.HOST_ID = h.HOST_ID

