#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

echo "Pulling the latest service images..."
docker compose pull
docker compose up -d --remove-orphans

echo
docker compose ps
echo
echo "MiniGoogle is ready. Open port 8080 from the Ports panel."
