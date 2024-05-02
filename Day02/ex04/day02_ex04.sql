SELECT m.pizza_name, pz.name, m.price FROM menu m
LEFT JOIN pizzeria pz ON pz.id = m.pizzeria_id
WHERE m.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY m.pizza_name, pz.name;