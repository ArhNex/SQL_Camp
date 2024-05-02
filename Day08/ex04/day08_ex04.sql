# start transaction 1 and 2 sessions
begin transaction isolation level serializable;

# 1 session
SELECT * FROM pizzeria
WHERE name = 'Pizza Hut';

# 2 Session
UPDATE pizzeria
SET rating = 3.0
where name = 'Pizza Hut';

# 1 session
SELECT * FROM pizzeria
WHERE name = 'Pizza Hut';
