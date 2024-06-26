SELECT generate_date as missing_date 
FROM v_generated_dates
EXCEPT 
SELECT visit_date as missing_date FROM person_visits
ORDER BY missing_date;