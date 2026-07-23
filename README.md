# 🚗 Auto Data Warehouse - Snowflake & dbt Analytics Engineering Project

![Snowflake](https://img.shields.io/badge/Snowflake-Cloud%20Data%20Warehouse-blue)
![dbt](https://img.shields.io/badge/dbt-Analytics%20Engineering-orange)
![SQL](https://img.shields.io/badge/SQL-Advanced-green)

## 📌 Project Overview

This project demonstrates the implementation of an end-to-end analytics engineering pipeline using:

- Snowflake as Cloud Data Warehouse
- dbt for data transformation and modeling
- SQL for business analytics
- Git/GitHub for version control


The objective is to transform raw automotive business data into reliable analytical datasets for operational and management decision-making.

---

# 🏗️ Architecture

The project follows a modern ELT architecture: 

Raw Data Sources
|
|
Snowflake
|
|
dbt
|

| | |
Staging Intermediate Marts
|
|
Business Analytics


---

# 📂 dbt Project Structure


models/

├── staging
│ ├── stg_clients.sql
│ ├── stg_vehicules.sql
│ ├── stg_atelier.sql
│ └── stg_rappels.sql
│
├── intermediate
│ ├── int_atelier_resume.sql
│ └── int_vehicules_clients.sql
│
└── marts
├── fct_rentabilite_atelier.sql
├── fct_parc_automobiles.sql
├── fct_alertes_maintenance_predictive.sql
├── fct_rappels_vehicules.sql
├── mart_performance_mecaniciens.sql
└── mart_analyse_stocks_pieces.sql



---

# 📊 Business Use Cases

The analytical marts answer several business questions:

## 🚘 Vehicle Fleet Analysis

- Vehicle distribution
- Customer vehicle portfolio
- Maintenance tracking

## 🔧 Workshop Performance

- Mechanic productivity
- Workshop profitability
- Repair activity monitoring

## ⚠️ Predictive Maintenance

- Maintenance alerts
- Vehicle risk identification
- Recall management

## 💰 Profitability

- Revenue analysis
- Workshop margins
- Parts consumption

---

# ✅ dbt Implementation

The project includes:

- Staging models for data cleaning
- Intermediate models for business logic
- Mart models for analytics consumption
- SQL transformations
- Data quality tests
- Documentation structure

Execution result:

16 models successfully executed
0 errors
Execution time < 12 seconds


---

# 🛠️ Technologies

| Technology | Usage |
|---|---|
| Snowflake | Cloud Data Warehouse |
| dbt Core | Data transformation |
| SQL | Data modeling |
| GitHub | Version control |
| Power BI | Business visualization |

---

# 🚀 Future Improvements

Planned enhancements:

- Incremental dbt models
- dbt snapshots for historical tracking
- Advanced data quality tests
- CI/CD with GitHub Actions
- Automated documentation deployment
- Dashboard integration

---

# 👤 Author

Seydou Ouattara

Analytics Engineering Portfolio Project






