insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH user_t as (
SELECT 
    COALESCE(u.name, 'not defined') as name,
    COALESCE(u.lastname, 'not defined') as lastname, 
    (SELECT cu.name FROM currency cu WHERE cu.id = b.currency_id GROUP BY name) as currency_name,
    COALESCE(
        (SELECT cu.updated FROM currency cu 
            WHERE b.updated >= cu.updated and b.currency_id = cu.id 
            ORDER BY 1 DESC limit 1),
        (SELECT cu.updated FROM currency cu 
            WHERE b.updated <= cu.updated and b.currency_id = cu.id 
            ORDER BY 1 limit 1)
    )as cu_date,
    b.money as money
FROM "user" u
FULL JOIN balance b ON b.user_id = u.id)
SELECT 
name, lastname, currency_name,
(SELECT cu.rate_to_usd FROM currency cu
WHERE currency_name = cu.name and cu_date = cu.updated) * money as currency_in_usd
FROM user_t 
where currency_name IS NOT NULL
ORDER BY 1 DESC, 2, 3;
