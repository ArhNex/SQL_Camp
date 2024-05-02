
SELECT
    (SELECT name FROM person
    WHERE id = pv.person_id) as person_name,
    (SELECT name FROM pizzeria
    WHERE id = pv.pizzeria_id) as pizzeria_name
    FROM (SELECT *
    FROM person_visits
WHERE visit_date BETWEEN '2022-01-07' and '2022-01-09') as pv
ORDER BY person_name, pizzeria_name DESC;






