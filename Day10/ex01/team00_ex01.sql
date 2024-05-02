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