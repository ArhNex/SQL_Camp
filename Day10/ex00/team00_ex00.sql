create table Tour
(point1 varchar,
point2 varchar,
cost integer);

insert into Tour values ('A', 'B', 10);
insert into Tour values ('A', 'D', 20);
insert into Tour values ('A', 'C', 15);
insert into Tour values ('B', 'C', 35);
insert into Tour values ('B', 'D', 25);
insert into Tour values ('C', 'D', 30);

insert into Tour(point1, point2, cost)
select t.point2, t.point1, t.cost from Tour t;

with recursive short_tour as
(
    select t1.point1,
           t1.point2 as next,
           t1.cost as res_sum,
           1 as level,
           array[point1, point2] as arr_ptr
    from Tour t1
    union
    select st.point1, st.next, res_sum+t2.cost, (level + 1) as level, array_append(st.arr_ptr, t2.point2) from short_tour st
    join Tour t2 on t2.point1 = st.next
    where st.level < 4
),
filter_tbl  as (
    select * from short_tour st2
where st2.arr_ptr[1] = st2.arr_ptr[5]
  and st2.arr_ptr[1] = 'A'
  and st2.arr_ptr[5] = 'A'
  and 'B' = any(st2.arr_ptr)
  and 'C' = any(st2.arr_ptr)
  and 'D' = any(st2.arr_ptr)
  and cardinality(st2.arr_ptr) = 5
)
select tt.res_sum total_cost, tt.arr_ptr tour from filter_tbl tt
where res_sum = (select min(g.res_sum) from filter_tbl g);