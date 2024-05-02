alter table person_discounts
    add constraint ch_nn_person_id check (person_id IS NOT NULL),
    add constraint ch_nn_pizzeria_id check (pizzeria_id IS NOT NULL),
    add constraint ch_nn_discount check (discount IS NOT NULL),
    add constraint ch_range_discount check (discount BETWEEN 0 and 100),
    ALTER COLUMN discount
        SET DEFAULT 0;

-- alter table person_discounts
--     DROP constraint ch_nn_person_id,
--     DROP constraint ch_nn_pizzeria_id,
--     DROP constraint ch_nn_discount,
--     DROP constraint ch_range_discount;

-- INSERT INTO person_discounts (id, person_id, pizzeria_id)
-- SELECT 20, 6, 6;
-- SELECT * FROM person_discounts;