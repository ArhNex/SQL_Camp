SELECT p.name FROM person_order pr
JOIN person p ON p.id = pr.person_id
JOIN menu m  ON m.id = pr.menu_id
WHERE p.address IN ('Moscow', 'Samara') 
    and m.pizza_name IN ('pepperoni pizza', 'mushroom pizza') 
    and p.gender = 'male'
ORDER BY p.name DESC;