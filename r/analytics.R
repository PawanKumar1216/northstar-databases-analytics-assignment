data <- read.csv("data/sample_data.csv")

print("Dataset structure")
str(data)

print("Summary statistics")
print(summary(data))

status_summary <- table(data$delivery_status)

print("Delivery status count")
print(status_summary)

average_distance <- mean(data$distance_km, na.rm = TRUE)

print(paste("Average delivery distance:", round(average_distance, 2), "km"))

longest_route <- data[which.max(data$distance_km), ]

print("Longest route")
print(longest_route)

barplot(
  status_summary,
  main = "Deliveries by Status",
  xlab = "Delivery Status",
  ylab = "Number of Deliveries"
)
