-- Используя слудующие конструкции я начал транзакцию и завершил её
BEGIN TRANSACTION;
UPDATE pizzeria
    SET rating = 5
    WHERE name = 'Pizza Hut';
COMMIT TRANSACTION;