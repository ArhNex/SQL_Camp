WITH t_visits as (
SELECT
    pz.name,
    (SELECT COUNT(pizzeria_id) FROM person_visits
    WHERE pz.id = pizzeria_id
    GROUP BY pizzeria_id
    )
FROM pizzeria pz),
t_order as (
    SELECT 
    pz.name,
    (SELECT COUNT(m.pizzeria_id) FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    WHERE pz.id = m.pizzeria_id
    GROUP BY pizzeria_id) as count
    FROM pizzeria pz
)
SELECT 
    tr.name, 
    COALESCE ((SELECT tv.count + tr.count FROM t_visits tv
            WHERE tr.name = tv.name), 0) as total_count
FROM t_order tr
ORDER BY total_count DESC, name ASC




