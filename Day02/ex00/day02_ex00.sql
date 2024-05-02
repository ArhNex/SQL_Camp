SELECT pz.name, pz.rating FROM person_visits pv
RIGHT JOIN pizzeria pz ON pv.pizzeria_id = pz.id
WHERE pv.person_id IS NULL;