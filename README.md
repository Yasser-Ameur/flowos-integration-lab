# FlowOS Integration Lab

An on-demand GitHub Codespaces environment for services used by FlowOS. Its
default, lightweight mode pulls the newest `latest` MiniGoogle container and
starts:

- MiniGoogle at port `8080`

The remaining services are retained under the optional Compose profile
`full`, but they do not start or consume resources by default.

## Launch

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/Yasser-Ameur/flowos-integration-lab?quickstart=1)

Choose a 2-core machine for MiniGoogle-only use. The lab starts automatically
and refreshes the MiniGoogle image whenever the Codespace resumes. Use the
**Ports** panel to copy the forwarded MiniGoogle URL.

Port `8080` is configured as public. GitHub may revert a forwarded port to
private after a Codespace restart; if that happens, right-click it in the
**Ports** panel and choose **Port Visibility → Public**.

## FlowOS configuration

When FlowOS runs inside this Codespace or in another container in this Compose
network:

```dotenv
MINIGOOGLE_URL=http://minigoogle:8080
```

When FlowOS runs locally, use the HTTPS URL copied from the Ports panel:

```dotenv
MINIGOOGLE_URL=https://CODESPACE-NAME-8080.app.github.dev
```

## Commands

```bash
# Refresh images and start everything
bash scripts/start.sh

# Optional: start every retained integration service
docker compose --profile full up -d

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
