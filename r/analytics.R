# NorthStar Urban Mobility and Logistics
# R Analytics Script

# Load dataset
data <- read.csv("data/sample_data.csv")

# View structure of the dataset
str(data)

# Summary statistics
summary(data)

# Count deliveries by status
status_summary <- table(data$delivery_status)
print(status_summary)

# Calculate average delivery distance
average_distance <- mean(data$distance_km)
print(paste("Average delivery distance:", average_distance, "km"))

# Find the longest delivery route
longest_route <- data[which.max(data$distance_km), ]
print("Longest delivery route:")
print(longest_route)

# Basic bar chart of delivery status
barplot(
  status_summary,
  main = "Delivery Status Summary",
  xlab = "Delivery Status",
  ylab = "Number of Deliveries"
)
