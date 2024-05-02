INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT ROW_NUMBER() OVER () as id, 
(SELECT id FROM person p WHERE p.id = pr.person_id) as person_id,
(SELECT pizzeria_id FROM menu m WHERE m.id = pr.menu_id) as pizzeria_id,
CASE 
    WHEN (COUNT(pr.person_id) = 1) THEN 10.5
    WHEN (COUNT(pr.person_id) = 2) THEN 22
    ELSE 30
    END AS discount
 FROM person_order pr
GROUP BY 2,3;

-- DROP TABLE person_discounts;

SELECT * FROM person_discounts
