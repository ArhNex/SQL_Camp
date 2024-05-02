SELECT order_date,
       ( p.name || ' (' || 'age:' || age || ')')
       as person_information FROM person_order pr
NATURAL JOIN (SELECT id as person_id, name, age FROM person) as per
ORDER BY order_date, person_information;
