---
name: databuck-column-checks
description: Enable, disable, set, or clear per-column DataBuck Data Template checks - null check, length and max length check, regex patterns, primary or duplicate key, data type, default values, date consistency, data drift, value anomaly, distribution check, do not display, partition key, match value, thresholds, microsegment, and incremental.
---

# Per-column checks

1. Resolve the validation ID with `get_existing_validations`.
2. `get_column_config` for the check, and show which columns are available
   and already configured.
3. Let the user pick columns if they did not name them, then get a Yes.
4. One `set_column_config` call for all chosen columns. If a column is
   refused, relay the reason and do not retry.
