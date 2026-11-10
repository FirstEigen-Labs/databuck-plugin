---
name: databuck-setup
description: Connect to the user's own DataBuck MCP server (their server URL plus access and secret keys), or check who they are signed in as. Use on first use of DataBuck, when DataBuck tools are missing, when authentication fails, or when the user asks "who am I", their role, login group, or projects.
---

# Connect your DataBuck server

Every DataBuck deployment has its own MCP server, so this plugin ships no
server URL and no credentials. Each user connects their own.

## If DataBuck tools are not available

Do not answer DataBuck questions from general knowledge. Walk the user through
connecting. In every host:

- Ask for their DataBuck MCP server URL (for example
  `https://<DATABUCK_HOST>:8001/`). Never assume a URL.
- Tell them to create an access key and secret key on DataBuck's
  **Generate MCP Token** screen. Never ask them to paste the keys into the
  chat; if they do, tell them to regenerate the keys.

### Claude Code

The plugin asks for the server URL, access key and secret key when it is
enabled. To change them, the user reconfigures or reinstalls the DataBuck
plugin, then restarts Claude Code.

### OpenAI Codex

1. Have them open `~/.codex/config.toml` (Codex app: Settings > Open
   config.toml) and add this, replacing the placeholders. Keep any other
   servers already in the file. If a `[mcp_servers.databuck]` section exists,
   edit it instead of adding a second one.

   ```toml
   [mcp_servers.databuck]
   enabled = true
   url = "https://<DATABUCK_HOST>:8001/"
   tool_timeout_sec = 600

   [mcp_servers.databuck.http_headers]
   X-Databuck-Access-Key = "<ACCESS_KEY>"
   X-Databuck-Secret-Key = "<SECRET_KEY>"
   ```

   You may add the section with their URL and the `<ACCESS_KEY>` /
   `<SECRET_KEY>` placeholders for them to fill in themselves.

   Terminal-only alternative: instead of `http_headers`, put
   `env_http_headers = { "X-Databuck-Access-Key" = "DATABUCK_ACCESS_KEY", "X-Databuck-Secret-Key" = "DATABUCK_SECRET_KEY" }`
   under `[mcp_servers.databuck]` and export those two variables in
   `~/.zshrc`. The Codex app does not read `~/.zshrc`.

2. Ask them to quit and reopen Codex, then call `ping` to confirm.

To switch to a different DataBuck deployment, change only `url` (and the keys
if that deployment issued different ones).

## Who am I

Call `ping`. It returns the signed-in user's email, role, selected login group,
accessible projects and domains, and login groups. Answer "who am I", "my role",
"my projects" from it, never from database tables.

- If several login groups are returned and none is selected, ask which one to
  use and pass it as `selected_group` on later calls.
- To switch project, pass `project_id` + `domain_id`, or the project name as the
  user wrote it. If refused, say the user has no access and list their
  accessible projects.

## Authentication failures

If a call fails authentication, tell the user to check their access and secret
keys: in Claude Code, the plugin's configuration; in Codex,
`~/.codex/config.toml` (or, with the terminal method, the environment
variables in the terminal Codex was started from). Never retry with guessed
credentials.
