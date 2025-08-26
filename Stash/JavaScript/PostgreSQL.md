# Working with PostgreSQL from JavaScript

This document also includes non-javascript related notes.

Reference document: [JSON Functions and Operators](https://www.postgresql.org/docs/current/functions-json.html)

## Return Rows as JSON

```sql
SELECT row_to_json(n)
FROM (
  SELECT id, name FROM contacts
) AS n
```

## Custom JSON Result

```sql

select row_to_json(u)
from (
  select first_name, last_name,
    (
      select array_to_json(array_agg(b))
      from (
        select number, position, time, flag_type
        from laps
        inner join racer_laps
        on laps.id = racer_laps.lap_id
        where racer_laps.racer_id = racers.id
      ) b
    ) as laps
  from racers
  where first_name = 'Jack'
) u;

{
  "first_name": "Jack",
  "last_name": "Altenwerth",
  "laps": [
    {
      "number": 1,
      "position": 4,
      "time": "628.744",
      "flag_type": "Green"
    },
    {
      "number": 2,
      "position": 4,
      "time": "614.424",
      "flag_type": "Green"
    },
    ...
  ]
}

```
