SELECT m.pizza_name, m.price, pz.name as pizzeria_name, 
pv.visit_date 
FROM person p
JOIN person_visits pv ON p.id = pv.person_id
JOIN pizzeria pz ON pz.id = pv.pizzeria_id
JOIN menu m ON m.pizzeria_id = pz.id
WHERE p.name = 'Kate' 
and m.price BETWEEN 800 and 1000
ORDER BY m.pizza_name, m.price, pz.name;