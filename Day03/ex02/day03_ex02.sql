WITH exc_pr as (
SELECT m.id as menu_id FROM menu m
EXCEPT
SELECT pr.menu_id FROM person_order pr)
SELECT m.pizza_name, m.price, pz.name as pizzeria_name 
FROM exc_pr
JOIN menu m ON exc_pr.menu_id = m.id
JOIN pizzeria pz ON pz.id = m.pizzeria_id
ORDER BY m.pizza_name, m.price;