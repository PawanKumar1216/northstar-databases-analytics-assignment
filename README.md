# NorthStar Databases and Analytics Assignment

## Project Overview

This repository contains the completed database and analytics solution for the **NorthStar Urban Mobility and Logistics** case study.

The project demonstrates how operational logistics data can be stored, processed, queried, analysed, remodelled, and optimised using a combination of:

- **SQL** for relational database design and analytical querying  
- **R** for SQL-based analysis and visualisation  
- **Python** for data processing, cleaning, and feature engineering  
- **MongoDB Atlas** for NoSQL document database development  
- **MongoDB indexing and query optimisation** for improving operational query efficiency  

The work focuses on delivery operations, driver performance, vehicle usage, customer outcomes, hub performance, and query optimisation within a realistic logistics context.

---

## Learning Outcomes Addressed

This project supports the required learning outcomes by demonstrating the ability to:

1. Apply SQL in R analytics for writing efficient database queries  
2. Build NoSQL databases using Python within MongoDB  
3. Implement indexing and query optimisation strategies using Python within MongoDB  
4. Develop big data analytics applications using Python and R within MongoDB  

---

## Repository Structure

```text
northstar-databases-analytics-assignment/
│
├── data/
│   ├── README.txt
│   ├── app_events.csv
│   ├── complaints.csv
│   ├── customers.csv
│   ├── data_dictionary.csv
│   ├── deliveries.csv
│   ├── drivers.csv
│   ├── hubs.csv
│   ├── incidents.csv
│   ├── orders.csv
│   └── vehicles.csv
│
├── mongodb/
│   └── mongodb_queries.js
│
├── notebooks/
│   ├── 03_Dataset_Overview.ipynb
│   ├── 04_SQL_Analysis_in_R.ipynb
│   ├── 05_R_Analytics_and_Visualisation.ipynb
│   ├── 06_Python_Data_Processing_and_Analysis.ipynb
│   ├── 07_MongoDB_Atlas_Development.ipynb
│   └── 08_Query_Optimisation_Strategies.ipynb
│
├── python/
│   └── data_processing.py
│
├── r/
│   └── analytics.R
│
├── report/
│   └── report_outline.md
│
├── screenshots/
│   ├── README.md
│   ├── github_repository_structure.png
│   ├── mongodb_queries.png
│   ├── python_output.png
│   ├── r_analytics_output.png
│   ├── sql_query_results.png
│   └── sql_tables_created.png
│
├── sql/
│   ├── 01_schema.sql
│   ├── 02_insert_data.sql
│   ├── 03_queries.sql
│   └── 04_optimisation.sql
│
└── README.md
