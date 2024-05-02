WITH piz_b as (
SELECT m.pizza_name, pz.name as pizzeria_name, m.price FROM menu m
JOIN pizzeria pz ON pz.id = m.pizzeria_id 
)
SELECT pz.pizza_name, 
pz.pizzeria_name as pizzeria_name_1, 
pz2.pizzeria_name as pizzeria_name_2,
pz.price  FROM piz_b pz
JOIN piz_b pz2 ON pz.pizza_name = pz2.pizza_name and 
pz.price = pz2.price and pz.pizzeria_name != pz2.pizzeria_name
ORDER BY pizza_name;