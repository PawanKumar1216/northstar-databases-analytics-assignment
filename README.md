# NorthStar Databases and Analytics Assignment

## Project Overview

This repository contains the database and analytics coursework for the NorthStar Urban Mobility and Logistics case study. The project demonstrates relational database design, SQL implementation, Python data processing, R analytics, MongoDB document-based querying, and query optimisation.

## Repository Structure

```text
data/
    sample_data.csv

mongodb/
    mongodb_queries.js

python/
    data_processing.py

r/
    analytics.R

report/
    report_outline.md

screenshots/
    README.md

sql/
    01_schema.sql
    02_insert_data.sql
    03_queries.sql
    04_optimisation.sql
```

## Technologies Used

- SQL
- Python
- R
- MongoDB Atlas
- GitHub

## SQL Components

The SQL section contains:

- Database creation
- Table definitions
- Primary keys and foreign keys
- Sample data insertion
- Analytical queries using joins, filtering, grouping, ordering, and aggregation
- Query optimisation examples using indexes

## Python Component

The Python script loads the sample logistics dataset, removes duplicate records, converts distance values into numeric format, removes invalid rows, and creates a delivery status summary.

## R Analytics Component

The R script performs basic analytics on the sample logistics dataset, including summary statistics, delivery status counts, average delivery distance, longest route identification, and a basic bar chart.

## MongoDB Component

The MongoDB script demonstrates document-based storage and querying for delivery records. It includes sample document insertion, filtering, aggregation, sorting, and index creation.

## How to Run the Project

### SQL

1. Open the SQL files in MySQL Workbench or another compatible SQL tool.
2. Run `sql/01_schema.sql` first to create the database and tables.
3. Run `sql/02_insert_data.sql` to insert sample data.
4. Run `sql/03_queries.sql` to test analytical SQL queries.
5. Run `sql/04_optimisation.sql` to create indexes and review optimisation examples.

### Python

Install pandas if required:

```bash
pip install pandas
```

Run the script from the main project folder:

```bash
python python/data_processing.py
```

### R

Run the R script from the main project folder:

```r
source("r/analytics.R")
```

### MongoDB

Run the commands in `mongodb/mongodb_queries.js` using MongoDB Shell or MongoDB Atlas.

## Evidence

The `screenshots` folder is prepared for evidence screenshots, such as:

- SQL tables created successfully
- SQL query results
- Python output
- R analytics output
- MongoDB query results
- GitHub repository structure

## Author

Pawan Kumar
