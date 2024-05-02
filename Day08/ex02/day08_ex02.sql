# start transaction 1 and 2 sessions
begin transaction isolation level repeatable read;

SELECT * FROM pizzeria
WHERE name = 'Pizza Hut';

# 1 Session
UPDATE pizzeria
SET rating = 4
where name = 'Pizza Hut';

# 2 Session
UPDATE pizzeria
SET rating = 3.6
where name = 'Pizza Hut';

# 1 and 2 Sessions
SELECT * FROM pizzeria
WHERE name = 'Pizza Hut';