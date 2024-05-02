SELECT 
    pz.name, 
    COUNT(pz.name) as count_of_orders,
    ROUND(
    AVG(m.price), 2) as average_price,
    MAX(m.price) as max_price,
    min(m.price) as min_price
FROM person_order po
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria pz ON pz.id = m.pizzeria_id
GROUP BY pz.name
ORDER BY pz.name