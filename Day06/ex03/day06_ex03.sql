SET enable_seqscan = OFF; 

CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts (person_id, pizzeria_id);

EXPLAIN ANALYSE
SELECT person_id, pizzeria_id FROM person_discounts
WHERE person_id = 2;

-- DROP INDEX "idx_person_discounts_unique";2