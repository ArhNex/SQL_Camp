SELECT id as object_id, name as object_name from person
UNION
SELECT id as object_id, pizza_name as object_name from menu
ORDER BY object_id, object_name;