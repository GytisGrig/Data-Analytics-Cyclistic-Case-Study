-- Data Analysis
-- User engagement. Whether specific ride types are preferred by members or casual riders

SELECT rideable_type, member_casual, COUNT(*) AS ride_count
FROM `capstone-396608.2223_tripdata.2223_tripdata_cleaned`
GROUP BY rideable_type, member_casual
ORDER BY rideable_type, member_casual

-- Number of rides taken by members and casual riders over time period

SELECT ride_month,
  member_casual,
  COUNT(*) AS ride_count
FROM `capstone-396608.2223_tripdata.2223_tripdata_cleaned`
GROUP BY ride_month, member_casual
ORDER BY ride_month, member_casual;

-- Ride patterns between weekdays and weekends

SELECT week_day, 
  member_casual, 
  COUNT(ride_id) AS total_trips
FROM `capstone-396608.2223_tripdata.2223_tripdata_cleaned`
GROUP BY week_day, member_casual
ORDER BY member_casual;

-- Ride frequency by hour throughout the day. Breakdown of ride counts for each hour of the day and for each rider type (member or casual)

SELECT
  EXTRACT(HOUR FROM started_at) AS ride_hour,
  member_casual,
  COUNT(*) AS ride_count
FROM `capstone-396608.2223_tripdata.2223_tripdata_cleaned`
GROUP BY ride_hour, member_casual
ORDER BY ride_hour, member_casual;

-- Average ride length per month

SELECT ride_month,
  member_casual,
  AVG(ride_duration_minutes) AS avg_ride_duration
FROM `capstone-396608.2223_tripdata.2223_tripdata_cleaned`
GROUP BY ride_month, member_casual
ORDER BY ride_month, member_casual;

-- Average ride length per weekday

SELECT week_day,
  member_casual,
  AVG(ride_duration_minutes) AS avg_ride_duration
FROM `capstone-396608.2223_tripdata.2223_tripdata_cleaned`
GROUP BY week_day, member_casual
ORDER BY week_day, member_casual;

-- Average ride length per hour

SELECT
  EXTRACT(HOUR FROM started_at) AS ride_hour,
  member_casual,
  AVG(ride_duration_minutes) AS avg_ride_duration
FROM `capstone-396608.2223_tripdata.2223_tripdata_cleaned`
GROUP BY ride_hour, member_casual
ORDER BY ride_hour, member_casual;

-- Average Ride duration by user type

SELECT
  member_casual,
  AVG(ride_duration_minutes) AS avg_ride_duration
FROM `capstone-396608.2223_tripdata.2223_tripdata_cleaned`
GROUP BY member_casual;

-- Most popular start and end stations

SELECT start_station_name, COUNT(*) AS start_count
FROM `capstone-396608.2223_tripdata.2223_tripdata_cleaned`
GROUP BY start_station_name
ORDER BY start_count DESC
LIMIT 10

-- Location of start stations for member and casual

SELECT start_station_name, member_casual,
  AVG(start_lat) AS start_lat, AVG(start_lng) AS start_lng,
  COUNT(ride_id) AS total_trips
FROM `capstone-396608.2223_tripdata.2223_tripdata_cleaned`
GROUP BY start_station_name, member_casual;

-- Location of end stations for member and casual

SELECT end_station_name, member_casual,
  AVG(end_lat) AS end_lat, AVG(end_lng) AS end_lng,
  COUNT(ride_id) AS total_trips
FROM `capstone-396608.2223_tripdata.2223_tripdata_cleaned`
GROUP BY end_station_name, member_casual;
