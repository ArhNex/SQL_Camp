# start transaction 1 and 2 sessions
begin transaction isolation level repeatable read;

# 1 session
SELECT SUM(rating) FROM pizzeria;

# 2 session
UPDATE pizzeria
SET rating = 5
WHERE name = 'Pizza Hut';
commit;

# 1 session
SELECT SUM(rating) FROM pizzeria;
commit;
SELECT SUM(rating) FROM pizzeria;

# 2 session
SELECT SUM(rating) FROM pizzeria;