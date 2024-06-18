
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


