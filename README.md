# DataBuck plugin

Guided DataBuck data-quality workflows for AI assistants: datasources,
validations, bulk validation from CSV, reruns, schedulers, custom rules,
per-column checks, Data Trust Score reports, database questions, and product
help.

One plugin serves both **Claude Code** and **OpenAI Codex**. It ships no
server URL and no credentials: each user connects their own DataBuck MCP
server, so the same plugin works with every DataBuck deployment. Nothing needs
to be installed besides the assistant itself.

## Repository layout

| Path | Used by | Purpose |
|---|---|---|
| `skills/` | Claude, OpenAI | The workflow skills (shared) |
| `assets/logo.png` | Claude, OpenAI | Plugin icon (shared) |
| `.claude-plugin/plugin.json` | Claude | Claude Code plugin manifest and install-time settings |
| `.mcp.json` | Claude | Connects to the user's server with the settings they enter |
| `plugin.json` | OpenAI | OpenAI plugin manifest (skills only) |
| `codex-config.example.toml` | OpenAI | Server block users add to Codex's `config.toml` |
| `scripts/build-openai-zip.sh` | OpenAI | Builds the zip for OpenAI's upload portal |

Keep `version` in `.claude-plugin/plugin.json` and `plugin.json` the same.

## Connect your DataBuck server

First create an access key and secret key on DataBuck's
**Generate MCP Token** screen.

### Claude Code

When you enable the plugin, Claude Code asks for your server URL, access key
and secret key. The keys are stored as sensitive settings, not in this repo.

### OpenAI Codex

Open `~/.codex/config.toml` (Codex app: **Settings > Open config.toml**) and
add the following, replacing `<DATABUCK_HOST>`, `<ACCESS_KEY>` and
`<SECRET_KEY>` with your values:

```toml
[mcp_servers.databuck]
enabled = true
url = "https://<DATABUCK_HOST>:8001/"
tool_timeout_sec = 600

[mcp_servers.databuck.http_headers]
X-Databuck-Access-Key = "<ACCESS_KEY>"
X-Databuck-Secret-Key = "<SECRET_KEY>"
```

Quit and reopen Codex, then ask "ping DataBuck". If you only use Codex from the
terminal, you can keep the keys in environment variables instead; see
[codex-config.example.toml](codex-config.example.toml).

Keep the filled-in file private, and mask the keys if you share it. If keys
are ever exposed, regenerate them on the Generate MCP Token screen.

## Skills

| Skill | Covers |
|---|---|
| databuck-setup | Connecting a server, who am I, login group and project switching |
| databuck-datasources | Listing, searching, paging and counting datasources and tables |
| databuck-validations | Finding, inspecting, creating and updating validations |
| databuck-bulk-validation | Resolving a CSV of tables and bulk-creating validations |
| databuck-reruns | Rerunning one or many validations |
| databuck-schedulers | Listing, creating and running schedulers |
| databuck-custom-rules | Creating and linking custom rules |
| databuck-column-checks | All per-column Data Template checks |
| databuck-pg-query | Ad-hoc database questions: counts, trends, custom SQL |
| databuck-data-quality | Standard DTS, validation-summary and failed-run reports; how-to help |

Every change (create, rerun, schedule, rule, column check, update) asks for
your confirmation first.

## Publishing

- **Claude:** submit this repository; the plugin is at the repository root.
- **OpenAI:** run `scripts/build-openai-zip.sh` and upload
  `dist/databuck-openai-plugin.zip` as a **Skills only** plugin.

## Data sent

Your requests and the tool calls made for them go only to the DataBuck server
you configure, authenticated with your own keys. The plugin itself sends
nothing to FirstEigen or anywhere else and stores no credentials.

## License

[MIT](LICENSE)
