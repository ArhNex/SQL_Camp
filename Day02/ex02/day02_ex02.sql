SELECT COALESCE(p.name, '-') as person_name,
        pp.visit_date as visit_date,
        COALESCE(pz.name, '-') as pizzeria_name
FROM person p
LEFT JOIN (SELECT pv.person_id, pv.visit_date, pv.pizzeria_id FROM person_visits pv
                   WHERE pv.visit_date BETWEEN '2022-01-01' and '2022-01-03') pp ON pp.person_id = p.id
FULL JOIN pizzeria pz ON pz.id = pp.pizzeria_id
ORDER BY person_name, visit_date, pizzeria_name;