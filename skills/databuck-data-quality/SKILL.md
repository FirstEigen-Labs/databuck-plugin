---
name: databuck-data-quality
description: Produce DataBuck's standard reports - Data Trust Score (DTS) check, validation summary over a period, and failed-run report - and answer DataBuck product how-to or navigation questions.
---

# Standard reports and help

## How-to questions

Use `databuck_user_guide` with the user's question for "how do I ... in
DataBuck" and navigation questions. Do not answer them from general knowledge.

## Standard reports

These run on `pg_query`; follow the query rules in the databuck-pg-query
skill. For one validation's summary, use `get_validation_summary` instead.
All of them are read-only.

### Data Trust Score check

Default to the last 7 days and an alert threshold of 50. Take each
validation's most recent score, list those under the threshold from lowest
up, and note tables whose score declined during the period. Always show the
score and the period.

### Validation summary

Default to all datasources over the last 7 days: totals, passed and failed
counts, the worst validations, failing checks with their datasource and
table, and two or three recommended next actions, as a table.

### Failed runs

Default to the last 7 days: each failed run with validation name, start and
end time, from `runscheduledtasks` joined to `listapplications`. End with the
validations that failed more than once.
