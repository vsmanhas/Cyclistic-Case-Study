# Cyclistic Bike-Share Analysis: Converting Casual Riders to Members

## 🚲 Project Overview
This project is the Capstone for the Google Data Analytics Professional Certificate. The goal is to analyze the historical trip data of a bike-share company (Cyclistic) to understand how different types of customers (Annual Members vs. Casual Riders) use the service. 

**Business Task:** Identify riding trends to design a new marketing strategy aimed at converting casual riders into profitable annual members.

## 🛠️ Tools Used
* **Data Cleaning & Analysis:** R (tidyverse, lubridate)
* **Data Visualization:** R (ggplot2)

## 🧹 Data Preparation
* Downloaded 12 months of raw historical trip data (millions of rows).
* Combined multiple monthly CSV files into a single master dataframe.
* Cleaned the data by removing rides with negative durations and null values.
* Engineered new data variables for `ride_length` (duration in minutes) and `day_of_week`.

## 📊 Analysis & Visualizations

### 1. Total Volume: Which days are busiest?
![Total Rides](your_total_rides_image.png)

**Insight:** Casual riders peak heavily on the weekends, while annual members consistently use the bikes during the workweek (indicating commuter behavior).

### 2. Ride Duration: Who rides longer?
![Average Length](your_average_length_image.png)

**Insight:** Casual riders take significantly longer rides on average than annual members, regardless of the day of the week.

## 💡 Key Recommendations
Based on the data insights, here are three actionable marketing strategies to increase membership conversions:
1. **Launch a Weekend-Only Membership:** Since casual riders primarily use the service on Saturdays and Sundays, a specialized weekend tier would capture this specific audience.
2. **Promote Duration-Based Savings:** Casual riders hold onto bikes for longer periods. Marketing campaigns should highlight exactly how much money they would save on these long trips if they upgraded to an annual membership.
3. **Targeted Friday Campaigns:** Push digital ads and app notifications to casual riders on Friday afternoons to catch them right before their peak usage days begin.
