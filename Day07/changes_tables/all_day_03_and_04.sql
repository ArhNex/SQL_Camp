INSERT INTO menu 
(id, pizzeria_id, pizza_name, price)
VALUES (19, 2, 'Greek pizza', 800);

INSERT INTO menu (id, pizzeria_id, 
pizza_name, price)
SELECT MAX(id)+1 as id, (
    SELECT id FROM pizzeria
    WHERE name = 'Dominos'
) as pizzeria_id
,'Sicilian pizza', 900
 FROM menu;

INSERT INTO person_visits
(id, person_id, pizzeria_id, visit_date)
SELECT COUNT(*)+1, 
(SELECT id FROM person
WHERE name = 'Denis'), 
(SELECT id FROM pizzeria
WHERE name = 'Dominos'),
'2022-02-24'
FROM person_visits;

INSERT INTO person_visits
(id, person_id, pizzeria_id, visit_date)
SELECT COUNT(*)+1, 
(SELECT id FROM person
WHERE name = 'Irina'), 
(SELECT id FROM pizzeria
WHERE name = 'Dominos'),
'2022-02-24'
FROM person_visits;

INSERT INTO person_order 
(id, person_id, menu_id, order_date)
VALUES 
(
    (SELECT COUNT(*)+1 FROM person_order),
    (SELECT id FROM person
    WHERE name = 'Denis'),
    (SELECT id FROM menu
    WHERE pizza_name = 'Sicilian pizza'),
    '2022-02-24'
),
(
    (SELECT COUNT(*)+2 FROM person_order),
    (SELECT id FROM person
    WHERE name = 'Irina'),
    (SELECT id FROM menu
    WHERE pizza_name = 'Sicilian pizza'),
    '2022-02-24'
);

UPDATE menu m 
SET price = 
(
    SELECT price * 0.9 FROM menu
    WHERE pizza_name = 'Greek pizza'
)
WHERE pizza_name = 'Greek pizza';

INSERT INTO person_order (id, person_id, menu_id, 
order_date)
SELECT 
(
    SELECT COUNT(*) + p.id FROM person_order
),
p.id,
(
    SELECT id FROM menu
    WHERE pizza_name = 'Greek pizza'
),
'2022-02-25'
FROM person p;

DELETE FROM person_order
WHERE order_date = '2022-02-25';

DELETE FROM menu
WHERE pizza_name = 'Greek pizza';

INSERT INTO person_visits (id, person_id, 
pizzeria_id, visit_date)
VALUES
(
    (SELECT COUNT(id)+1 FROM person_visits),
    9,
    3,
    '2022-01-08'
);

