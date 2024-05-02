SELECT m.pizza_name, pz.name FROM person_order pr
JOIN menu m ON m.id = pr.menu_id
JOIN pizzeria pz ON pz.id = m.pizzeria_id
JOIN person p ON p.id = pr.person_id
WHERE p.name IN ('Denis', 'Anna')
ORDER BY m.pizza_name, pz.name;