---
name: databuck-schedulers
description: List, create, and run DataBuck schedulers and attach them to validations. Use for "show my schedulers", "create a daily scheduler at 6 AM", "run scheduler 12 on validation 345", or "which validations does this scheduler run".
---

# Schedulers

- Show schedulers: `get_all_schedulers`; which validations they run:
  `get_scheduled_tasks`.
- Run one on a validation: show `get_all_schedulers` if no scheduler was
  named, resolve the validation, confirm both and get a Yes, then
  `trigger_scheduler`.
- New scheduler (only when the user asks for one): summarize it, get a Yes,
  then `create_scheduler`.
