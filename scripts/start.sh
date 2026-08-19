#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

echo "Pulling the latest service images..."
docker compose pull
docker compose up -d --remove-orphans

echo
docker compose ps
echo
echo "The lab is ready. Open the Ports panel for MiniGoogle and NotiFly URLs."
echo "Pulse is available to FlowOS inside this Codespace at pulse:9090."
