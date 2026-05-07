-- NorthStar Urban Mobility and Logistics
-- Query optimisation and indexing examples

USE northstar_logistics;


-- 1. Index on delivery status
-- Helps optimise queries that filter or group deliveries by status.
CREATE INDEX idx_deliveries_status
ON deliveries(delivery_status);


-- 2. Index on delivery date
-- Helps optimise date-based delivery reporting.
CREATE INDEX idx_deliveries_date
ON deliveries(delivery_date);


-- 3. Index on customer ID in deliveries
-- Helps optimise joins between customers and deliveries.
CREATE INDEX idx_deliveries_customer_id
ON deliveries(customer_id);


-- 4. Index on driver ID in deliveries
-- Helps optimise joins between drivers and deliveries.
CREATE INDEX idx_deliveries_driver_id
ON deliveries(driver_id);


-- 5. Index on vehicle ID in deliveries
-- Helps optimise joins between vehicles and deliveries.
CREATE INDEX idx_deliveries_vehicle_id
ON deliveries(vehicle_id);


-- 6. Index on route ID in deliveries
-- Helps optimise joins between routes and deliveries.
CREATE INDEX idx_deliveries_route_id
ON deliveries(route_id);


-- 7. Composite index for status and date
-- Useful for queries that filter deliveries by status and date together.
CREATE INDEX idx_deliveries_status_date
ON deliveries(delivery_status, delivery_date);


-- 8. Example: check execution plan before/after indexing
EXPLAIN
SELECT
    delivery_id,
    delivery_date,
    delivery_status,
    delivery_cost
FROM deliveries
WHERE delivery_status = 'Delivered'
ORDER BY delivery_date;


-- 9. Example: optimised join query using indexed foreign keys
EXPLAIN
SELECT
    d.delivery_id,
    c.customer_name,
    dr.driver_name,
    v.vehicle_type,
    r.start_location,
    r.end_location,
    d.delivery_status,
    d.delivery_cost
FROM deliveries d
INNER JOIN customers c
    ON d.customer_id = c.customer_id
INNER JOIN drivers dr
    ON d.driver_id = dr.driver_id
INNER JOIN vehicles v
    ON d.vehicle_id = v.vehicle_id
INNER JOIN routes r
    ON d.route_id = r.route_id
WHERE d.delivery_status = 'Delivered'
ORDER BY d.delivery_date;


-- 10. Example: optimised aggregation query
EXPLAIN
SELECT
    delivery_status,
    COUNT(*) AS total_deliveries,
    AVG(delivery_cost) AS average_delivery_cost
FROM deliveries
GROUP BY delivery_status;