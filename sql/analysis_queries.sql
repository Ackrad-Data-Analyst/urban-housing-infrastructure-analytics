-- Core analytical queries used to answer planning and policy questions

-- 1. Counties with weakest infrastructure coverage
SELECT
    county,
    population,
    facilities_per_100k,
    hospitals_per_100k
FROM ca_urban_infrastructure_master_2025
ORDER BY facilities_per_100k ASC
LIMIT 10;


-- 2. Counties facing both housing stress and unemployment pressure
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


-- 3. Investment priority ranking (composite score)
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


-- 4. Infrastructure access by county size
SELECT
    CASE
        WHEN population >= 1000000 THEN 'Large'
        WHEN population BETWEEN 300000 AND 999999 THEN 'Medium'
        ELSE 'Small'
    END AS county_size,
    AVG(facilities_per_100k) AS avg_facilities_per_100k,
    AVG(hospitals_per_100k) AS avg_hospitals_per_100k
FROM ca_urban_infrastructure_master_2025
GROUP BY county_size;


-- 5. Counties suitable for infrastructure-first intervention
SELECT
    county,
    unemployment_rate,
    facilities_per_100k
FROM ca_urban_infrastructure_master_2025
WHERE unemployment_rate < (
    SELECT AVG(unemployment_rate)
    FROM ca_urban_infrastructure_master_2025
)
AND facilities_per_100k < (
    SELECT AVG(facilities_per_100k)
    FROM ca_urban_infrastructure_master_2025
)
ORDER BY facilities_per_100k ASC;
