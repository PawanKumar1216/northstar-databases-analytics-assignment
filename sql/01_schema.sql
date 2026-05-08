-- NorthStar Urban Mobility and Logistics
-- Relational database schema for delivery operations

DROP DATABASE IF EXISTS northstar_logistics;
CREATE DATABASE northstar_logistics;
USE northstar_logistics;

-- Customers table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    city VARCHAR(50) NOT NULL
);

-- Drivers table
CREATE TABLE drivers (
    driver_id INT AUTO_INCREMENT PRIMARY KEY,
    driver_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    licence_number VARCHAR(50) NOT NULL UNIQUE,
    employment_status VARCHAR(20) NOT NULL
);

-- Vehicles table
CREATE TABLE vehicles (
    vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
    registration_number VARCHAR(50) NOT NULL UNIQUE,
    vehicle_type VARCHAR(50) NOT NULL,
    capacity_kg DECIMAL(10,2) NOT NULL,
    vehicle_status VARCHAR(30) NOT NULL
);

-- Routes table
CREATE TABLE routes (
    route_id INT AUTO_INCREMENT PRIMARY KEY,
    start_location VARCHAR(100) NOT NULL,
    end_location VARCHAR(100) NOT NULL,
    distance_km DECIMAL(10,2) NOT NULL,
    estimated_time_minutes INT NOT NULL
);

-- Deliveries table
CREATE TABLE deliveries (
    delivery_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    driver_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    route_id INT NOT NULL,
    delivery_date DATE NOT NULL,
    delivery_status VARCHAR(30) NOT NULL,
    delivery_cost DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_deliveries_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    CONSTRAINT fk_deliveries_driver
        FOREIGN KEY (driver_id)
        REFERENCES drivers(driver_id),

    CONSTRAINT fk_deliveries_vehicle
        FOREIGN KEY (vehicle_id)
        REFERENCES vehicles(vehicle_id),

    CONSTRAINT fk_deliveries_route
        FOREIGN KEY (route_id)
        REFERENCES routes(route_id)
);

-- Check created tables
SHOW TABLES;

-- Check table structures
DESCRIBE customers;
DESCRIBE drivers;
DESCRIBE vehicles;
DESCRIBE routes;
DESCRIBE deliveries;
