#!/bin/sh
# Builds dist/databuck-openai-plugin.zip for OpenAI's plugin upload portal.
# Claude-only files (.claude-plugin/, .mcp.json) are left out so the OpenAI
# package stays skills-only.
set -eu
cd "$(dirname "$0")/.."
mkdir -p dist
rm -f dist/databuck-openai-plugin.zip
zip -rq dist/databuck-openai-plugin.zip \
  plugin.json README.md LICENSE codex-config.example.toml assets skills \
  -x '*/.DS_Store'
echo "Built dist/databuck-openai-plugin.zip"
