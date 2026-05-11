# NorthStar Databases and Analytics Assignment

## Project Overview

This repository contains the completed database and analytics solution for the **NorthStar Urban Mobility and Logistics** case study.

The project demonstrates how operational logistics data can be stored, processed, queried, analysed, remodelled, and optimised using a combination of:

* **SQL** for relational database design and analytical querying
* **R** for SQL-based analysis and visualisation
* **Python** for data processing, cleaning, and feature engineering
* **MongoDB Atlas** for NoSQL document database development
* **MongoDB indexing and query optimisation** for improving operational query efficiency

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
```

---

## Dataset

The project uses a multi-file logistics dataset stored in the `data/` folder. The dataset contains structured operational records with cross-file relationships and includes deliberate data quality issues such as inconsistent categorical values and missing values.

### Main data files

| File                  | Purpose                                                                                 |
| --------------------- | --------------------------------------------------------------------------------------- |
| `deliveries.csv`      | Delivery records, timing, status, distance, cost, route overrides, and customer ratings |
| `drivers.csv`         | Driver profile, training, experience, ratings, and employment details                   |
| `vehicles.csv`        | Vehicle type, maintenance status, telematics version, and operating metrics             |
| `hubs.csv`            | Hub names, zones, types, and capacity information                                       |
| `customers.csv`       | Customer profile, loyalty, engagement, and account status                               |
| `orders.csv`          | Order-level records linked to customers                                                 |
| `complaints.csv`      | Customer complaint records                                                              |
| `incidents.csv`       | Operational incident records                                                            |
| `app_events.csv`      | Application event data suitable for NoSQL modelling                                     |
| `data_dictionary.csv` | Definitions and descriptions of dataset fields                                          |

The dataset supports both relational and document-based modelling, making it suitable for SQL analysis, Python processing, R analytics, and MongoDB development.

---

## Notebook Workflow

The main analytical work is documented through six notebooks in the `notebooks/` folder.

| Notebook                                       | Purpose                                                                                      |
| ---------------------------------------------- | -------------------------------------------------------------------------------------------- |
| `03_Dataset_Overview.ipynb`                    | Reviews the dataset structure, file relationships, field types, and data quality issues      |
| `04_SQL_Analysis_in_R.ipynb`                   | Uses SQL through R to perform relational analysis and operational querying                   |
| `05_R_Analytics_and_Visualisation.ipynb`       | Produces R-based descriptive analytics and visualisations                                    |
| `06_Python_Data_Processing_and_Analysis.ipynb` | Performs Python data cleaning, validation, feature engineering, and operational analysis     |
| `07_MongoDB_Atlas_Development.ipynb`           | Builds MongoDB Atlas collections using Python and demonstrates NoSQL querying                |
| `08_Query_Optimisation_Strategies.ipynb`       | Implements MongoDB indexing, `explain()` analysis, and before/after optimisation comparisons |

Together, these notebooks provide the main evidence of the end-to-end analytical workflow for the assignment.

---

## SQL Database Design

The SQL work is stored in the `sql/` folder.

### SQL files

| File                  | Purpose                                           |
| --------------------- | ------------------------------------------------- |
| `01_schema.sql`       | Creates the relational database schema and tables |
| `02_insert_data.sql`  | Inserts sample relational data                    |
| `03_queries.sql`      | Contains analytical SQL queries                   |
| `04_optimisation.sql` | Creates indexes to support query performance      |

### Main SQL concepts demonstrated

* Primary keys and foreign keys
* Relational table design
* Joins across operational entities
* Filtering, grouping, ordering, and aggregation
* Query optimisation using indexes

The relational design demonstrates how structured delivery data can be organised and queried efficiently for operational reporting.

---

## Python Data Processing

The standalone Python script is stored at:

```text
python/data_processing.py
```

The Python work demonstrates:

* loading CSV data with `pandas`
* checking dataset shape and structure
* cleaning inconsistent categorical values
* identifying and handling missing values
* producing summary statistics
* generating operational performance outputs

The more detailed Python analysis is also documented in:

```text
notebooks/06_Python_Data_Processing_and_Analysis.ipynb
```

---

## R Analytics

The standalone R script is stored at:

```text
r/analytics.R
```

The R analysis demonstrates:

* loading and inspecting operational datasets
* summary statistics
* delivery status analysis
* hub-level performance review
* customer rating analysis
* visualisation of logistics outcomes

Additional R work is presented in:

```text
notebooks/04_SQL_Analysis_in_R.ipynb
notebooks/05_R_Analytics_and_Visualisation.ipynb
```

---

## MongoDB Atlas Development

MongoDB work is included in both the JavaScript query file and the Python notebooks.

### MongoDB files

```text
mongodb/mongodb_queries.js
notebooks/07_MongoDB_Atlas_Development.ipynb
notebooks/08_Query_Optimisation_Strategies.ipynb
```

### MongoDB concepts demonstrated

* creation of MongoDB collections
* conversion of tabular CSV data into document structures
* insertion of records using Python and PyMongo
* standard document queries
* aggregation pipelines
* `$lookup` for combining related collections
* nested document modelling
* single-field and compound indexing
* query-plan inspection with `explain()`

The MongoDB development shows how NorthStar data can be stored flexibly in a NoSQL environment while still supporting operational analysis.

---

## Query Optimisation

The project includes explicit query optimisation work in MongoDB.

### Optimisation results demonstrated

| Query                                                         | Before Optimisation                                  | After Optimisation                         |
| ------------------------------------------------------------- | ---------------------------------------------------- | ------------------------------------------ |
| Filter by `delivery_status`                                   | `COLLSCAN`, 950 documents examined                   | `IXSCAN`, 202 documents examined           |
| Filter by `delivery_status` and `manual_route_override_count` | 202 documents examined using single-field index only | 23 documents examined using compound index |

These results show that well-designed indexes reduce unnecessary document scanning and improve the efficiency of operational queries, especially as data volumes increase.

---

## Key Operational Findings

The analysis identified several meaningful findings from the delivery data:

* **616 deliveries** were completed on time
* **202 deliveries** were delayed
* **132 deliveries** failed
* **Hub H04** recorded the highest number of delayed deliveries
* **Hub H08** recorded the highest number of failed deliveries
* On-time deliveries achieved a higher average customer rating than delayed and failed deliveries
* Deliveries with missing proof of completion and high manual route override counts can be identified through MongoDB queries
* Indexing significantly improved retrieval efficiency for common logistics queries

These findings show how database design and analytics can support management decision-making in delivery operations.

---

## Evidence Screenshots

The `screenshots/` folder contains visual evidence showing that the main components of the project were tested successfully.

| Screenshot                        | Evidence                                           |
| --------------------------------- | -------------------------------------------------- |
| `sql_tables_created.png`          | SQL database and table creation                    |
| `sql_query_results.png`           | Analytical SQL query outputs                       |
| `python_output.png`               | Python processing output                           |
| `r_analytics_output.png`          | R analytics output                                 |
| `mongodb_queries.png`             | MongoDB queries, aggregation, or indexing evidence |
| `github_repository_structure.png` | Completed repository structure                     |

---

## How to Use the Repository

### 1. Review the dataset

Start with:

```text
data/
notebooks/03_Dataset_Overview.ipynb
```

### 2. Run SQL files in order

```text
1. sql/01_schema.sql
2. sql/02_insert_data.sql
3. sql/03_queries.sql
4. sql/04_optimisation.sql
```

### 3. Run the analysis notebooks

Open the notebooks in sequence:

```text
03_Dataset_Overview.ipynb
04_SQL_Analysis_in_R.ipynb
05_R_Analytics_and_Visualisation.ipynb
06_Python_Data_Processing_and_Analysis.ipynb
07_MongoDB_Atlas_Development.ipynb
08_Query_Optimisation_Strategies.ipynb
```

### 4. Review supporting scripts

```text
python/data_processing.py
r/analytics.R
mongodb/mongodb_queries.js
```

---

## Tools and Technologies Used

* SQL / MySQL
* R
* Python
* pandas
* MongoDB Atlas
* PyMongo
* Jupyter / Google Colab
* GitHub

---

## Project Summary

This repository provides a complete database and analytics solution for the NorthStar Urban Mobility and Logistics case study. It combines relational database design, SQL analytics, Python processing, R visualisation, MongoDB Atlas development, and query optimisation in a single structured submission.

The project demonstrates both technical implementation and business relevance by showing how operational logistics data can be transformed into useful information for performance monitoring, customer-service analysis, and database efficiency improvement.
