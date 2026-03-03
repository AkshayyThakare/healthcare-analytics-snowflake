# 🏥 Healthcare Analytics Pipeline
## Snowflake | SQL | Power BI | DAX

An end-to-end data analytics pipeline analyzing 55,500 hospital 
patient admissions to uncover insights on billing, patient demographics, 
clinical outcomes and revenue trends.

---

## 🏗️ Architecture
```
Raw CSV → Snowflake (RAW) → Snowflake (CLEAN) → Snowflake (ANALYTICS) → Power BI Dashboard
```

## 🛠️ Tools Used
- **Snowflake** — Cloud data warehouse (3-layer architecture)
- **SQL** — Data transformation & analysis
- **Power BI** — Interactive dashboard with DAX measures
- **DAX** — Custom KPI measures and calculations
- **GitHub** — Version control

## 📁 Project Structure
```
├── sql/
│   ├── 01_setup.sql              # Warehouse, DB, schemas
│   ├── 02_create_raw_table.sql   # RAW table creation
│   ├── 03_clean_layer.sql        # Data cleaning & transformation
│   ├── 04_analytics_layer.sql    # Pre-aggregated analytics tables
│   └── 05_question_queries.sql  # 10 Business Questions SQL queries
├── powerbi/
│   └── healthcare_dashboard.pbix # 4-page Power BI dashboard
└── data/
    └── healthcare_dataset.csv    # Source dataset (55,500 rows)
```

## 📊 Dashboard Pages
1. **Executive Summary** — KPI cards: Total Patients, Revenue, Avg Billing, Avg Stay
2. **Monthly Trends** — Admission trends and revenue over time
3. **Demographics** — Age group and gender breakdown
4. **Clinical Insights** — Abnormal test rates and length of stay by condition

## 🔍 Key SQL Concepts Demonstrated
- 3-layer data architecture (RAW → CLEAN → ANALYTICS)
- Window functions (running totals, revenue share %)
- CASE WHEN bucketing (age groups, billing bands)
- DATEDIFF for length of stay calculation
- TRY_TO_DATE for safe type casting
- ❄️ Snowflake Time Travel for data recovery

## 💡 Key Insights
- 55,500 patient admissions analyzed across 6 medical conditions
- Average hospital stay: ~15 days across all conditions
- 5 insurance providers with relatively equal revenue distribution
- Abnormal test rates consistent (~33%) across all conditions

## 🚀 How to Run
1. Sign up for Snowflake free trial at snowflake.com
2. Run SQL scripts in order (01 → 05)
3. Load `healthcare_dataset.csv` into RAW table
4. Open Power BI file and update Snowflake connection
