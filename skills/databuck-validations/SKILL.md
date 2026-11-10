---
name: databuck-validations
description: Find, inspect, create, and update single DataBuck validations - list validations, resolve a table to its validation ID, show a validation summary or column profile, check the latest run, create a validation for a table, or change a validation's settings.
---

# Validations

## Find and inspect

1. Resolve the validation with `get_existing_validations` (or
   `list_all_validations` to browse). If several match and the user did not
   ask for the latest, show them and ask which.
2. Then use `get_validation_summary`, `get_column_profile`, or
   `get_latest_validation_run`. If the summary says the validation has never
   run, offer to run it (databuck-reruns skill).

## Create

1. Find the table with `list_datasources`.
2. Summarize what will be created and get a Yes.
3. `create_validation`, then `check_runtemplatetasks_status` until it
   completes, and report the outcome.

## Change settings

1. `customize_validation` to read the current definition.
2. Show the change and get a Yes.
3. `customize_update_validation` with the edited definition.

Per-column checks are in the databuck-column-checks skill.
