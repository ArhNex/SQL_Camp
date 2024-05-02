CREATE VIEW v_generated_dates AS
SELECT generate_date::date FROM generate_series(
    date '2022-01-01', date '2022-01-31',
    interval '1 day'
    ) as generate_date
    ORDER BY generate_date;

-- SELECT * FROM v_generated_dates;