-- Data Exploration
-- Checking data type and name of each column in the dataset

SELECT column_name, data_type
FROM `2223_tripdata`.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = '2223_tripdata_combined';

-- checking for total number of rows and number of null values in all columns

    SELECT
    'ride_id' AS column_name,
    COUNTIF(ride_id IS NULL) AS null_count,
    COUNT(*) AS total_count
  FROM
    `capstone-396608.2223_tripdata.2223_tripdata_combined`
  UNION ALL
  SELECT
    'rideable_type' AS column_name,
    COUNTIF(rideable_type IS NULL) AS null_count,
    COUNT(*) AS total_count
  FROM
    `capstone-396608.2223_tripdata.2223_tripdata_combined`
  UNION ALL
  SELECT
    'started_at' AS column_name,
    COUNTIF(started_at IS NULL) AS null_count,
    COUNT(*) AS total_count
  FROM
    `capstone-396608.2223_tripdata.2223_tripdata_combined`
  UNION ALL
  SELECT
    'ended_at' AS column_name,
    COUNTIF(ended_at IS NULL) AS null_count,
    COUNT(*) AS total_count
  FROM
    `capstone-396608.2223_tripdata.2223_tripdata_combined`
  UNION ALL
  SELECT
    'start_station_name' AS column_name,
    COUNTIF(start_station_name IS NULL) AS null_count,
    COUNT(*) AS total_count
  FROM
    `capstone-396608.2223_tripdata.2223_tripdata_combined`
  UNION ALL
  SELECT
    'start_station_id' AS column_name,
    COUNTIF(start_station_id IS NULL) AS null_count,
    COUNT(*) AS total_count
  FROM
    `capstone-396608.2223_tripdata.2223_tripdata_combined`
  UNION ALL
  SELECT
    'end_station_name' AS column_name,
    COUNTIF(end_station_name IS NULL) AS null_count,
    COUNT(*) AS total_count
  FROM
    `capstone-396608.2223_tripdata.2223_tripdata_combined`
  UNION ALL
  SELECT
    'end_station_id' AS column_name,
    COUNTIF(end_station_id IS NULL) AS null_count,
    COUNT(*) AS total_count
  FROM
    `capstone-396608.2223_tripdata.2223_tripdata_combined`
  UNION ALL
  SELECT
    'start_lat' AS column_name,
    COUNTIF(start_lat IS NULL) AS null_count,
    COUNT(*) AS total_count
  FROM
    `capstone-396608.2223_tripdata.2223_tripdata_combined`
  UNION ALL
  SELECT
    'start_lng' AS column_name,
    COUNTIF(start_lng IS NULL) AS null_count,
    COUNT(*) AS total_count
  FROM
    `capstone-396608.2223_tripdata.2223_tripdata_combined`
  UNION ALL
  SELECT
    'end_lat' AS column_name,
    COUNTIF(end_lat IS NULL) AS null_count,
    COUNT(*) AS total_count
  FROM
    `capstone-396608.2223_tripdata.2223_tripdata_combined`
  UNION ALL
  SELECT
    'end_lng' AS column_name,
    COUNTIF(end_lng IS NULL) AS null_count,
    COUNT(*) AS total_count
  FROM
    `capstone-396608.2223_tripdata.2223_tripdata_combined`
  UNION ALL
  SELECT
    'member_casual' AS column_name,
    COUNTIF(member_casual IS NULL) AS null_count,
    COUNT(*) AS total_count
  FROM
    `capstone-396608.2223_tripdata.2223_tripdata_combined`

-- checking if dataset have duplicate rows using ride_id column 

SELECT ride_id, COUNT(*) AS duplicate_count
FROM `capstone-396608.2223_tripdata.2223_tripdata_combined`
GROUP BY ride_id
HAVING COUNT(*) > 1;

-- check if all ride_id values have length of 16

SELECT LENGTH(ride_id) AS ride_id_length, COUNT(*) AS count
FROM `capstone-396608.2223_tripdata.2223_tripdata_combined`
GROUP BY LENGTH(ride_id)

-- Identifying how many unique types of bikes are provided and how many trips are taken with each type using rideable_type column

SELECT DISTINCT rideable_type, COUNT(*) AS trip_count
FROM `capstone-396608.2223_tripdata.2223_tripdata_combined`
GROUP BY rideable_type
ORDER BY trip_count DESC;

-- Identifying how many unique types of subscription is provided and how many trips are taken with each subscription using member_casual column

SELECT DISTINCT member_casual, COUNT(*) AS trip_count
FROM `capstone-396608.2223_tripdata.2223_tripdata_combined`
GROUP BY member_casual
ORDER BY trip_count DESC;

-- Checking how mane rows have start_station_name AND start_station_id missing

SELECT COUNT(ride_id) AS count_of_null_values
FROM `capstone-396608.2223_tripdata.2223_tripdata_combined`
WHERE start_station_name IS NULL AND start_station_id IS NULL;

-- Checking how mane rows have end_station_name AND end_station_id missing

SELECT COUNT(ride_id) AS count_of_null_values
FROM `capstone-396608.2223_tripdata.2223_tripdata_combined`
WHERE end_station_name IS NULL AND end_station_id IS NULL;

-- Checking how many rows have end_lng AND end_lat missing

SELECT COUNT(ride_id) AS count_of_null_values
FROM `capstone-396608.2223_tripdata.2223_tripdata_combined`
WHERE end_lng IS NULL AND end_lat IS NULL;

-- Checking timestamp structure

SELECT started_at, ended_at
FROM `capstone-396608.2223_tripdata.2223_tripdata_combined`
LIMIT 10;

-- Checking for unnatural rides, that were extremely short or unreasonably long

SELECT COUNT(*)
FROM `capstone-396608.2223_tripdata.2223_tripdata_combined`
WHERE TIMESTAMP_DIFF(ended_at, started_at, SECOND) < 60
  OR TIMESTAMP_DIFF(ended_at, started_at, SECOND) > 86400;
