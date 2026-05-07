-- NorthStar Urban Mobility and Logistics
-- Sample data inserts for delivery operations database

USE northstar_logistics;


-- Insert customers
INSERT INTO customers (customer_name, email, phone, city) VALUES
('Aisha Khan', 'aisha.khan@example.com', '07123456781', 'London'),
('James Wilson', 'james.wilson@example.com', '07123456782', 'Manchester'),
('Priya Patel', 'priya.patel@example.com', '07123456783', 'Birmingham'),
('Daniel Brown', 'daniel.brown@example.com', '07123456784', 'Leeds'),
('Sofia Ahmed', 'sofia.ahmed@example.com', '07123456785', 'London'),
('Michael Green', 'michael.green@example.com', '07123456786', 'Liverpool'),
('Emily Clarke', 'emily.clarke@example.com', '07123456787', 'Bristol'),
('Omar Hussain', 'omar.hussain@example.com', '07123456788', 'Sheffield'),
('Grace Taylor', 'grace.taylor@example.com', '07123456789', 'Nottingham'),
('Liam Johnson', 'liam.johnson@example.com', '07123456790', 'London');


-- Insert drivers
INSERT INTO drivers (driver_name, phone, licence_number, employment_status) VALUES
('Raj Singh', '07234567891', 'LIC1001', 'Active'),
('Tom Evans', '07234567892', 'LIC1002', 'Active'),
('Nadia Ali', '07234567893', 'LIC1003', 'Active'),
('Chris Martin', '07234567894', 'LIC1004', 'Inactive'),
('Fatima Begum', '07234567895', 'LIC1005', 'Active');


-- Insert vehicles
INSERT INTO vehicles (registration_number, vehicle_type, capacity_kg, vehicle_status) VALUES
('NS01 VAN', 'Van', 1200.00, 'Available'),
('NS02 VAN', 'Van', 1100.00, 'Available'),
('NS03 BIKE', 'Motorbike', 80.00, 'Available'),
('NS04 TRUCK', 'Truck', 3000.00, 'In Service'),
('NS05 EV', 'Electric Van', 1000.00, 'Available');


-- Insert routes
INSERT INTO routes (start_location, end_location, distance_km, estimated_time_minutes) VALUES
('Warehouse A', 'London Central', 12.50, 35),
('Warehouse A', 'London East', 18.20, 50),
('Warehouse B', 'Manchester Central', 15.00, 40),
('Warehouse B', 'Birmingham North', 22.70, 65),
('Warehouse C', 'Leeds City Centre', 10.80, 30),
('Warehouse C', 'Liverpool South', 28.40, 75),
('Warehouse A', 'Bristol Centre', 32.10, 90),
('Warehouse B', 'Sheffield West', 20.60, 55);


-- Insert deliveries
INSERT INTO deliveries (
    customer_id,
    driver_id,
    vehicle_id,
    route_id,
    delivery_date,
    delivery_status,
    delivery_cost
) VALUES
(1, 1, 1, 1, '2026-04-01', 'Delivered', 18.50),
(2, 2, 2, 3, '2026-04-01', 'Delivered', 22.00),
(3, 3, 5, 4, '2026-04-02', 'Delayed', 31.75),
(4, 1, 1, 5, '2026-04-02', 'Delivered', 16.40),
(5, 5, 5, 2, '2026-04-03', 'In Transit', 24.90),
(6, 2, 4, 6, '2026-04-03', 'Delivered', 38.20),
(7, 3, 2, 7, '2026-04-04', 'Cancelled', 0.00),
(8, 5, 3, 8, '2026-04-04', 'Delivered', 21.60),
(9, 1, 1, 5, '2026-04-05', 'Delivered', 17.25),
(10, 2, 5, 1, '2026-04-05', 'Delayed', 19.80),
(1, 3, 3, 2, '2026-04-06', 'Delivered', 23.10),
(2, 5, 2, 3, '2026-04-06', 'In Transit', 22.50),
(3, 1, 1, 4, '2026-04-07', 'Delivered', 30.40),
(4, 2, 4, 6, '2026-04-07', 'Delivered', 39.00),
(5, 3, 5, 7, '2026-04-08', 'Delayed', 34.25);