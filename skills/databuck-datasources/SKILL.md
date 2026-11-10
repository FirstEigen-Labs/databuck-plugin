---
name: databuck-datasources
description: List, search, page through, and count DataBuck datasources (connections) and onboarded tables. Use for "list my datasources", "find the datasource for table X", "tables starting with Matching", "how many Snowflake connections were created this month", or "show page 2".
---

# Datasources and tables

- Whole inventory: `list_all_datasources`; "next page" or "page N":
  `get_datasources_page`.
- Find a table or its datasource, by name, prefix or connection type:
  `list_datasources`.
- Counts, dates, inactive or all-status questions: `pg_query` (see the
  databuck-pg-query skill).

Present results as a table.
