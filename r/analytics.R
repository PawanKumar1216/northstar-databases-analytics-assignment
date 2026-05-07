# NorthStar Delivery Operations Analytics
# This script performs basic analytics on the delivery operations dataset.

library(readr)
library(dplyr)
library(ggplot2)


# Load dataset
deliveries <- read_csv("data/deliveries.csv")


# Clean and prepare dataset
deliveries <- deliveries %>%
  distinct() %>%
  mutate(
    delivery_date = as.Date(delivery_date),
    delivery_cost = as.numeric(delivery_cost),
    delivery_time_minutes = as.numeric(delivery_time_minutes)
  ) %>%
  na.omit()


# Summary statistics
total_deliveries <- nrow(deliveries)

average_delivery_time <- mean(deliveries$delivery_time_minutes)
average_delivery_cost <- mean(deliveries$delivery_cost)

deliveries_by_status <- deliveries %>%
  count(delivery_status, name = "total_deliveries")

deliveries_by_zone <- deliveries %>%
  count(delivery_zone, name = "total_deliveries")


# Print summary outputs
cat("NorthStar Delivery Operations Analytics\n")
cat("--------------------------------------\n")
cat("Total deliveries:", total_deliveries, "\n")
cat("Average delivery time:", round(average_delivery_time, 2), "minutes\n")
cat("Average delivery cost: £", round(average_delivery_cost, 2), "\n\n", sep = "")

cat("Deliveries by status:\n")
print(deliveries_by_status)

cat("\nDeliveries by zone:\n")
print(deliveries_by_zone)


# Visualisation 1: Deliveries by status
ggplot(deliveries_by_status, aes(x = delivery_status, y = total_deliveries)) +
  geom_col() +
  labs(
    title = "Deliveries by Status",
    x = "Delivery Status",
    y = "Number of Deliveries"
  ) +
  theme_minimal()


# Visualisation 2: Deliveries by zone
ggplot(deliveries_by_zone, aes(x = delivery_zone, y = total_deliveries)) +
  geom_col() +
  labs(
    title = "Deliveries by Zone",
    x = "Delivery Zone",
    y = "Number of Deliveries"
  ) +
  theme_minimal()


# Visualisation 3: Delivery time distribution
ggplot(deliveries, aes(x = delivery_time_minutes)) +
  geom_histogram(bins = 10) +
  labs(
    title = "Distribution of Delivery Times",
    x = "Delivery Time (Minutes)",
    y = "Frequency"
  ) +
  theme_minimal()