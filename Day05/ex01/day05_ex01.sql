SET enable_seqscan = OFF; -- ON;
EXPLAIN ANALYSE 
SELECT menu.pizza_name, pizzeria.name FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
