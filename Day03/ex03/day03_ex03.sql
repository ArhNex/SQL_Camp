WITH man_b as (
WITH m_p as (
SELECT * FROM person
WHERE  gender = 'male')
SELECT pz.name as pizzeria_name
FROM m_p
JOIN person_visits ps ON ps.person_id = m_p.id
JOIN pizzeria pz ON pz.id = ps.pizzeria_id
ORDER BY pizzeria_name),
woman_b as 
(
WITH m_p as (
SELECT * FROM person
WHERE  gender = 'female')
SELECT pz.name as pizzeria_name
FROM m_p
JOIN person_visits ps ON ps.person_id = m_p.id
JOIN pizzeria pz ON pz.id = ps.pizzeria_id
ORDER BY pizzeria_name
), woman_ex_man as
(
SELECT pizzeria_name FROM woman_b
EXCEPT ALL
SELECT pizzeria_name FROM man_b
), man_ex_woman as 
(
SELECT pizzeria_name FROM man_b
EXCEPT ALL
SELECT pizzeria_name FROM woman_b
)
SELECT * FROM woman_ex_man
UNION ALL
SELECT * FROM man_ex_woman
ORDER BY pizzeria_name;
