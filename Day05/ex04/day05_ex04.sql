CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);
EXPLAIN ANALYSE
SELECT * FROM menu
WHERE pizza_name = 'cheese pizza';

-- DROP INDEX "idx_menu_unique";