with recursive fib (x, a, b) as (
        select 0, cast(0 as int), cast(1 as int) 
    union all
        select x + 1, b, a + b from fib where x < 16
) select x, a from fib;

