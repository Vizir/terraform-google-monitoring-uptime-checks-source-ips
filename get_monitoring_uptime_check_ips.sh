#!/usr/bin/env sh

set -e

ips=$( \
  curl -sSL https://monitoring.googleapis.com/v3/uptimeCheckIps \
    -H "Authorization: Bearer $(gcloud auth print-access-token)" \
  | jq -c '.uptimeCheckIps | map(.ipAddress + "/32") | join(",")'
)

jq -n --arg ips "$ips" '{"ips": $ips}'

