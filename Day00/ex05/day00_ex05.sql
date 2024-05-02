
SELECT (SELECT p.name
FROM person p where po.person_id = p.id) as person_name
from person_order po 
where menu_id in (13, 14, 18) 
and order_date = '2022-01-07';


-- SELECT DISTINCT (SELECT name FROM pizzeria 
-- where id = pizzeria_id) as name_pizzeria
-- from menu
-- where price BETWEEN 700 and 900
-- ORDER BY name_pizzeria ASC;


-- select * from person_order

-- Please make a select statement which 
-- returns person's names (based on internal 
-- query in SELECT clause) who made orders 
-- for the menu with identifiers 13 , 14 and 18 
-- and date of orders should be equal 7th of 
-- January 2022. Be aware with "Denied Section" 
-- before your work.