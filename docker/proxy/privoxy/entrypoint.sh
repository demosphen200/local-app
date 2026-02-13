#!/bin/sh
set -e

# Calculate base64 of credentials
AUTH_STRING=$(echo -n "${UPSTREAM_USER}:${UPSTREAM_PASS}" | base64)

# Replace placeholders in config
sed -i "s/{{UPSTREAM_HOST}}/${UPSTREAM_HOST}/g" /etc/privoxy/config
sed -i "s/{{UPSTREAM_PORT}}/${UPSTREAM_PORT}/g" /etc/privoxy/config

# Replace placeholders in match-all.action
sed -i "s/{{UPSTREAM_AUTH_BASE64}}/${AUTH_STRING}/g" /etc/privoxy/match-all.action

# Execute the command passed to docker run
exec "$@"
