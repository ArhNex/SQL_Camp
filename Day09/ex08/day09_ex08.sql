CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10) 
RETURNS TABLE (num INTEGER) AS $$
DECLARE
    a INTEGER := 0;
    b INTEGER := 1;
    temp INTEGER;
BEGIN
WHILE a < pstop LOOP
        num := a;
        RETURN NEXT;
        temp := a;
        a := b;
        b := temp + b;
    END LOOP;
END;
$$ LANGUAGE PLPGSQL;

SELECT num from fnc_fibonacci(100);
SELECT num from fnc_fibonacci();
