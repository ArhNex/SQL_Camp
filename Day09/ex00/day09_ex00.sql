CREATE TABLE IF NOT EXISTS person_audit (
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    type_event char DEFAULT 'I' NOT NULL,
    row_id BIGINT NOT NULL,
    name varchar,
    age integer,
    gender varchar,
    address varchar,
    CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'D', 'U'))
)

-- DROP TABLE IF EXISTS person_audit;

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() 
    RETURNS TRIGGER AS $trg_person_insert_audit$
    BEGIN
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO person_audit SELECT now(), 'I',
            NEW.id,
            NEW.name, NEW.age, NEW.gender, NEW.address;
            RETURN NEW;
        END IF;
        RETURN NULL;
    END;
$trg_person_insert_audit$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
    FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_insert_audit();

-- DROP TRIGGER trg_person_insert_audit ON person;

INSERT INTO person(id, name, age, gender, address) 
VALUES ( 10, 'Damir', 22, 'male', 'Irkutsk');

-- DELETE FROM person WHERE id = 10;

SELECT * FROM person;
SELECT * FROM person_audit;