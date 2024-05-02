WITH tbl as (
SELECT missing_date::date
FROM generate_series(date '2022-01-01', date '2022-01-10', interval '1 day') as missing_date
         LEFT JOIN (SELECT pr.visit_date FROM person_visits pr WHERE (person_id = 1 or person_id = 2)) pp
                   ON pp.visit_date = missing_date
WHERE visit_date IS NULL
ORDER BY missing_date ASC)
SELECT * FROM tbl;