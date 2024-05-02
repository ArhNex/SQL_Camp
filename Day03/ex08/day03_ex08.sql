INSERT INTO menu (id, pizzeria_id, 
pizza_name, price)
SELECT MAX(id)+1 as id, (
    SELECT id FROM pizzeria
    WHERE name = 'Dominos'
) as pizzeria_id
,'Sicilian pizza', 900
 FROM menu;

--  SELECT * FROM menu;

--  DELETE FROM menu
--  WHERE id = 21;