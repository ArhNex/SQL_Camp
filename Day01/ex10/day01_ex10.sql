SELECT ( SELECT name FROM person
        WHERE id = po.person_id
           ) as person_name,
    m.pizza_name as pizza_name,
        (SELECT name FROM pizzeria
        WHERE id = m.pizzeria_id) as pizzeria_name
        FROM person_order po
JOIN menu  m ON m.id = po.menu_id
ORDER BY person_name, pizza_name, pizzeria_name;
