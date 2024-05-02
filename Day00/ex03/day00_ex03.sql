SELECT DISTINCT person_id FROM person_visits
WHERE visit_date >= '2022-01-06' and  visit_date <= '2022-01-09' or pizzeria_id = 2
ORDER BY person_id DESC; 


-- Please make a select statement which returns the person's 
-- identifiers (without duplication) who visited pizzerias in a 
-- period from 6th of January 2022 to 9th of January 2022 (including all days) 
-- or visited pizzeria with identifier 2. Also include ordering clause by person 
-- identifier in descending mode.