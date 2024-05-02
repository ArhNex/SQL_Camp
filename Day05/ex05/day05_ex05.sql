CREATE UNIQUE INDEX idx_person_order_order_date ON person_order (person_id, menu_id) WHERE order_date='2022-01-01';

EXPLAIN ANALYSE
SELECT person_id FROM person_order 
WHERE person_id = 2 AND menu_id = 9 AND order_date = '2022-01-01'; 

-- DROP INDEX "idx_person_order_order_date"