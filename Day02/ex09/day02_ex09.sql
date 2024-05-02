WITH pep_t as (
SELECT p.name, m.pizza_name FROM person_order pr
JOIN menu m ON m.id = pr.menu_id
JOIN person p ON p.id = pr.person_id
WHERE p.gender = 'female' AND m.pizza_name = 'pepperoni pizza'),
    che_t as (
        SELECT p.name, m.pizza_name FROM person_order pr
JOIN menu m ON m.id = pr.menu_id
JOIN person p ON p.id = pr.person_id
WHERE p.gender = 'female' AND m.pizza_name = 'cheese pizza'
    )
SELECT pep_t.name as name FROM pep_t
JOIN che_t  ON pep_t.name = che_t.name
ORDER BY name;
