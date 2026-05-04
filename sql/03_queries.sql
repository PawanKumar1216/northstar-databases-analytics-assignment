-- NorthStar Urban Mobility and Logistics
-- Analytical SQL Queries

USE northstar_logistics;

-- 1. View all deliveries with customer, driver, vehicle, and route details
SELECT
    d.delivery_id,
    c.customer_name,
    dr.driver_name,
    v.registration_number,
    v.vehicle_type,
    r.start_location,
    r.end_location,
    r.distance_km,
    d.delivery_date,
    d.delivery_status,
    d.delivery_cost
FROM deliveries d
JOIN customers c ON d.customer_id = c.customer_id
JOIN drivers dr ON d.driver_id = dr.driver_id
JOIN vehicles v ON d.vehicle_id = v.vehicle_id
JOIN routes r ON d.route_id = r.route_id;

-- 2. Count deliveries by delivery status
SELECT
    delivery_status,
    COUNT(*) AS total_deliveries
FROM deliveries
GROUP BY delivery_status;

-- 3. Calculate total delivery revenue
SELECT
    SUM(delivery_cost) AS total_revenue
FROM deliveries
WHERE delivery_status = 'Completed';

-- 4. Find delayed deliveries
SELECT
    d.delivery_id,
    c.customer_name,
    dr.driver_name,
    d.delivery_date,
    d.delivery_status
FROM deliveries d
JOIN customers c ON d.customer_id = c.customer_id
JOIN drivers dr ON d.driver_id = dr.driver_id
WHERE d.delivery_status = 'Delayed';

-- 5. Find average route distance
SELECT
    AVG(distance_km) AS average_distance_km
FROM routes;

-- 6. Find the most expensive completed deliveries
SELECT
    delivery_id,
    delivery_date,
    delivery_cost,
    delivery_status
FROM deliveries
WHERE delivery_status = 'Completed'
ORDER BY delivery_cost DESC;

-- 7. Total deliveries handled by each driver
SELECT
    dr.driver_name,
    COUNT(d.delivery_id) AS deliveries_handled
FROM drivers dr
LEFT JOIN deliveries d ON dr.driver_id = d.driver_id
GROUP BY dr.driver_name
ORDER BY deliveries_handled DESC;

-- 8. Vehicle usage report
SELECT
    v.registration_number,
    v.vehicle_type,
    COUNT(d.delivery_id) AS usage_count
FROM vehicles v
LEFT JOIN deliveries d ON v.vehicle_id = d.vehicle_id
GROUP BY v.registration_number, v.vehicle_type
ORDER BY usage_count DESC;
