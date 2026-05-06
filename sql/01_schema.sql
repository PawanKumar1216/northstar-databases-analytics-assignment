CREATE DATABASE IF NOT EXISTS northstar_logistics;
USE northstar_logistics;

DROP TABLE IF EXISTS deliveries;
DROP TABLE IF EXISTS routes;
DROP TABLE IF EXISTS vehicles;
DROP TABLE IF EXISTS drivers;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    city VARCHAR(50)
);

CREATE TABLE drivers (
    driver_id INT PRIMARY KEY AUTO_INCREMENT,
    driver_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    licence_number VARCHAR(50) UNIQUE NOT NULL,
    employment_status VARCHAR(30) DEFAULT 'Active'
);

CREATE TABLE vehicles (
    vehicle_id INT PRIMARY KEY AUTO_INCREMENT,
    registration_number VARCHAR(30) UNIQUE NOT NULL,
    vehicle_type VARCHAR(50),
    capacity_kg DECIMAL(10,2),
    vehicle_status VARCHAR(30) DEFAULT 'Available'
);

CREATE TABLE routes (
    route_id INT PRIMARY KEY AUTO_INCREMENT,
    start_location VARCHAR(100) NOT NULL,
    end_location VARCHAR(100) NOT NULL,
    distance_km DECIMAL(10,2) NOT NULL,
    estimated_time_minutes INT
);

CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    driver_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    route_id INT NOT NULL,
    delivery_date DATE NOT NULL,
    delivery_status VARCHAR(30) NOT NULL,
    delivery_cost DECIMAL(10,2),

    CONSTRAINT fk_delivery_customer
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id),

    CONSTRAINT fk_delivery_driver
        FOREIGN KEY (driver_id) REFERENCES drivers(driver_id),

    CONSTRAINT fk_delivery_vehicle
        FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id),

    CONSTRAINT fk_delivery_route
        FOREIGN KEY (route_id) REFERENCES routes(route_id)
);
