WITH t_visits as (
SELECT
    pz.name,
    COALESCE(
    (SELECT COUNT(pizzeria_id) FROM person_visits
    WHERE pz.id = pizzeria_id
    GROUP BY pizzeria_id
    ), 0) as count,
    'visit' as action_type
FROM pizzeria pz
ORDER BY count DESC limit 3),
t_order as (
    SELECT 
    pz.name,
    COALESCE (
    (SELECT COUNT(m.pizzeria_id) FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    WHERE pz.id = m.pizzeria_id
    GROUP BY pizzeria_id), 0) as count,
    'order' as action_type
    FROM pizzeria pz
    ORDER BY count DESC limit 3
)
SELECT * FROM t_order
WHERE count IS not NULL
UNION
SELECT * FROM t_visits
WHERE count is not null
ORDER BY action_type ASC, count DESC;

