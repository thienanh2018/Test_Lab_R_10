
setwd("C:/Users/HP/lab10")
getwd()

# Create a dataframe
data <- read.csv("epiSEIHCRD_combAge.csv")

# Load first rows of data frame
head(data)

library(tidyverse)

# Filter data between July and December 2020
# Filter data: t between 120 days and 300 days
filtered_data <- data %>%
  filter(data$t >= 120 & data$t <= 300)

head(filtered_data)

# Plot the number of H
library(ggplot2)

ggplot(filtered_data, aes(x = filtered_data$t, y = filtered_data$H)) +
  geom_line() +
  labs(title = "Number of Hospital Beds Needed in Sydney (July-Dec 2020)",
       x = "Date",
       y = "Hospital Beds Needed")


# Display each month on the x axis
filtered_data$day <- c(120, 150, 180, 210, 240, 270, 300)
months <- c("July", "August", "September", "October", "November", "December", "January")
names(filtered_data$day) <- months
t <- filtered_data$day
t


# Plot Number of Hospital Beds by Months from July to Dec, 2020

ggplot(filtered_data, aes(x = t, y = filtered_data$H)) +
  geom_line() +
  labs(title = "Number of Hospital Beds Needed in Sydney (July-Dec 2020)",
       x = "Date",
       y = "Hospital Beds Needed")


# Plotting the number of hospital beds needed with a red line 
# and adding a legend

ggplot(filtered_data, aes(x = t, y = filtered_data$H, colour = "Hospital Beds Needed")) +
  geom_line() + # The legend is automatically added for color
  scale_color_manual(values = "red", labels = "Hospital Beds Needed") +
    labs(title = "Number of Hospital Beds Needed in Sydney (July-Dec 2020)",
       x = "Date",
       y = "Number of Beds")

head(filtered_data)

# Add the number of critical and dead to the plot

ggplot(filtered_data, aes(x = t)) +
  geom_line(aes(y = filtered_data$H), color = "red") +
  geom_line(aes(y = filtered_data$C), color = "green") +
  geom_line(aes(y = filtered_data$D), color = "black") +
  labs(title = "Number of Hospital Beds, Critical, and Dead in Sydney (July-Dec 2020)",
       x = "Date",
       y = "Count")

# Change the y-scale to square-root-scale

ggplot(filtered_data, aes(x = t)) +
  geom_line(aes(y = filtered_data$H), color = "red") +
  geom_line(aes(y = filtered_data$C), color = "green") +
  geom_line(aes(y = filtered_data$D), color = "black") +
  labs(title = "Number of Hospital Beds, Critical, and Dead in Sydney (July-Dec 2020)",
       x = "Date",
       y = "Count") +
  scale_y_sqrt()


# Update the plot so that the y axis has a log scale

ggplot(filtered_data, aes(x = t)) +
  geom_line(aes(y = H), color = "red") +
  geom_line(aes(y = C), color = "blue") +
  geom_line(aes(y = D), color = "black") +
  labs(title = "Number of Hospital Beds, Critical, and Dead in Sydney (July-Dec 2020)",
       x = "Date",
       y = "Count") +
  scale_y_log10()


# Add a simple line of code
print('Hello')




