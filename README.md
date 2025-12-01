# Urban Housing & Infrastructure Demand Analytics

This project combines my **Civil Engineering** background with my **MSBA** skills.  
I want to answer a simple but important question:

> Which neighbourhoods are **under-served** or **over-served** in housing and basic infrastructure
> (schools, clinics, and transit), and where should a city invest next?

**Target roles:** Data / Business Analyst · Urban / Transport / Infrastructure Analyst  
**Industries:** Civil engineering, real estate, government policy, urban planning, infrastructure finance

---

## 1. Problem & Context

Cities usually face two problems at the same time:

- Some areas have **high population and weak infrastructure** (not enough housing, schools, or clinics).
- Other areas have **plenty of infrastructure but low utilisation**.

From a civil / planning / policy perspective, the key questions are:

1. **Which neighbourhoods have housing stress?**  
   – high population, low housing units, or very high people-per-unit.

2. **Which neighbourhoods are under-served by basic infrastructure?**  
   – schools, clinics, or transit access per capita.

3. **Where should the next projects be built?**  
   – if the city can only invest in a few areas, which ones are the best candidates?

This project is a small analytical framework for answering those questions with data.

---

## 2. Planned Data

For version 1, I will build a small **neighbourhood-level dataset** with columns like:

- `neighbourhood` – area name
- `population` – total residents
- `housing_units` – number of residential units
- `avg_income` – average household income (rough estimate)
- `num_schools` – count of schools in the area
- `num_clinics` – count of clinics/health centres
- `has_transit_hub` – 1 if a metro/bus hub is present, 0 otherwise

Later, this can be replaced with **real open data** from a city open data portal.

Data files will live in [`data/`](data/), and I will keep both:

- the **raw** CSV, and  
- a **cleaned/derived** version with calculated metrics (e.g., infrastructure per 1,000 people).

---

## 3. Planned Analysis

I will calculate simple but meaningful indicators, for example:

- **Housing units per 1,000 people**
- **Schools per 10,000 people**
- **Clinics per 10,000 people**
- **An overall “infrastructure score”** that combines housing + schools + clinics + transit

Then I will:

1. Rank neighbourhoods by **housing pressure** (population / housing_units).
2. Rank neighbourhoods by **infrastructure score**.
3. Highlight **“high population, low infrastructure”** areas as **priority zones**.

The analysis workflow will use:

- **Excel** – initial calculations, pivot tables and charts (`excel/` folder)
- **SQL** – schema + analytical queries (`sql/` folder)
- **(Later) Power BI or Tableau** – interactive dashboard (`bi/` folder)

---

## 4. Outputs & Visuals (planned)

Visuals (saved into [`images/`](images/)) will include:

- Bar chart: **Housing units per 1,000 people by neighbourhood**
- Bar chart: **Infrastructure score by neighbourhood**
- Highlighted table of **Top 3 priority neighbourhoods** for new projects

If I add GIS later, I will also include **map screenshots** with neighbourhoods coloured by infrastructure score.

---

## 5. Why this project is in my portfolio

This project is here because it shows how I:

- think like a **civil engineer** (housing, infrastructure, spatial patterns),
- work like a **data / business analyst** (clean data, define metrics, rank & prioritise),
- and communicate **clear, actionable recommendations** for city planners or developers:

> “Build more housing and schools first in these 2–3 specific neighbourhoods.”

It fits roles in:

- Civil / infrastructure analytics  
- Real estate development analytics  
- Government / policy / urban planning  
- General data / business analyst roles that value domain understanding.
