
{{ config(
    materialized='ephemeral'
) }}

WITH booking_CTE AS (

    SELECT
        b.BOOKING_ID,
        b.LISTING_ID,
        b.BOOKING_DATE,
        b.TOTAL_AMOUNT,
        b.CLEANING_FEE,
        b.SERVICE_FEE,
        b.BOOKING_STATUS

    FROM {{ ref('obt') }} AS b

)

SELECT *
FROM booking_CTE

