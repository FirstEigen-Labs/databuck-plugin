---
name: databuck-reruns
description: Rerun one or many DataBuck validations and report the result. Use for "rerun validation 123", "run the validation for table X again", or rerunning a list of validations at once.
---

# Rerun validations

1. Resolve the validation IDs and ask for the run type (Unit test run or Full
   load run) if the user did not say.
2. List what will be rerun and get a Yes.
3. One validation: `rerun_validation`, then show `get_validation_summary`.
   Several: `trigger_rerun` for each, then `check_rerun_status` for all.
