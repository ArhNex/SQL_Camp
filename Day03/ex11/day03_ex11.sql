UPDATE menu m 
SET price = 
(
    SELECT price * 0.9 FROM menu
    WHERE pizza_name = 'Greek pizza'
)
WHERE pizza_name = 'Greek pizza';

-- SELECT * FROM menu;