CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats
AS (
SELECT pz.name FROM person_visits pv
JOIN person p ON pv.person_id = p.id
JOIN pizzeria pz ON pz.id = pv.pizzeria_id
JOIN menu m ON m.pizzeria_id = pz.id
WHERE p.name = 'Dmitriy' AND 
pv.visit_date = '2022-01-08' AND 
m.price < 800)
WITH DATA;

-- SELECT * FROM mv_dmitriy_visits_and_eats;