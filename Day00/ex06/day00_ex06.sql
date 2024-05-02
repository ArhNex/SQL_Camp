SELECT (SELECT p.name FROM person p where p.id = po.person_id) as person_name,
       (SELECT name FROM person where id = person_id) = 'Denis' as check_name
from person_order po
where menu_id in (13, 14, 18)
and order_date = '2022-01-07';

-- SELECT (SELECT p.name FROM person p where p.id = po.person_id) as person_name,
--        (SELECT CASE WHEN p.name = 'Denis' THEN true
--         ELSE false
--         END
--         FROM person p where p.id = po.person_id) as check_name
-- from person_order po
-- where menu_id in (13, 14, 18)
-- and order_date = '2022-01-07';


-- Please use SQL construction from 
-- Exercise 05 and add a new calculated 
-- column (use column's name ‘check_name’) 
-- with a check statement (a pseudo code for 
-- this check is presented below) in the SELECT clause.

-- if (person_name == 'Denis') then return true
--     else return false