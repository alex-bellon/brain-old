# SQL

- [SQL Murder Mystery](https://mystery.knightlab.com/)

## Learn
There's knowing SQL and then _knowing_ SQL. It's one thing to be able to do simple CRUD operations with SQL, but stuff like the following is much rarer and more valuable:
- complex aggregations (`aggregate() filter (where ...)`)
- window functions (`row_number() over (partition by ...)`)
- CTEs (`with some_query as (...) select from some_query ...`)
- using `exists` properly in where clauses for performance
- knowing which types of where clauses are detrimental to performance
- knowing the details of how various combinations of joins will improve or harm performance
- knowing how to properly design schemas
- knowing how to correctly index tables for the queries used