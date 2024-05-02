SELECT action_date, name FROM person p
JOIN
(SELECT order_date as action_date, person_id from person_order po
INTERSECT
SELECT visit_date as action_date, person_id from person_visits pv
ORDER BY action_date, person_id DESC) as per ON p.id = person_id
ORDER BY action_date, name DESC;
