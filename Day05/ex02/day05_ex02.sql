CREATE INDEX idx_person_name ON person (upper(name));
EXPLAIN ANALYSE 
SELECT * FROM person
WHERE upper(name) = 'ANNA';

-- DROP INDEX "idx_person_name";