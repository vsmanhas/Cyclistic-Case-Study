# Load the package

install.packages("tidyverse")
library(tidyverse)

# Set your directory
setwd("C:/Users/91700/OneDrive/Desktop/csv")

# 1. Create a list of all the CSV file names in your folder
file_list <- list.files(pattern = "*.csv")

# 2. Read all those files and bind them into one single dataframe
all_trips <- read_csv(file_list)

# Look at the column names
colnames(all_trips)

# See a quick summary of the massive dataset 
glimpse(all_trips)

# Proceess phase
all_trips_v2 <- all_trips %>%
  mutate(
    # NEW COLUMN 1: 'ride_length'
    ride_length = difftime(ended_at, started_at, units = "mins"),
    
  )

all_trips_v2$ride_length <- as.numeric(as.character(all_trips_v2$ride_length))

all_trips_cleaned <- all_trips_v2 %>%
  filter(ride_length > 0) %>%
  drop_na()

all_trips_cleaned <- all_trips_cleaned %>%
  mutate(day_of_week = wday(started_at, label = TRUE, abbr = FALSE))
# Analyse phase
summary_stats <- all_trips_cleaned %>%
  group_by(member_casual) %>%
  summarise(
    # Calculate the average (mean) ride length
    average_ride_length = mean(ride_length),
    
  )
print(summary_stats)

library(lubridate)
colnames(all_trips_cleaned)

all_trips_cleaned$day_of_week <- ordered(all_trips_cleaned$day_of_week, levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))

rides_by_day <- all_trips_cleaned %>%
  group_by(member_casual, day_of_week) %>%
  summarise(
    number_of_rides = n(),
    average_duration = mean(ride_length),
    .groups = 'drop'
  ) %>%
  arrange(member_casual, day_of_week)

print(rides_by_day)
# Share phase
all_trips_cleaned %>%
  group_by(member_casual, day_of_week) %>%
  summarise(number_of_rides = n(), .groups = 'drop') %>%
  ggplot(aes(x = day_of_week, y = number_of_rides, fill = member_casual)) +
  geom_col(position = "dodge") +
  labs(
    title = "Total Rides by Day of the Week",
    subtitle = "Annual Members vs. Casual Riders",
    x = "Day of the Week",
    y = "Number of Rides",
    fill = "Rider Type"
  ) +
  theme_minimal()

all_trips_cleaned %>%
  group_by(member_casual, day_of_week) %>%
  summarise(average_duration = mean(ride_length), .groups = 'drop') %>%
  ggplot(aes(x = day_of_week, y = average_duration, fill = member_casual)) +
  geom_col(position = "dodge") +
  labs(
    title = "Average Ride Length by Day of the Week",
    subtitle = "Annual Members vs. Casual Riders",
    x = "Day of the Week",
    y = "Average Duration (Minutes)",
    fill = "Rider Type"
  ) +
  theme_minimal()

ggsave("average_ride_length.png", width = 8, height = 6, dpi = 300)
ggsave("total_rides.png", width = 8, height = 6, dpi = 300)