# NorthStar Urban Mobility and Logistics Report

## 1. Introduction

This report explains the database and analytics work completed for the NorthStar Urban Mobility and Logistics case study. The aim of the project is to design and implement a small logistics data solution that demonstrates relational database design, SQL querying, query optimisation, Python data processing, R analytics, and MongoDB document-based querying.

The project uses a sample logistics dataset containing delivery trips, vehicles, drivers, route locations, delivery distances, and delivery statuses. The work is organised into separate folders for SQL, Python, R, MongoDB, data, screenshots, and report documentation.

## 2. Project Objectives

The main objectives of this project are:

- To design a relational database for a logistics business scenario.
- To create tables with appropriate primary keys and foreign keys.
- To insert realistic sample data into the database.
- To write SQL queries for business analysis.
- To demonstrate query optimisation using indexes.
- To process and clean logistics data using Python.
- To perform basic analytics and visualisation using R.
- To demonstrate document-based storage and querying using MongoDB.
- To present the work clearly using GitHub documentation and evidence screenshots.

## 3. Relational Database Design

The relational database is designed around the core entities in a logistics operation. These entities include customers, drivers, vehicles, routes, and deliveries.

The database contains the following tables:

- `customers`
- `drivers`
- `vehicles`
- `routes`
- `deliveries`

The `deliveries` table acts as the central transactional table. It links customers, drivers, vehicles, and routes together using foreign keys. This design avoids unnecessary duplication and supports reliable analysis of delivery activity.

Primary keys are used to uniquely identify each record in the main tables. Foreign keys are used in the `deliveries` table to maintain relationships between deliveries and related business entities.

## 4. SQL Implementation

The SQL implementation is divided into four separate files:

- `sql/01_schema.sql`
- `sql/02_insert_data.sql`
- `sql/03_queries.sql`
- `sql/04_optimisation.sql`

The schema file creates the database and tables. The insert file adds sample data for customers, drivers, vehicles, routes, and deliveries. The queries file contains analytical SQL queries that extract useful business information from the database.

The SQL queries include:

- Viewing full delivery details using joins.
- Counting deliveries by status.
- Calculating total completed delivery revenue.
- Finding delayed deliveries.
- Calculating average route distance.
- Sorting completed deliveries by cost.
- Reporting deliveries handled by each driver.
- Reporting vehicle usage.

These queries demonstrate key SQL skills including joins, filtering, aggregation, grouping, ordering, and reporting.

## 5. Query Optimisation

Query optimisation is demonstrated using indexes on frequently queried columns in the `deliveries` table.

Indexes are created on:

- `delivery_status`
- `delivery_date`
- `customer_id`
- `driver_id`
- `vehicle_id`

These indexes can improve performance when filtering records, sorting delivery data, and joining the deliveries table with related tables. For example, an index on `delivery_status` helps queries that filter completed, delayed, or cancelled deliveries. Indexes on foreign key columns help improve join performance.

The optimisation file also includes example queries that benefit from these indexes.

## 6. Python Data Processing

The Python component is stored in:

- `python/data_processing.py`

The Python script uses the pandas library to load the sample CSV dataset from:

- `data/sample_data.csv`

The script performs basic data processing tasks including:

- Loading the dataset.
- Removing duplicate records.
- Converting the `distance_km` column into numeric format.
- Removing invalid or missing rows.
- Creating a summary of deliveries by delivery status.

This demonstrates how Python can be used to clean and prepare logistics data before further analysis.

## 7. R Analytics

The R analytics component is stored in:

- `r/analytics.R`

The R script loads the sample CSV dataset and performs basic analytics, including:

- Displaying the structure of the dataset.
- Producing summary statistics.
- Counting deliveries by status.
- Calculating the average delivery distance.
- Identifying the longest delivery route.
- Creating a basic bar chart of delivery statuses.

This demonstrates how R can be used for statistical analysis and basic visualisation of logistics data.

## 8. MongoDB Implementation

The MongoDB component is stored in:

- `mongodb/mongodb_queries.js`

The MongoDB script demonstrates document-based storage for delivery data. It inserts sample delivery documents into a MongoDB collection and performs common NoSQL queries.

The MongoDB operations include:

- Inserting multiple delivery documents.
- Viewing all documents.
- Filtering completed deliveries.
- Finding deliveries longer than 15 kilometres.
- Aggregating deliveries by status.
- Sorting deliveries by distance.
- Creating an index on delivery status.

This shows how logistics records can also be represented in a flexible document-based database model.

## 9. Evidence and Testing

The project includes a `screenshots` folder for evidence. Screenshots should be used to prove that each part of the project was tested successfully.

Recommended screenshots include:

- SQL tables created successfully.
- SQL query results.
- Python script output.
- R script output or chart.
- MongoDB query results.
- GitHub repository structure.

Testing evidence is important because it shows that the code was not only written but also executed and checked.

## 10. Conclusion

This project demonstrates a complete small-scale database and analytics solution for a logistics scenario. It includes relational database design, SQL implementation, query optimisation, Python data processing, R analytics, MongoDB document-based querying, and GitHub documentation.

The work shows how different database and analytics technologies can be used together to store, process, analyse, and present logistics data. The structure of the repository also makes the project easy to review, test, and understand.
