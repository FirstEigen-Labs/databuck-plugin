# Changelog

All notable changes to the DataBuck plugin. Versions follow
[Semantic Versioning](https://semver.org/); each release is tagged `vX.Y.Z`.

## [Unreleased]

### Added

- `supportURL` (https://firsteigen.com/contact-us/) and `termsOfServiceURL`
  (DataBuck Terms of Service, January 2026) in the OpenAI manifest, and a
  terms link in the README.
- OpenAI manifest: `capabilities` (empty) and `publication.release_notes`.

### Changed

- OpenAI `longDescription` now states intended users, requirements, and
  limitations, as the submission guide asks.

## [1.0.0] - 2026-11-10

First release from this repository. One plugin for Claude Code and OpenAI
Codex.

### Added

- Ten skills: setup, datasources, validations, bulk validation, reruns,
  schedulers, custom rules, column checks, database queries (pg-query), and
  data-quality reports.
- OpenAI manifest (`plugin.json`, skills only) and Claude manifest
  (`.claude-plugin/plugin.json` with `.mcp.json`).
- DataBuck logo and brand color.
- Website, privacy policy, repository, and MIT license in both manifests.
- `scripts/build-openai-zip.sh` to build the OpenAI upload package.

### Changed

- No default server URL: every user connects their own DataBuck server with
  their own access and secret keys.
- Developer name is FirstEigen; plugin name is DataBuck.
