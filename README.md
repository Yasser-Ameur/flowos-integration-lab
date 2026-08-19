# FlowOS Integration Lab

An on-demand GitHub Codespaces environment for services used by FlowOS. Its
default, lightweight mode pulls the newest `latest` MiniGoogle container and
uses that image directly as the Codespace container:

- MiniGoogle at port `8080`

The remaining services are retained under the optional Compose profile
`full`, but they do not start or consume resources by default.

## Launch

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/Yasser-Ameur/flowos-integration-lab?quickstart=1)

Choose a 2-core machine for MiniGoogle-only use. The lab starts automatically
from the latest published MiniGoogle image. Use the **Ports** panel to copy the
forwarded MiniGoogle URL. Rebuild the Codespace when you want to pull a newer
image published from `master`.

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
# Verify MiniGoogle from the Codespace terminal
curl http://127.0.0.1:8080/api/v1/health

# Inspect the current dev-container metadata
devcontainer-info
```

Stop the Codespace from GitHub when finished. Only running Codespaces consume
compute quota; stopped Codespaces continue to consume storage until deleted.
