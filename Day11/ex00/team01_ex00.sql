WITH result_t_w as (
SELECT 
    COALESCE(u.name, 'not defined') as name, 
    COALESCE(u.lastname, 'not defined') as lastname, 
    b."type" as type,
    SUM(b.money) as volume,
    COALESCE((SELECT cu.name 
        FROM currency cu 
        WHERE cu.id = b.currency_id 
        group by cu.name), 'not defined' )as currency_name,
    COALESCE((SELECT rate_to_usd FROM currency cu 
        WHERE cu.name =  (SELECT cu.name 
            FROM currency cu 
            WHERE cu.id = b.currency_id 
            group by cu.name)
        ORDER BY cu.updated DESC LIMIT 1), 1)as last_rate_to_usd
FROM "user" u 
FULL JOIN balance b ON b.user_id = u.id
GROUP BY 1, 2, 3, 5, 6
ORDER BY 1 DESC, 2, 3)
SELECT *, 
    (volume * last_rate_to_usd) as total_volume_in_usd 
FROM result_t_w
ORDER BY 1 DESC, 2, 3;

-- SELECT * FROM balance;
-- SELECT * FROM currency;
-- SELECT * FROM "user";
