USE northstar_logistics;

-- Full delivery report with related details
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
JOIN routes r ON d.route_id = r.route_id
ORDER BY d.delivery_date;

-- Number of deliveries by status
SELECT
    delivery_status,
    COUNT(*) AS total_deliveries
FROM deliveries
GROUP BY delivery_status
ORDER BY total_deliveries DESC;

-- Revenue from completed deliveries only
SELECT
    SUM(delivery_cost) AS completed_delivery_revenue
FROM deliveries
WHERE delivery_status = 'Completed';

-- Delayed deliveries
SELECT
    d.delivery_id,
    c.customer_name,
    dr.driver_name,
    d.delivery_date,
    d.delivery_status
FROM deliveries d
JOIN customers c ON d.customer_id = c.customer_id
JOIN drivers dr ON d.driver_id = dr.driver_id
WHERE d.delivery_status = 'Delayed'
ORDER BY d.delivery_date;

-- Average distance across all routes
SELECT
    ROUND(AVG(distance_km), 2) AS average_distance_km
FROM routes;

-- Completed deliveries ordered by cost
SELECT
    delivery_id,
    delivery_date,
    delivery_cost,
    delivery_status
FROM deliveries
WHERE delivery_status = 'Completed'
ORDER BY delivery_cost DESC;

-- Deliveries handled by each driver
SELECT
    dr.driver_name,
    COUNT(d.delivery_id) AS deliveries_handled
FROM drivers dr
LEFT JOIN deliveries d ON dr.driver_id = d.driver_id
GROUP BY dr.driver_id, dr.driver_name
ORDER BY deliveries_handled DESC;

-- Vehicle usage summary
SELECT
    v.registration_number,
    v.vehicle_type,
    COUNT(d.delivery_id) AS times_used
FROM vehicles v
LEFT JOIN deliveries d ON v.vehicle_id = d.vehicle_id
GROUP BY v.vehicle_id, v.registration_number, v.vehicle_type
ORDER BY times_used DESC;
