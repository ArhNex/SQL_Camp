SELECT order_date,
       ( p.name || ' (' || 'age:' || age || ')')
       as person_information FROM person_order pr
JOIN person p ON p.id = pr.person_id
ORDER BY order_date, person_information;