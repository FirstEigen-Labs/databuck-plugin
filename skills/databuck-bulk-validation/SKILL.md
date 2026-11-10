---
name: databuck-bulk-validation
description: Work from a CSV of tables in DataBuck - resolve every table to its datasource and existing validations, then bulk-create validations and wait for them. Use whenever the user attaches or pastes a CSV of tables, for any purpose (onboard, validate, summarize, rerun).
---

# Bulk validation from a CSV

When the user gives a CSV of tables, for any purpose:

1. Resolve the tables with `prepare_bulk_validation` and point out rows that
   could not be resolved.
2. Do what the user asked with the resolved rows (summary, rerun, onboard).
3. To onboard: show the preview and get a Yes, then `bulk_create_validations`,
   then `bulk_check_status` for the results.
