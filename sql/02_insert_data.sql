-- NorthStar Urban Mobility and Logistics
-- Sample Data Insertion

USE northstar_logistics;

INSERT INTO customers (customer_name, email, phone, city) VALUES
('Urban Retail Ltd', 'contact@urbanretail.com', '07123456789', 'London'),
('Metro Supplies', 'info@metrosupplies.com', '07234567890', 'Birmingham'),
('City Fresh Foods', 'support@cityfresh.com', '07345678901', 'Manchester'),
('QuickCart Online', 'admin@quickcart.com', '07456789012', 'Leeds'),
('NorthPoint Stores', 'hello@northpoint.com', '07567890123', 'Liverpool');

INSERT INTO drivers (driver_name, phone, licence_number, employment_status) VALUES
('Amit Sharma', '07111111111', 'LIC1001', 'Active'),
('Sarah Khan', '07222222222', 'LIC1002', 'Active'),
('James Wilson', '07333333333', 'LIC1003', 'Active'),
('Priya Patel', '07444444444', 'LIC1004', 'Inactive'),
('Daniel Brown', '07555555555', 'LIC1005', 'Active');

INSERT INTO vehicles (registration_number, vehicle_type, capacity_kg, status) VALUES
('NSV001', 'Van', 1200.00, 'Available'),
('NSV002', 'Truck', 5000.00, 'In Use'),
('NSV003', 'Electric Van', 1000.00, 'Available'),
('NSV004', 'Truck', 7000.00, 'Maintenance'),
('NSV005', 'Bike', 100.00, 'Available');

INSERT INTO routes (start_location, end_location, distance_km, estimated_time_minutes) VALUES
('North Hub', 'Central Depot', 12.50, 35),
('East Hub', 'West Depot', 18.20, 50),
('South Hub', 'North Depot', 25.70, 75),
('Central Hub', 'East Depot', 9.80, 25),
('West Hub', 'South Depot', 14.30, 40);

INSERT INTO deliveries (
    customer_id,
    driver_id,
    vehicle_id,
    route_id,
    delivery_date,
    delivery_status,
    delivery_cost
) VALUES
(1, 1, 1, 1, '2026-04-01', 'Completed', 45.00),
(2, 2, 2, 2, '2026-04-02', 'Completed', 80.00),
(3, 3, 3, 3, '2026-04-03', 'Delayed', 110.00),
(4, 5, 5, 4, '2026-04-04', 'Completed', 35.00),
(5, 1, 1, 5, '2026-04-05', 'Cancelled', 60.00),
(1, 2, 2, 3, '2026-04-06', 'Completed', 120.00),
(2, 3, 3, 1, '2026-04-07', 'Delayed', 55.00),
(3, 5, 5, 2, '2026-04-08', 'Completed', 75.00);
