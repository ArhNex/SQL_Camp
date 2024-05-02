# 1 and 2 session
begin;

# 1 session
SELECT * FROM pizzeria
WHERE name = 'Pizza Hut';

# 2 Session
UPDATE pizzeria
SET rating = 3.6
where name = 'Pizza Hut';
