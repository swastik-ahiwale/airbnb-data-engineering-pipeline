
{{ config(
    materialized='incremental',
    unique_key='HOST_ID'
) }}

SELECT
    HOST_ID,
    HOST_NAME,
    HOST_SINCE,
    IS_SUPERHOST,
    RESPONSE_RATE,
    CREATED_AT

FROM {{ ref('bronze_hosts') }}

{% if is_incremental() %}

WHERE CREATED_AT > (
    SELECT COALESCE(
        MAX(CREATED_AT),
        '1900-01-01'
    )
    FROM {{ this }}
)

{% endif %}

