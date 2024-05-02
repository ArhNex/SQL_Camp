SELECT pz.name as pizzeria_name FROM person p
JOIN person_visits pv ON p.id = pv.person_id
JOIN pizzeria pz ON pz.id = pv.pizzeria_id
WHERE p.name = 'Andrey'
EXCEPT
SELECT pz.name as pizzeria_name FROM person p
JOIN person_order pr ON p.id = pr.person_id
JOIN menu m ON m.id = pr.menu_id
JOIN pizzeria pz ON m.pizzeria_id = pz.id
WHERE p.name = 'Andrey';
