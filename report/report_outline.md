# NorthStar Databases and Analytics Assignment Report Outline

## 1. Introduction

This project is based on the **NorthStar Urban Mobility and Logistics** case study. The aim is to design and demonstrate a practical database and analytics solution using SQL, Python, R, and MongoDB.

The project focuses on operational logistics data, including deliveries, drivers, vehicles, hubs, customers, orders, incidents, complaints, and app events. The work demonstrates how relational and NoSQL databases can be used alongside analytics tools to support business decision-making, monitor performance, identify inefficiencies, and improve query execution.

---

## 2. Learning Outcomes Covered

The project addresses the required learning outcomes by demonstrating the ability to:

1. Apply SQL in R analytics for writing efficient database queries  
2. Build NoSQL databases using Python within MongoDB  
3. Implement indexing and query optimisation strategies using Python within MongoDB  
4. Develop big data analytics applications using Python and R within MongoDB  

---

## 3. Dataset Overview

The project uses a multi-file operational dataset stored in the `data/` folder.

### Main datasets

| Dataset | Purpose |
|---|---|
| `deliveries.csv` | Delivery status, dispatch time, completion time, route distance, overrides, ratings, and cost |
| `drivers.csv` | Driver ratings, experience, training score, and employment type |
| `vehicles.csv` | Vehicle type, maintenance status, battery health, and telematics details |
| `hubs.csv` | Hub names, zones, types, and capacity scores |
| `customers.csv` | Customer type, loyalty, engagement, preferred channel, and account status |
| `orders.csv` | Order-level information linked to customers |
| `complaints.csv` | Customer complaint records |
| `incidents.csv` | Operational incident records |
| `app_events.csv` | Application event data suitable for NoSQL modelling |
| `data_dictionary.csv` | Field descriptions and dataset definitions |

The dataset contains realistic data quality issues such as inconsistent zone names and missing values, allowing cleaning, validation, and transformation work to be demonstrated.

---

## 4. SQL Database Design and Analysis

The SQL element of the project demonstrates relational database design using tables, keys, and analytical queries.

### SQL files used

- `01_schema.sql`
- `02_insert_data.sql`
- `03_queries.sql`
- `04_optimisation.sql`

### Main SQL features demonstrated

- Table creation  
- Primary keys and foreign keys  
- Relational joins  
- Aggregation and grouping  
- Filtering and ordering  
- Index creation for optimisation  

The SQL queries support operational analysis such as delivery counts, delayed deliveries, revenue analysis, vehicle usage, and driver activity.

---

## 5. R Analytics

R is used to conduct analytical reporting and visualisation.

### R work included

- SQL analysis through R  
- Descriptive statistics  
- Delivery-status summaries  
- Hub-level performance analysis  
- Customer-rating analysis  
- Operational visualisations  

The notebooks `04_SQL_Analysis_in_R.ipynb` and `05_R_Analytics_and_Visualisation.ipynb` provide evidence of the R-based workflow.

---

## 6. Python Data Processing and Analysis

Python is used for data preparation and operational analysis.

### Python tasks demonstrated

- Loading multiple CSV datasets  
- Inspecting structure and missing values  
- Standardising inconsistent categorical fields  
- Validating data quality  
- Creating derived fields  
- Analysing delivery performance  
- Identifying inefficient deliveries  

The notebook `06_Python_Data_Processing_and_Analysis.ipynb` provides the main Python evidence, supported by the standalone script `python/data_processing.py`.

---

## 7. MongoDB Atlas Development

MongoDB Atlas is used to demonstrate NoSQL database development for logistics data.

### MongoDB work included

- Secure connection from Python to MongoDB Atlas  
- Conversion of DataFrames into MongoDB-compatible documents  
- Creation of collections for deliveries, drivers, vehicles, hubs, and customers  
- Insertion and retrieval of documents  
- Standard document queries  
- Aggregation pipelines  
- `$lookup` for cross-collection enrichment  
- Nested document structure examples  

The notebook `07_MongoDB_Atlas_Development.ipynb` provides the main evidence for NoSQL database development.

---

## 8. Query Optimisation

MongoDB query optimisation is demonstrated using indexing and execution-plan analysis.

### Optimisation techniques applied

- Baseline query analysis using `explain()`  
- Single-field index on `delivery_status`  
- Compound index on `delivery_status` and `manual_route_override_count`  
- Before-and-after query comparison  

### Main results

| Query | Before Optimisation | After Optimisation |
|---|---|---|
| Delayed-delivery filter | `COLLSCAN`, 950 documents examined | `IXSCAN`, 202 documents examined |
| Delayed delivery + high override filter | 202 documents examined | 23 documents examined |

The notebook `08_Query_Optimisation_Strategies.ipynb` demonstrates how indexing reduces unnecessary scanning and improves operational query efficiency.

---

## 9. Key Findings

The analysis produced several meaningful findings:

- 616 deliveries were completed on time  
- 202 deliveries were delayed  
- 132 deliveries failed  
- Hub H04 recorded the highest number of delayed deliveries  
- Hub H08 recorded the highest number of failed deliveries  
- On-time deliveries received much higher average customer ratings than delayed and failed deliveries  
- Missing proof-of-completion records and high manual route override cases can be identified through MongoDB queries  
- Indexing significantly improved retrieval efficiency for frequently used delivery queries  

---

## 10. Repository Evidence

The repository includes:

- SQL scripts  
- Python processing script  
- R analytics script  
- MongoDB query file  
- Six analytical notebooks  
- Dataset files  
- Screenshot evidence  
- README documentation  

The screenshots folder contains visual proof of SQL execution, Python output, R analytics, MongoDB queries, and the completed GitHub structure.

---

## 11. Conclusion

This project demonstrates a complete database and analytics workflow for the NorthStar Urban Mobility and Logistics case study. It combines relational modelling, SQL querying, Python processing, R analytics, MongoDB Atlas development, and query optimisation within one structured solution.

The work shows how operational logistics data can be transformed into practical business insight while also demonstrating database efficiency, flexible NoSQL modelling, and evidence-based analysis.
