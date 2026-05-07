-- NorthStar Urban Mobility and Logistics
-- Relational database schema for delivery operations

CREATE DATABASE IF NOT EXISTS northstar_logistics;

USE northstar_logistics;


-- Customers table
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(120),
    customer_phone VARCHAR(30),
    customer_zone VARCHAR(50)
);


-- Drivers table
CREATE TABLE IF NOT EXISTS drivers (
    driver_id INT PRIMARY KEY,
    driver_name VARCHAR(100) NOT NULL,
    vehicle_type VARCHAR(50),
    driver_zone VARCHAR(50),
    availability_status VARCHAR(30)
);


-- Orders table
CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_status VARCHAR(40),
    order_value DECIMAL(10, 2),

    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);


-- Deliveries table
CREATE TABLE IF NOT EXISTS deliveries (
    delivery_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    driver_id INT NOT NULL,
    delivery_date DATE NOT NULL,
    delivery_zone VARCHAR(50),
    delivery_status VARCHAR(40),
    delivery_time_minutes INT,
    delivery_cost DECIMAL(10, 2),

    CONSTRAINT fk_deliveries_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    CONSTRAINT fk_deliveries_driver
        FOREIGN KEY (driver_id)
        REFERENCES drivers(driver_id)
);


-- Indexes for query optimisation
CREATE INDEX idx_orders_customer_id
ON orders(customer_id);

CREATE INDEX idx_deliveries_order_id
ON deliveries(order_id);

CREATE INDEX idx_deliveries_driver_id
ON deliveries(driver_id);

CREATE INDEX idx_deliveries_zone
ON deliveries(delivery_zone);

CREATE INDEX idx_deliveries_status
ON deliveries(delivery_status);

CREATE INDEX idx_deliveries_date
ON deliveries(delivery_date);