SELECT order_date as action_date, person_id from person_order po
INTERSECT
SELECT visit_date as action_date, person_id from person_visits pv
ORDER BY action_date, person_id DESC;
