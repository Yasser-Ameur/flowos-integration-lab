# FlowOS Integration Lab

An on-demand GitHub Codespaces environment for the external services used by
FlowOS. It pulls the newest `latest` container published from each service's
default branch and starts:

- MiniGoogle at port `8080`
- NotiFly at port `8000`, backed by PostgreSQL and Redis
- Pulse at port `9090` over native gRPC

## Launch

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/Yasser-Ameur/flowos-integration-lab?quickstart=1)

Choose a 4-core machine initially. The lab starts automatically and refreshes
all service images whenever the Codespace resumes. Use the **Ports** panel to
copy the forwarded MiniGoogle and NotiFly URLs. GitHub will ask you once to
authorize read-only package access to the three service repositories.

Public ports revert to private after a Codespace restart. Keep them private
when you run FlowOS in the Codespace. If FlowOS runs on your computer,
right-click ports `8080` and `8000` in the Ports panel and change **Port
Visibility** to **Public** for that session.

## FlowOS configuration

When FlowOS runs inside this Codespace or in another container in this Compose
network:

```dotenv
MINIGOOGLE_URL=http://minigoogle:8080
NOTIFLY_URL=http://notifly:8000
PULSE_ADDR=pulse:9090
```

When FlowOS runs locally, use the two HTTPS URLs copied from the Ports panel:

```dotenv
MINIGOOGLE_URL=https://CODESPACE-NAME-8080.app.github.dev
NOTIFLY_URL=https://CODESPACE-NAME-8000.app.github.dev
```

Pulse uses plaintext native gRPC. Codespaces' public HTTP/HTTPS forwarding is
not a transparent raw-TCP tunnel, so Pulse should be consumed by FlowOS inside
the Codespace at `pulse:9090`. MiniGoogle and NotiFly can be consumed either
inside the Codespace or from local FlowOS.

## Commands

```bash
# Refresh images and start everything
bash scripts/start.sh

# Inspect status and logs
docker compose ps
docker compose logs -f --tail=100

# Stop containers but retain their named volumes
bash scripts/stop.sh

# Remove containers and all lab data
docker compose down --volumes
```

Stop the Codespace from GitHub when finished. Only running Codespaces consume
compute quota; stopped Codespaces continue to consume storage until deleted.
