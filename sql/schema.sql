-- Logical schema for Urban Housing & Infrastructure Analytics
-- This represents the cleaned analytical dataset used for the project

CREATE TABLE ca_urban_infrastructure_master_2025 (
    county VARCHAR(100),
    population INT,
    facilities_per_100k FLOAT,
    hospitals_per_100k FLOAT,
    unemployment_rate FLOAT,
    severe_housing_problems_pct FLOAT
);
