#!/bin/sh
set -e

if [ -n "$UPSTREAM_USER" ] && [ -n "$UPSTREAM_PASS" ]; then
    # Calculate base64 of user:pass
    UPSTREAM_AUTH_BASE64=$(echo -n "$UPSTREAM_USER:$UPSTREAM_PASS" | base64)
    # Replace placeholder in template and write to actual config location
    sed "s|{{UPSTREAM_AUTH_BASE64}}|$UPSTREAM_AUTH_BASE64|g; s|{{UPSTREAM_HOST}}|$UPSTREAM_HOST|g; s|{{UPSTREAM_PORT}}|$UPSTREAM_PORT|g" /etc/envoy/envoy.yaml.tmpl > /etc/envoy/envoy.yaml
else
    echo "Error: UPSTREAM_USER and UPSTREAM_PASS environment variables must be set."
    exit 1
fi

# Execute the CMD from docker-compose or dockerfile
exec "$@"
