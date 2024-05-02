SELECT m.id as menu_id FROM menu m
EXCEPT
SELECT pr.menu_id FROM person_order pr
ORDER BY menu_id;

-- Find all menu identifiers that are not ordered by anyone. 
-- The result should be sorted by identifier. 
-- The sample output is shown below.