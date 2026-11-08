#!/usr/bin/env bash
set -euo pipefail

claude mcp remove chrome-devtools -s user 2>/dev/null || true
claude mcp add -s user chrome-devtools -- docker run -i --rm --init --network=host node:24-slim npx -y chrome-devtools-mcp@latest --browserUrl=http://127.0.0.1:9222
