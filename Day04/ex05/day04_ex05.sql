CREATE VIEW v_price_with_discount AS (
SELECT p.name, m.pizza_name, m.price,
CAST( m.price - m.price * 0.1 AS INT) 
AS discount_price
FROM person_order pr
JOIN person p ON p.id = pr.person_id
JOIN menu m ON m.id = pr.menu_id
ORDER BY p.name, m.pizza_name);

SELECT * FROM v_price_with_discount;