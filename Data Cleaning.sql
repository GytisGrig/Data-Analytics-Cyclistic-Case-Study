-- Data Cleaning
-- Creating new table by removing rows with NULL values in the dataset
-- Adding new column with ride length in seconds
-- Excluding rides that are overly long or very short

CREATE OR REPLACE TABLE `capstone-396608.2223_tripdata.2223_tripdata_cleaned`
AS
SELECT
  ride_id,
  rideable_type,
  started_at,
  ended_at,
  start_station_name,
  end_station_name,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  member_casual,
  TIMESTAMP_DIFF(ended_at, started_at, SECOND) AS ride_duration_seconds,
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_duration_minutes,
  EXTRACT(DAYOFWEEK FROM started_at) AS week_day_number,
  CASE EXTRACT(DAYOFWEEK FROM started_at)
    WHEN 1 THEN 'Sunday'
    WHEN 2 THEN 'Monday'
    WHEN 3 THEN 'Tuesday'
    WHEN 4 THEN 'Wednesday'
    WHEN 5 THEN 'Thursday'
    WHEN 6 THEN 'Friday'
    WHEN 7 THEN 'Saturday'
  END AS week_day,
  EXTRACT(MONTH FROM started_at) AS ride_month_number,
  CASE EXTRACT(MONTH FROM started_at)
    WHEN 1 THEN 'January'
    WHEN 2 THEN 'February'
    WHEN 3 THEN 'March'
    WHEN 4 THEN 'April'
    WHEN 5 THEN 'May'
    WHEN 6 THEN 'June'
    WHEN 7 THEN 'July'
    WHEN 8 THEN 'August'
    WHEN 9 THEN 'September'
    WHEN 10 THEN 'October'
    WHEN 11 THEN 'November'
    WHEN 12 THEN 'December'
  END AS ride_month
FROM `capstone-396608.2223_tripdata.2223_tripdata_combined`
WHERE ride_id IS NOT NULL
  AND rideable_type IS NOT NULL
  AND started_at IS NOT NULL
  AND ended_at IS NOT NULL
  AND start_station_name IS NOT NULL
  AND end_station_name IS NOT NULL
  AND start_lat IS NOT NULL
  AND start_lng IS NOT NULL
  AND end_lat IS NOT NULL
  AND end_lng IS NOT NULL
  AND member_casual IS NOT NULL
  AND TIMESTAMP_DIFF(ended_at, started_at, SECOND) >= 60  -- Minimum 1 minute
  AND TIMESTAMP_DIFF(ended_at, started_at, SECOND) <= 86400;  -- Maximum 1 day

-- Check on total rows of new cleaned dataset and original combined dataset

SELECT COUNT(ride_id) AS no_of_rows
FROM `capstone-396608.2223_tripdata.2223_tripdata_cleaned`;

SELECT COUNT(ride_id) AS no_of_rows
FROM `capstone-396608.2223_tripdata.2223_tripdata_combined`;
