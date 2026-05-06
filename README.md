# NorthStar Databases and Analytics Assignment

## Project Overview

This project is based on the NorthStar Urban Mobility and Logistics case study. The aim of the project is to design and demonstrate a small data management and analytics solution for delivery operations.

The project uses SQL for relational database design, Python for data processing, R for basic analytics, and MongoDB for document-based data storage. It also includes sample data, optimisation queries, a report outline, and screenshot evidence.

The main focus is to show how logistics data can be stored, processed, queried, and analysed using different tools.

## Repository Structure

```text
northstar-databases-analytics-assignment/

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
  notebooks/

screenshots/
  README.md

sql/
  01_schema.sql
  02_insert_data.sql
  03_queries.sql
  04_optimisation.sql

README.md
```

## Dataset

The sample dataset is stored in:

```text
data/sample_data.csv
```

The dataset contains delivery records for a small logistics scenario. Each row represents one delivery trip.

The dataset includes the following fields:

- `trip_id`
- `vehicle_id`
- `driver_id`
- `start_location`
- `end_location`
- `distance_km`
- `delivery_status`

The dataset is small, but it is useful for demonstrating database design, querying, data processing, and basic analytics.

## SQL Database Design

The SQL section creates a relational database for logistics operations.

The database contains five main tables:

- `customers`
- `drivers`
- `vehicles`
- `routes`
- `deliveries`

The `deliveries` table is the main table because it connects customers, drivers, vehicles, and routes using foreign keys.

This design helps reduce repeated data. For example, driver information is stored in the `drivers` table instead of being repeated in every delivery record.

## SQL Files

The SQL folder contains four files:

```text
sql/01_schema.sql
sql/02_insert_data.sql
sql/03_queries.sql
sql/04_optimisation.sql
```

### 01_schema.sql

This file creates the database and tables. It also defines primary keys and foreign keys.

### 02_insert_data.sql

This file inserts sample data into the database tables.

### 03_queries.sql

This file contains analytical SQL queries. These queries are used to generate useful reports from the delivery data.

### 04_optimisation.sql

This file creates indexes on important columns. These indexes can improve query performance when the database becomes larger.

## How to Run the SQL Files

Run the SQL files in the following order:

```text
1. sql/01_schema.sql
2. sql/02_insert_data.sql
3. sql/03_queries.sql
4. sql/04_optimisation.sql
```

The schema file should be run first because it creates the database structure. The insert file should be run second because it adds the sample records. The query and optimisation files can then be tested.

## SQL Queries Included

The SQL queries include:

- full delivery report using joins
- delivery count by status
- revenue from completed deliveries
- delayed delivery records
- average route distance
- completed deliveries ordered by cost
- deliveries handled by each driver
- vehicle usage summary

These queries demonstrate joins, filtering, grouping, ordering, and aggregation.

## Query Optimisation

Indexes are created on columns that are likely to be searched, filtered, grouped, or joined often.

Indexes are created on:

- `delivery_status`
- `delivery_date`
- `customer_id`
- `driver_id`
- `vehicle_id`
- `route_id`

For example, an index on `delivery_status` can help when searching for completed, delayed, or cancelled deliveries.

Indexes on foreign key columns can also support joins between the `deliveries` table and the related tables.

## Python Data Processing

The Python script is stored in:

```text
python/data_processing.py
```

The script uses pandas to read and process the CSV file.

The Python script performs the following tasks:

- reads the delivery dataset
- removes duplicate records
- converts `distance_km` into numeric format
- removes missing or invalid records
- trims extra spaces from text columns
- creates a delivery status summary
- creates a vehicle usage summary
- creates a driver summary
- identifies the longest delivery
- calculates total and average delivery distance
- saves processed output files

Run the Python script from the main project folder:

```bash
python python/data_processing.py
```

The output shows the cleaned data, status summary, vehicle summary, driver summary, longest delivery, total distance, and average distance.

## R Analytics

The R script is stored in:

```text
r/analytics.R
```

The R script performs basic analytics on the CSV dataset.

It includes:

- reading the CSV file
- displaying the dataset structure
- showing summary statistics
- counting deliveries by status
- calculating average delivery distance
- identifying the longest route
- creating a bar chart of delivery statuses

Run the R script from the main project folder:

```r
source("r/analytics.R")
```

## MongoDB Work

The MongoDB script is stored in:

```text
mongodb/mongodb_queries.js
```

MongoDB is used to show how delivery records can also be stored as documents instead of relational tables.

The MongoDB script includes:

- using the logistics database
- inserting delivery documents
- viewing all delivery documents
- filtering completed deliveries
- finding deliveries above a selected distance
- grouping deliveries by status
- sorting deliveries by distance
- creating an index on delivery status

This section demonstrates a document-based approach to storing logistics data.

## Report

The report is stored in:

```text
report/report_outline.md
```

The report explains the project background, database design, SQL implementation, query optimisation, Python processing, R analytics, MongoDB implementation, testing evidence, and conclusion.

## Screenshots

The screenshots folder is used to store evidence that the project was tested.

Suggested screenshots include:

- GitHub repository structure
- SQL database tables
- SQL inserted data
- SQL query results
- Python script output
- R script output or chart
- MongoDB inserted documents
- MongoDB query results

Screenshots are important because they show that the project files were tested successfully.

## Tools and Technologies Used

The project uses:

- SQL
- Python
- pandas
- R
- MongoDB
- GitHub

## Main Learning Outcomes

This project demonstrates:

- how to design a small relational database
- how to use primary keys and foreign keys
- how to insert and query structured data
- how joins connect related tables
- how indexes can support query optimisation
- how Python can clean and summarise CSV data
- how R can be used for analytics and visualisation
- how MongoDB stores and queries document-based data
- how different tools can be used together in a data analytics workflow

## Limitations

The dataset used in this project is small and only contains sample records. In a real logistics company, the dataset would be much larger and would include more details such as parcel weight, delivery time, customer address, fuel usage, live vehicle location, and driver performance.

The optimisation section is also basic because performance improvements are harder to measure on a small dataset. However, the indexes show which columns would be important in a larger database.

## Conclusion

This project demonstrates a basic database and analytics solution for logistics delivery data. SQL is used to design the relational database and run analytical queries. Python is used to clean and summarise the CSV data. R is used for basic statistics and visualisation. MongoDB is used to show an alternative document-based way of storing delivery records.

Overall, the project shows how different database and analytics tools can support delivery tracking, reporting, and decision-making in a logistics environment.
