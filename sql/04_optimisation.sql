USE northstar_logistics;

CREATE INDEX idx_delivery_status
ON deliveries(delivery_status);

CREATE INDEX idx_delivery_date
ON deliveries(delivery_date);

CREATE INDEX idx_delivery_customer
ON deliveries(customer_id);

CREATE INDEX idx_delivery_driver
ON deliveries(driver_id);

CREATE INDEX idx_delivery_vehicle
ON deliveries(vehicle_id);

CREATE INDEX idx_delivery_route
ON deliveries(route_id);

-- Query that benefits from the delivery_status index
SELECT
    delivery_id,
    delivery_date,
    delivery_status,
    delivery_cost
FROM deliveries
WHERE delivery_status = 'Completed'
ORDER BY delivery_date DESC;

-- Query that benefits from the driver_id index
SELECT
    driver_id,
    COUNT(*) AS total_deliveries
FROM deliveries
GROUP BY driver_id
ORDER BY total_deliveries DESC;
