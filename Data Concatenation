-- Combining all the 12 months data tables into a single table containing data from Aug 2022 to July 2023.

CREATE OR REPLACE TABLE `capstone-396608.2223_tripdata.2223_tripdata_combined` AS
  SELECT * FROM `capstone-396608.2223_tripdata.2223_tripdata_2208`
  UNION ALL
  SELECT * FROM `capstone-396608.2223_tripdata.2223_tripdata_2209`
  UNION ALL
  SELECT * FROM `capstone-396608.2223_tripdata.2223_tripdata_2210`
  UNION ALL
  SELECT * FROM `capstone-396608.2223_tripdata.2223_tripdata_2211`
  UNION ALL
  SELECT * FROM `capstone-396608.2223_tripdata.2223_tripdata_2212`
  UNION ALL
  SELECT * FROM `capstone-396608.2223_tripdata.2223_tripdata_2301`
  UNION ALL
  SELECT * FROM `capstone-396608.2223_tripdata.2223_tripdata_2302`
  UNION ALL
  SELECT * FROM `capstone-396608.2223_tripdata.2223_tripdata_2303`
  UNION ALL
  SELECT * FROM `capstone-396608.2223_tripdata.2223_tripdata_2304`
  UNION ALL
  SELECT * FROM `capstone-396608.2223_tripdata.2223_tripdata_2305`
  UNION ALL
  SELECT * FROM `capstone-396608.2223_tripdata.2223_tripdata_2306`
  UNION ALL
  SELECT * FROM `capstone-396608.2223_tripdata.2223_tripdata_2307`;

-- Calculate row count for the combined dataset
SELECT COUNT(*) AS combined_row_count
FROM `capstone-396608.2223_tripdata.2223_tripdata_combined`

-- Calculate sum of row counts for individual tables
WITH IndividualRowCounts AS (
  SELECT COUNT(*) AS row_count FROM `capstone-396608.2223_tripdata.2223_tripdata_2208`
  UNION ALL
  SELECT COUNT(*) FROM `capstone-396608.2223_tripdata.2223_tripdata_2209`
  UNION ALL
  SELECT COUNT(*) FROM `capstone-396608.2223_tripdata.2223_tripdata_2210`
  UNION ALL
  SELECT COUNT(*) FROM `capstone-396608.2223_tripdata.2223_tripdata_2211`
  UNION ALL
  SELECT COUNT(*) FROM `capstone-396608.2223_tripdata.2223_tripdata_2212`
  UNION ALL
  SELECT COUNT(*) FROM `capstone-396608.2223_tripdata.2223_tripdata_2301`
  UNION ALL
  SELECT COUNT(*) FROM `capstone-396608.2223_tripdata.2223_tripdata_2302`
  UNION ALL
  SELECT COUNT(*) FROM `capstone-396608.2223_tripdata.2223_tripdata_2303`
  UNION ALL
  SELECT COUNT(*) FROM `capstone-396608.2223_tripdata.2223_tripdata_2304`
  UNION ALL
  SELECT COUNT(*) FROM `capstone-396608.2223_tripdata.2223_tripdata_2305`
  UNION ALL
  SELECT COUNT(*) FROM `capstone-396608.2223_tripdata.2223_tripdata_2306`
  UNION ALL
  SELECT COUNT(*) FROM `capstone-396608.2223_tripdata.2223_tripdata_2307`
)
SELECT SUM(row_count) AS total_row_count
FROM IndividualRowCounts;
