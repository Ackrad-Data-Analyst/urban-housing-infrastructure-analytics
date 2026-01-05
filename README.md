# Urban Housing & Infrastructure Demand Analytics (California)

This project analyzes housing stress and infrastructure availability across California counties using real public data.

The objective is practical and decision-focused:

> Identify counties that are under-served in housing and public infrastructure and rank them for targeted investment.

**Target roles:** Data Analyst · Infrastructure Analyst · Urban / Transport Analyst  
**Relevant industries:** Civil engineering, real estate, government, urban planning, infrastructure finance

---

## 1. Problem Context

Infrastructure planning decisions are usually constrained by budget, land, and political trade-offs.

In practice, planners and policymakers must answer:

- Where does population growth outpace housing supply?
- Which areas lack basic facilities relative to population size?
- Where will infrastructure investment have the highest impact?

This project builds a **county-level analytical framework** to support those decisions using population-normalized indicators and spatial analysis.

---

## 2. Data Used

**Primary dataset (cleaned & analysis-ready):**  
📄 [`data/ca_urban_infrastructure_master_2025.csv`](data/ca_urban_infrastructure_master_2025.csv)

**Key fields:**
- `county`
- `population`
- `facilities_per_100k`
- `hospitals_per_100k`
- `unemployment_rate`
- `severe_housing_problems_pct`

The dataset was assembled by merging publicly available sources on:
- labor force & unemployment,
- housing conditions,
- healthcare facilities,
- county-level demographics.

All infrastructure metrics were normalized per capita to allow fair comparison across counties.

---

## 3. Core Metrics & Logic

To move beyond raw counts, the following indicators were calculated:

- **Facilities per 100,000 residents**
- **Hospitals per 100,000 residents**
- **Unemployment rate**
- **Severe housing problems (% of households)**

These metrics form the basis of both the SQL analysis and the Tableau GIS dashboard.

---

## 4. Analytical Questions (SQL Logic)

The same questions answered visually in Tableau can be expressed directly at the data layer.

### Counties with weakest infrastructure coverage
```sql
SELECT
    county,
    population,
    facilities_per_100k,
    hospitals_per_100k
FROM ca_urban_infrastructure_master_2025
ORDER BY facilities_per_100k ASC
LIMIT 10;
````

---

### Counties facing both housing stress and unemployment pressure

```sql
SELECT
    county,
    unemployment_rate,
    severe_housing_problems_pct
FROM ca_urban_infrastructure_master_2025
WHERE unemployment_rate > (
    SELECT AVG(unemployment_rate)
    FROM ca_urban_infrastructure_master_2025
)
AND severe_housing_problems_pct > (
    SELECT AVG(severe_housing_problems_pct)
    FROM ca_urban_infrastructure_master_2025
)
ORDER BY severe_housing_problems_pct DESC;
```

---

### Investment priority ranking (composite score)

Counties were ranked using a weighted score reflecting infrastructure scarcity and social stress:

```sql
SELECT
    county,
    (
        (1 / facilities_per_100k) * 0.4 +
        unemployment_rate * 0.3 +
        severe_housing_problems_pct * 0.3
    ) AS investment_priority_score
FROM ca_urban_infrastructure_master_2025
ORDER BY investment_priority_score DESC
LIMIT 10;
```

This logic mirrors the calculated fields used in the Tableau dashboard.

📂 Full SQL scripts:
[`sql/analysis_queries.sql`](sql/analysis_queries.sql)

---

## 5. GIS & Dashboard Analysis (Tableau)

The analysis was visualized using **Tableau GIS mapping** at the county level.

📂 Screenshots:
[`images/`](images/)

### Key views included:

* **Facilities per capita map** – highlights under-served counties
* **Hospitals per capita map** – reveals healthcare access gaps
* **Investment priority map** – composite score for capital planning
* **High-performing counties view** – identifies infrastructure-resilient regions

Color scales were intentionally chosen so that:

* **Red = higher need / higher priority**
* **Green = better infrastructure coverage**

---

## 6. Key Insights

* Infrastructure availability varies significantly even among counties with similar population sizes.
* Several counties show **high housing stress despite moderate employment**, suggesting infrastructure—not jobs—is the primary constraint.
* Population size alone does not guarantee adequate service coverage.
* A small number of counties consistently rank high in the investment priority score, making them strong candidates for near-term intervention.

---

## 7. Tools & Skills Demonstrated

* SQL analytical reasoning
* Data cleaning & normalization
* GIS mapping & spatial analysis (Tableau)
* Infrastructure and housing domain analysis
* Translating data into planning and policy insights

---

## 8. Why This Project Matters to me to be on my portfolio?

This project reflects how real infrastructure and policy decisions are made:

* Metrics are normalized, not absolute
* Spatial patterns drive prioritization
* Trade-offs are explicit and measurable
* Outputs are designed for planners, analysts, and decision-makers

It demonstrates how engineering context and data analysis work together to support targeted, evidence-based investment decisions.
