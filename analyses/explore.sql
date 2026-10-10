SELECT * FROM {{ ref('silver_hosts')}}
SELECT * FROM {{ ref('silver_listing')}}
SELECT * FROM {{ ref('silver_bookings')}}