-- NorthStar Urban Mobility and Logistics
-- Database Schema

CREATE DATABASE IF NOT EXISTS northstar_logistics;
USE northstar_logistics;

-- Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    city VARCHAR(50)
);

-- Drivers table
CREATE TABLE drivers (
    driver_id INT PRIMARY KEY AUTO_INCREMENT,
    driver_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    licence_number VARCHAR(50) UNIQUE NOT NULL,
    employment_status VARCHAR(30) DEFAULT 'Active'
);

-- Vehicles table
CREATE TABLE vehicles (
    vehicle_id INT PRIMARY KEY AUTO_INCREMENT,
    registration_number VARCHAR(30) UNIQUE NOT NULL,
    vehicle_type VARCHAR(50),
    capacity_kg DECIMAL(10,2),
    status VARCHAR(30) DEFAULT 'Available'
);

-- Routes table
CREATE TABLE routes (
    route_id INT PRIMARY KEY AUTO_INCREMENT,
    start_location VARCHAR(100) NOT NULL,
    end_location VARCHAR(100) NOT NULL,
    distance_km DECIMAL(10,2) NOT NULL,
    estimated_time_minutes INT
);

-- Deliveries table
CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    driver_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    route_id INT NOT NULL,
    delivery_date DATE NOT NULL,
    delivery_status VARCHAR(30) NOT NULL,
    delivery_cost DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id),
    FOREIGN KEY (route_id) REFERENCES routes(route_id)
);
