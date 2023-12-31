# Data-Analytics-Cyclistic-Case-Study

# Introduction
In this case study, I will perform real-world tasks of a data analyst at a fictional company, Cyclistic. In order to answer the key business questions, I will follow the steps of the data analysis process: [Ask](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/blob/main/README.md#Ask), [Prepare](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/blob/main/README.md#Prepare), [Process](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/blob/main/README.md#Process), [Analyze](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/blob/main/README.md#Analyze), [Share](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/blob/main/README.md#Share), and [Act](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/blob/main/README.md#Act).

## Quick Links:
Data Source: [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html)[accessed on 21/08/23]

SQL Queries:
01. [Data Concatenation](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/blob/main/Data%20Concatenation.sql)
02. [Data Exploration](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/blob/main/Data%20Exploration.sql)
03. [Data Cleaning](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/blob/main/Data%20Cleaning.sql)
04. [Data Analysis](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/blob/main/Data%20Analysis.sql)
05. [Data Visualizations](https://public.tableau.com/app/profile/gytis.grigeliunas/viz/UserEngagement_16930401155740/UserAndBikeTypes#1)

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

![Column Names and Data Types](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/assets/142784659/85e7f9f7-32cb-40fb-ad26-c7dfe39e8147)
   
2. The table below shows total number of rows and number of null values in all columns

![Number of NULLs](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/assets/142784659/5b399d2f-db3d-4539-b86b-908416b03e99)


3. To further inspect my data I've used ride_id, since it had no NULL values. First check showed that there are no DUPLICATE rows in the dataset. Also, all ride_id values were same lenght, so there was nothing to clean.
4. There are 3 unique types of bikes in our dataset.

![Ride types](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/assets/142784659/22fa5282-0d70-430c-8756-29b4c56192ea)


5. There are 2 unique subscription types in our dataset.

![Subscription types](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/assets/142784659/868c04c2-68a9-4779-b452-f796c1b4232c)

6. Total of 868772 rows have both start_station_name and start_station_id as NULL values.
7. Total of 925008 rows have both end_station_name and end_station_id as NULL values.
8. Total of 6102 rows have both end_lat and end_lng as NULL values.
9. No negative values displayed during check.
10. The started_at and ended_at timestamp structure shows start and end time of the trip in YYYY-MM-DD hh:mm:ss UTC format.
11. New column ride_length was created to find the total trip duration. There are 157013 trips which has duration longer than a day OR trips that are less than a minute duration.

## Data Cleaning

SQL Query: [Data Cleaning](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/blob/main/Data%20Cleaning.sql)

1. Rows that have NULL values were removed from the data.
2. Column with ride_lenght added.
3. Trips that are unusually short (less than 1 minute) or very long (more than a day) were removed during my analysis. Such trips might represent outliers or data entry errors that could distort the results of analysis.
4. Columns start_station_id and end_station_id removed from the table, because they are not relevant for current analysis.

# Analyze

SQL Query: [Data Analysis](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/blob/main/Data%20Analysis.sql)

Multiple queries were run and tables created for data analysis to help and answer analysis questions "How do annual members and casual riders use Cyclistic bikes differently?", breakdown of analysis is as follows:

1. Examined the distribution of rideable types (bike types) among member and casual riders. It counts the number of rides for each combination of rideable type and user type.
2. Analyzed the ride frequency over different months, broken down by member and casual riders. It provides insight into how riding patterns vary throughout the year for both user types.
3. Compared the total number of trips taken by member and casual riders on weekdays and weekends. It helps identify if there are differences in riding habits based on the day of the week.
4. Investigated the distribution of rides throughout the day, categorized by the hour of the day and user type. It highlights peak hours of usage for both member and casual riders.
5. Calculated the average ride duration for different time intervals (month, weekday, and hour) for both member and casual riders. This analysis provides insights into the typical ride lengths at different times.
6. Start station location query provides the average latitude and longitude of start stations, along with the total number of rides for each combination of start station and user type. It gives insights into the geographical distribution of rides.
7. Similar to the previous query, this one focuses on the location analysis of end stations. It provides information about the average latitude and longitude of end stations and the total number of rides for each combination of end station and user type.

These queries collectively provide a comprehensive analysis of the data, helping understand user behavior, preferences, and trends. The findings from these queries will guide decision-making process when crafting strategies to convert casual riders into annual members.

# Share

SQL Query: [Data Visualizations](https://public.tableau.com/app/profile/gytis.grigeliunas/viz/UserEngagement_16930401155740/UserAndBikeTypes#1)


This visualization showcases the distribution of rideable types (bike types) among Cyclistic users. By categorizing the rides into member and casual riders, it offers an insightful perspective on the bike preferences of different user segments.

![User And Bike Types](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/assets/142784659/4e966a3a-178a-4ded-a632-a9727689a2e9)

The visualization highlights distribution in user rides, with 63% of rides completed by loyal members and 37% by casual riders. Classic and Electric bike types emerge as the favored choices, with Docked bikes only being used by casual riders.

Following visualization presents trends of ride activity throughout the year. We can see how the number of trips varies across months, days of the week, and hours of the day, broken down by user type. This allows to pinpoint when the bike-share service experiences peak demand and when user engagement is higher for members versus casual riders.

![Trips per Month_Day_Hour](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/assets/142784659/c6855c36-5ab1-4ae3-8614-7d5f84327ab2)

Analyzing **monthly** trip patterns reveals a trend in behavior between casual and member riders. Both groups complete higher trip counts during spring and summer, aligning with favorable weather conditions.

Comparing **days of the week**, a distinct usage pattern emerges. Casual riders tend to favor weekends, with increased journeys, while member riders show reduced activity over the weekend compared to other weekdays.

Examining the **hourly** trip distribution for members reveals two distinct peaks. The first occurs during the early morning hours, around 7 am to 8 am, indicating likely usage for commutes. The second peak emerges in the late afternoon, from 4 pm to 6 pm. In contrast, casual riders show consistent increase in trips throughout the day until peaking around 5 pm, followed by a decline.

Members' ride patterns align with workweek commutes, evident from dual peaks during early mornings and late afternoons on weekdays. In contrast, casual riders exhibit a leisure-oriented approach, maintaining consistent daytime activity that peaks on weekends. Notably, both user types show higher participation during the summer and spring seasons, underlining the significance of favorable weather conditions.

To move further with analysis, this visualization complements the previous one by illustrating the average number of trips rather than raw counts. By focusing on averages, one can identify consistent patterns and trends.

![Avg Trips per Month_Day_Hour](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/assets/142784659/a9960523-24bd-4aac-bb2f-6bc147d3f3fb)

**Monthly** data highlights that casual riders consistently have longer average journey durations compared to members. Casual riders journey length incereases during the summer months, while members maintain consistent average journey durations year-round.

Analyzing **weekly** data shows that member average journey times remain consistent. However, journey lengths increase over the weekends among casual riders.

**Hourly** data confirms the stability of member average journey times across the day. Casual rider journey lengths rising during midday hours. 

These findings lead to the conclusion that Casual riders take longer trips on weekends and midday hours, favoring leisure. Members maintain steady journey times for regular use.

To further understand the differences in casual and member riders, locations of starting and ending stations can be analysed. With this visualization, we gain insights into where both member and casual riders typically begin their trips. By showcasing the most popular start stations for each user type, decisions can be made towards tailored marketing efforts to promote membership at these stations or strategically expand stations based on demand.

![User Start Stations](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/assets/142784659/92a24b10-712d-4667-88e3-4cd5da96f875)

Casual Riders start trips in central, scenic locations like parks and coastlines, highlightin leisure activities. Member Riders start trips near train stations, universities, and residential areas, highlighting commuting and routine travel.

Similar to the previous visualization, this one sheds light on the preferred end stations for Cyclistic users. It provides valuable information about the destinations of both member and casual riders, helping identify potential opportunities for location-specific campaigns.

![User End Stations](https://github.com/GytisGrig/Data-Analytics-Cyclistic-Case-Study/assets/142784659/bd8127a2-5060-4750-92d6-5a7f9f9aeb9d)

Similar trends can be observed when looking at end stations. Casual riders tend to end their journeys near parks and coastlines, while member riders often end their trips near universities, residential areas, and train stations.

### Summary:

1. Member riders constitute 63% of total rides, showcasing strong loyalty to Cyclistic.
2. Both member and casual riders prefer spring and summer for increased ride activity.
3. Members travel more often, but Casual riders travel longer.
4. Casual riders show patterns favoring leisure, weekend-oriented usage, journey lengths increase on weekends and during midday hours.
5. Member riders show patterns favoring commute, journey times remain consistent across the year and have two usage peaks: early mornings and late afternoons on weekdays.
6. Start and End station preferences differ: casual riders favor central and scenic spots, while members choose areas near transit and education hubs.

# Act

After analyzing differences between casual and member riders, these are actionable strategies that can encourage casual riders to transition to Cyclistic membership:

1. Seasonal Appeals: Develop campaigns focusing on peak riding seasons, showcasing membership convenience.
2. Weekend Plans: Design weekend-specific membership options for casual riders' leisurely preferences.
3. Enhanced App Features: Improve the app with route recommendations and attraction insights.
4. Community Events: Organize gatherings to foster a sense of belonging and loyalty.
5. Ride Rewards Program: Implement a loyalty program that rewards casual riders with points for each ride. Accumulated points can be redeemed for discounts on annual memberships, encouraging them to transition to regular ridership.
6. Referral Bonuses: Incentivize existing members to refer casual riders to join as members. Offer referral bonuses or discounts to both the referrer and the new member upon successful conversion.

