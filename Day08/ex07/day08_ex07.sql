# 1 and 2 session
begin;

# 1
update pizzeria
SET rating = 1
WHERE id = 1;

# 2 
update pizzeria
set rating = 2
WHERE id = 2;

# 1 
update pizzeria
set rating = 3
WHERE id = 2;

# 2
update pizzeria
set rating = 3
WHERE id = 1;

# 1
commit;

# 2
commit;
