# 1 and 2 sessions
begin;

# 1 sesseion
SELECT SUM(rating) FROM pizzeria;

# 2 session
UPDATE pizzeria
SET rating = 1
WHERE name = 'Pizza Hut';
commit;

# 1 sesseion
SELECT SUM(rating) FROM pizzeria;
commit;

# 1 sesseion
SELECT SUM(rating) FROM pizzeria;

# 2 sesseion
SELECT SUM(rating) FROM pizzeria;