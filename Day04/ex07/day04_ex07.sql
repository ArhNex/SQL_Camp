INSERT INTO person_visits (id, person_id, 
pizzeria_id, visit_date)
VALUES
(
    (SELECT COUNT(id)+1 FROM person_visits),
    9,
    5,
    '2022-01-08'
);

REFRESH MATERIALIZED VIEW 
mv_dmitriy_visits_and_eats;

-- SELECT * FROM mv_dmitriy_visits_and_eats;