---
name: databuck-custom-rules
description: Create new DataBuck custom rules or link existing ones to a validation. Use for "add a rule that quantity must be greater than 0", "create a pushdown rule", "link rule X to validation 123", or "show the rule catalog".
---

# Custom rules

- Link an existing rule: resolve the validation, show `get_rule_catalog`,
  get the rule name and a Yes, then `link_custom_rule`.
- Create a new rule: offer `get_dimension_list` if no dimension was given,
  show the rule you will create and get a Yes, then `create_custom_rule`. If
  the server refuses the expression, relay why and ask for a correction.
