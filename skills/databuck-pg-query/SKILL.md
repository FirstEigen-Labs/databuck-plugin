---
name: databuck-pg-query
description: Answer ad-hoc questions from DataBuck's database with read-only SQL - counts, lists, trends, and history across validations, runs, scores, datasources, and tables. Use for "how many validations failed last week", "tables onboarded per month", "DTS trend for validation X", or any question needing a custom query.
---

# Database questions

1. Write one SELECT for `pg_query`, following its tool description for tables
   and patterns. Check unfamiliar columns with `pg_describe_table` first.
2. Show the result as a table, stating the period and filters used.
3. If the query fails, fix it from the error; never guess column names.

Use the exact dates the user gives, with `>=` and `<` bounds rather than
BETWEEN. Answer "who am I" or project membership with `ping`, not a query.
