WITH resul_t as (SELECT 
    address,
    ROUND(MAX(CAST(age as numeric)) - (MIN(CAST(age as numeric)) / MAX(CAST(age as numeric))), 2) as formula,
    ROUND(AVG(age), 2) as average
FROM person
GROUP BY address
ORDER BY address)
SELECT 
    *,
    CASE 
        WHEN formula > average THEN TRUE
        ELSE FALSE
    END as comparison
FROM resul_t