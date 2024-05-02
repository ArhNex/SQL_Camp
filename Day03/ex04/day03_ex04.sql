WITH female as (SELECT p.name as name, 
pz.name as pizzeria_name FROM person p
JOIN person_order pr ON pr.person_id = p.id
JOIN menu m ON m.id = pr.menu_id
JOIN pizzeria pz ON pz.id = m.pizzeria_id
WHERE p.gender = 'female'),
male as (SELECT p.name, 
pz.name as pizzeria_name 
FROM person p
JOIN person_order pr ON pr.person_id = p.id
JOIN menu m ON m.id = pr.menu_id
JOIN pizzeria pz ON pz.id = m.pizzeria_id
WHERE p.gender = 'male')
SELECT pizzeria_name FROM female
EXCEPT 
SELECT pizzeria_name FROM male
