/*____________________________________________________________________
Change Over Time

Purpose:
-To analyze how bike rentals vary across different time periods (daily, monthly, hourly).

Why it's important:
-Time-based patterns are crucial for operations, forecasting, and understanding user behavior.
____________________________________________________________________ */
--QUERIES

-- 1. Daily total rentals
SELECT 
    date,
    SUM(bike_rental_count) AS daily_rentals
FROM bike_data
GROUP BY date
ORDER BY date;
