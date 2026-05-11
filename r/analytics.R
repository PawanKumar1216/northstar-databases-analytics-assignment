# NorthStar Urban Mobility and Logistics
# R analytics script

# Load the main operational datasets
deliveries <- read.csv("data/deliveries.csv")
drivers <- read.csv("data/drivers.csv")
vehicles <- read.csv("data/vehicles.csv")
hubs <- read.csv("data/hubs.csv")

# Display dataset structure
cat("DELIVERIES DATASET STRUCTURE\n")
str(deliveries)

cat("\nDRIVERS DATASET STRUCTURE\n")
str(drivers)

cat("\nVEHICLES DATASET STRUCTURE\n")
str(vehicles)

cat("\nHUBS DATASET STRUCTURE\n")
str(hubs)

# Basic delivery analysis
cat("\nDELIVERY STATUS COUNTS\n")
print(table(deliveries$delivery_status))

cat("\nAVERAGE ROUTE DISTANCE\n")
print(round(mean(deliveries$route_distance_km, na.rm = TRUE), 2))

cat("\nAVERAGE FUEL OR CHARGE COST\n")
print(round(mean(deliveries$fuel_or_charge_cost, na.rm = TRUE), 2))

cat("\nAVERAGE CUSTOMER RATING BY DELIVERY STATUS\n")
print(
  aggregate(
    customer_rating_post_delivery ~ delivery_status,
    data = deliveries,
    FUN = function(x) round(mean(x, na.rm = TRUE), 2)
  )
)

# Hub-level summary
hub_summary <- aggregate(
  cbind(route_distance_km, fuel_or_charge_cost) ~ hub_id,
  data = deliveries,
  FUN = function(x) round(mean(x, na.rm = TRUE), 2)
)

delivery_counts_by_hub <- as.data.frame(table(deliveries$hub_id))
colnames(delivery_counts_by_hub) <- c("hub_id", "total_deliveries")

delayed_counts_by_hub <- as.data.frame(
  table(deliveries$hub_id[deliveries$delivery_status == "Delayed"])
)
colnames(delayed_counts_by_hub) <- c("hub_id", "delayed_deliveries")

hub_summary <- merge(hub_summary, delivery_counts_by_hub, by = "hub_id", all.x = TRUE)
hub_summary <- merge(hub_summary, delayed_counts_by_hub, by = "hub_id", all.x = TRUE)
hub_summary$delayed_deliveries[is.na(hub_summary$delayed_deliveries)] <- 0

cat("\nHUB PERFORMANCE SUMMARY\n")
print(hub_summary[order(-hub_summary$delayed_deliveries), ])

# Simple visualisation
barplot(
  table(deliveries$delivery_status),
  main = "Delivery Status Distribution",
  xlab = "Delivery Status",
  ylab = "Number of Deliveries"
)
