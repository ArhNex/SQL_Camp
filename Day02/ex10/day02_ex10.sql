SELECT p1.name, p2.name, p1.address FROM person p1
JOIN person p2 ON p1.address = p2.address and p1.id > p2.id;