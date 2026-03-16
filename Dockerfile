FROM node:lts-trixie-slim AS base
RUN apt-get update \
  && apt-get install -y --no-install-recommends ca-certificates curl git \
  && rm -rf /var/lib/apt/lists/*
RUN corepack enable

FROM base AS deps
WORKDIR /app
COPY package.json pnpm-workspace.yaml pnpm-lock.yaml .npmrc ./
COPY cli/package.json cli/
COPY server/package.json server/
COPY ui/package.json ui/
COPY packages/shared/package.json packages/shared/
COPY packages/db/package.json packages/db/
COPY packages/adapter-utils/package.json packages/adapter-utils/
COPY packages/adapters/claude-local/package.json packages/adapters/claude-local/
COPY packages/adapters/codex-local/package.json packages/adapters/codex-local/
COPY packages/adapters/cursor-local/package.json packages/adapters/cursor-local/
COPY packages/adapters/gemini-local/package.json packages/adapters/gemini-local/
COPY packages/adapters/openclaw-gateway/package.json packages/adapters/openclaw-gateway/
COPY packages/adapters/opencode-local/package.json packages/adapters/opencode-local/
COPY packages/adapters/pi-local/package.json packages/adapters/pi-local/
COPY packages/plugins/sdk/package.json packages/plugins/sdk/
COPY packages/plugins/create-paperclip-plugin/package.json packages/plugins/create-paperclip-plugin/
COPY packages/plugins/examples/plugin-authoring-smoke-example/package.json packages/plugins/examples/plugin-authoring-smoke-example/
COPY packages/plugins/examples/plugin-file-browser-example/package.json packages/plugins/examples/plugin-file-browser-example/
COPY packages/plugins/examples/plugin-hello-world-example/package.json packages/plugins/examples/plugin-hello-world-example/
COPY packages/plugins/examples/plugin-kitchen-sink-example/package.json packages/plugins/examples/plugin-kitchen-sink-example/

RUN pnpm install --frozen-lockfile

# ── build stage ──────────────────────────────────────────────
FROM deps AS build
COPY . .

RUN pnpm --filter @paperclipai/shared build \
 && pnpm --filter @paperclipai/plugin-sdk build \
 && pnpm --filter @paperclipai/ui build

# ── production stage ─────────────────────────────────────────
FROM base AS production
WORKDIR /app

COPY --from=build /app .

# Install Claude Code CLI globally so the claude_local adapter works
RUN npm install -g @anthropic-ai/claude-code

# Create non-root user -- Claude Code CLI refuses
# --dangerously-skip-permissions when running as root/sudo
RUN groupadd -r paperclip && useradd -r -g paperclip -m -s /bin/bash paperclip

# Copy agent config files and entrypoint
COPY smarterflo-agents/ /app/smarterflo-agents/
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Create directories and set ownership (image layer -- volume overrides at runtime)
RUN mkdir -p /paperclip/agents /paperclip/instances/default/workspaces \
             /paperclip/instances/default/logs \
 && chown -R paperclip:paperclip /paperclip /app

ENV NODE_ENV=production
ENV HOST=0.0.0.0
ENV PORT=3100
ENV PAPERCLIP_HOME=/paperclip
ENV PAPERCLIP_DEPLOYMENT_MODE=cloud

EXPOSE 3100

# Entrypoint runs as root to fix persistent volume permissions,
# then drops to paperclip user via exec su-exec/gosu
# NOTE: We do NOT set USER here because the persistent volume
# may be owned by root from a previous deployment and needs
# chmod/chown at startup.

CMD ["/app/entrypoint.sh"]
