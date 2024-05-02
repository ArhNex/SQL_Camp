SELECT p.name, m.pizza_name, m.price,
ROUND(m.price - ((m.price * pd.discount) / 100)) as discount_price,
pz.name
FROM person_order po
JOIN menu m ON m.id = po.menu_id
JOIN person p ON p.id = po.person_id
JOIN person_discounts pd ON pd.person_id = p.id 
JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY p.name, m.pizza_name