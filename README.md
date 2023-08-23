# Data-Analytics-Cyclistic-Case-Study

# Introduction
In this case study, I will perform real-world tasks of a data analyst at a fictional company, Cyclistic. In order to answer the key business questions, I will follow the steps of the data analysis process: Ask, Prepare, Process, Analyze, Share, and Act.

## Quick Links:
Data Source: [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html)[accessed on 21/08/23]

SQL Queries:
01. [Data Concatenation](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/blob/main/Data%20Concatenation.sql)
02. [Data Exploration](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/blob/main/Data%20Exploration.sql)
03. [Data Cleaning](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/blob/main/Data%20Cleaning.sql)
04. [Data Analysis](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/blob/main/Data%20Analysis.sql)
05. Data Visualizations

# Project Information
### About the Company
In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime.

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.

Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.

# Scenario
I am a data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, your team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, your team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve your recommendations, so they must be backed up with compelling data insights and professional data visualizations.

# Ask
### Business Task
Craft marketing strategy that effectively transitions casual riders into loyal annual members

### Analysis Question
How do annual members and casual riders use Cyclistic bikes differently?

# Prepare
### Data Source 
I will use Cyclistic’s historical trip data to analyze and identify trends. The previous 12 months of Cyclistic trip data can be downloaded [here](https://divvy-tripdata.s3.amazonaws.com/index.html). The data has been made available by Motivate International Inc. under this [license](https://ride.divvybikes.com/data-license-agreement).

This is public data that I will use to explore how different customer types are using Cyclistic bikes. Note: data-privacy issues prohibit from using riders’ personally identifiable information. This means that I will not be able to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes.

## Data Organization
There are 12 data files from August 2022 to July 2023 with naming convention of YYYYMM-divvy-tripdata and each file includes information for one month, such as the ride id, bike type, start time, end time, start station, end station, start location, end location, and whether the rider is a member or not.

# Process
BigQuery is used to combine 12-month data into one dataset and process it.

### Reason:
A Microsoft Excel worksheet can only handle up to 1,048,576 rows, which means it's not suitable for handling large amounts of data. Since the Cyclistic dataset contains over 5.6 million rows, it's important to use a platform like BigQuery, which is designed to handle massive amounts of data.

### Combining 12-month data
SQL Query: [Data Concatenation](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/blob/main/Data%20Concatenation.sql)
12 csv files are uploaded as tables in the dataset '2223_tripdata'. Another table named "2223_tripdata_combined" is created, containing 5723606 rows of data for the entire year.

## Data Exploration
SQL Query: [Data Exploration](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/blob/main/Data%20Exploration.sql)
Before cleaning the data, I familiarize myself with the dataset and look for inconsistencies.

### Observations
1. Checking data type and name of each column in the dataset

![image](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/blob/main/Column%20Names%20and%20Data%20Types.png)
   
2. The table below shows total number of rows and number of null values in all columns

![image](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/blob/main/Number%20of%20NULLs.png)

3. To further inspect my data I've used ride_id, since it had no NULL values. First check showed that there are no DUPLICATE rows in the dataset. Also, all ride_id values were same lenght, so there was nothing to clean.
4. There are 3 unique types of bikes in our dataset.

![image](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/blob/main/Ride%20types.png)

5. There are 2 unique subscription types in our dataset.

![image](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/blob/main/Subscription%20types.png)

6. Total of 868772 rows have both start_station_name and start_station_id as NULL values.
7. Total of 925008 rows have both end_station_name and end_station_id as NULL values.
8. Total of 6102 rows have both end_lat and end_lng as NULL values.
9. The started_at and ended_at timestamp structure shows start and end time of the trip in YYYY-MM-DD hh:mm:ss UTC format.
10. New column ride_length was created to find the total trip duration. There are 157013 trips which has duration longer than a day OR trips that are less than a minute duration.

## Data Cleaning

SQL Query: [Data Cleaning](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/blob/main/Data%20Cleaning.sql)

1. Rows that have NULL values were removed from the data.
2. Column with ride_lenght added.
3. Trips that are unusually short (less than 1 minute) or very long (more than a day) were removed during my analysis. Such trips might represent outliers or data entry errors that could distort the results of analysis.
4. Columns start_station_id and end_station_id removed from the table, because they are not relevant for current analysis.

# Analyze

SQL Query: [Data Analysis](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/blob/main/Data%20Analysis.sql)

# Share

SQL Query: [Data Visualizations](LINK)

