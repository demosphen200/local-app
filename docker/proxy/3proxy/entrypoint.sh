#!/bin/sh
set -e

# Replace placeholders in config
sed -i "s/{{UPSTREAM_HOST}}/${UPSTREAM_HOST}/g" /etc/3proxy/3proxy.cfg
sed -i "s/{{UPSTREAM_PORT}}/${UPSTREAM_PORT}/g" /etc/3proxy/3proxy.cfg
sed -i "s/{{UPSTREAM_USER}}/${UPSTREAM_USER}/g" /etc/3proxy/3proxy.cfg
sed -i "s/{{UPSTREAM_PASS}}/${UPSTREAM_PASS}/g" /etc/3proxy/3proxy.cfg

# Execute 3proxy
exec 3proxy /etc/3proxy/3proxy.cfg
