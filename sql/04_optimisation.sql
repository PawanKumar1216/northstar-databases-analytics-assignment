-- NorthStar Urban Mobility and Logistics
-- Query Optimisation Script

USE northstar_logistics;

-- Index on delivery status to improve filtering of completed, delayed, and cancelled deliveries
CREATE INDEX idx_deliveries_status
ON deliveries(delivery_status);

-- Index on delivery date to improve date-based reporting queries
CREATE INDEX idx_deliveries_date
ON deliveries(delivery_date);

-- Index on customer ID to improve joins between customers and deliveries
CREATE INDEX idx_deliveries_customer
ON deliveries(customer_id);

-- Index on driver ID to improve driver performance reporting
CREATE INDEX idx_deliveries_driver
ON deliveries(driver_id);

-- Index on vehicle ID to improve vehicle usage reporting
CREATE INDEX idx_deliveries_vehicle
ON deliveries(vehicle_id);

-- Example optimised query using indexed delivery_status column
SELECT
    delivery_id,
    delivery_date,
    delivery_status,
    delivery_cost
FROM deliveries
WHERE delivery_status = 'Completed'
ORDER BY delivery_date DESC;

-- Example optimised query using indexed driver_id column
SELECT
    driver_id,
    COUNT(delivery_id) AS total_deliveries
FROM deliveries
GROUP BY driver_id
ORDER BY total_deliveries DESC;
