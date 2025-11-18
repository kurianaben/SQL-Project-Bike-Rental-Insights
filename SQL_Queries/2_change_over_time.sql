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

-- 2. Monthly total rentals
SELECT 
    date_trunc('month', date) AS month,
    SUM(bike_rental_count)    AS monthly_rentals
FROM bike_data
GROUP BY month
ORDER BY month;

-- 3. Average rentals by hour of day
SELECT 
    hour,
    AVG(bike_rental_count) AS avg_rentals
FROM bike_data
GROUP BY hour
ORDER BY hour;

-- 4. Averages on Weekday vs weekend
SELECT
    CASE WHEN EXTRACT(DOW FROM date) IN (0,6) THEN 'Weekend' ELSE 'Weekday' END AS day_type,
    AVG(bike_rental_count) AS avg_rentals,
    SUM(bike_rental_count) AS total_rentals
FROM bike_data
GROUP BY day_type;

-- 5. Average Hourly pattern by season
SELECT 
    seasons,
    hour,
    AVG(bike_rental_count) AS avg_rentals
FROM bike_data
GROUP BY seasons, hour
ORDER BY seasons, hour;
