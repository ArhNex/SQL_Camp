INSERT INTO person_order (id, person_id, menu_id, 
order_date)
SELECT 
(
    SELECT COUNT(*) + p.id FROM person_order
),
p.id,
(
    SELECT id FROM menu
    WHERE pizza_name = 'Greek pizza'
),
'2022-02-25'
FROM person p;

-- SELECT * FROM person_order;

-- SELECT * FROM person_order;

-- SELECT * FROM generate_series(
--     (
--         SELECT MAX(id)+1 FROM person_order
--     ),
--     (
--         SELECT MAX(id)+1 + (
--             SELECT MAX(id) FROM person
--         ) FROM person_order
        
--     )
-- )