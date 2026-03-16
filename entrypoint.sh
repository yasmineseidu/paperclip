#!/bin/bash
# Smarterflo Paperclip Entrypoint
# Fixes volume permissions, copies agent config files to persistent volume,
# then starts the Paperclip server.

set -e

PAPERCLIP_HOME="${PAPERCLIP_HOME:-/paperclip}"
AGENTS_SRC="/app/smarterflo-agents"
AGENTS_DST="$PAPERCLIP_HOME/agents"

echo "[entrypoint] Starting Smarterflo Paperclip..."
echo "[entrypoint] PAPERCLIP_HOME=$PAPERCLIP_HOME"
echo "[entrypoint] Running as user: $(whoami) ($(id))"

# Fix persistent volume permissions (runs as root on Railway)
# The volume may be owned by root from a previous deployment
mkdir -p "$PAPERCLIP_HOME/agents" \
         "$PAPERCLIP_HOME/instances/default/workspaces" \
         "$PAPERCLIP_HOME/instances/default/logs"

# Ensure paperclip user can write everywhere on the volume
chown -R paperclip:paperclip "$PAPERCLIP_HOME" 2>/dev/null || true
echo "[entrypoint] Volume permissions fixed"

# Create agent directories and copy config files
if [ -d "$AGENTS_SRC" ]; then
  for agent_dir in "$AGENTS_SRC"/*/; do
    agent_name=$(basename "$agent_dir")
    dst="$AGENTS_DST/$agent_name"

    # Create full PARA directory structure
    mkdir -p "$dst/life/projects" \
             "$dst/life/areas/people" \
             "$dst/life/areas/companies" \
             "$dst/life/resources" \
             "$dst/life/archives" \
             "$dst/memory" \
             "$dst/plans" \
             "$dst/.claude/skills"

    # Copy config files (only if not already present -- don't overwrite runtime changes)
    for f in AGENTS.md SOUL.md HEARTBEAT.md MEMORY.md TOOLS.md; do
      if [ -f "$agent_dir/$f" ] && [ ! -f "$dst/$f" ]; then
        cp "$agent_dir/$f" "$dst/$f"
        echo "[entrypoint] Deployed: $agent_name/$f"
      fi
    done

    # Create PARA index if missing
    if [ ! -f "$dst/life/index.md" ]; then
      echo "# Knowledge Index -- ${agent_name^}" > "$dst/life/index.md"
    fi
  done
  echo "[entrypoint] Agent files deployed to $AGENTS_DST"
else
  echo "[entrypoint] No agent source directory found at $AGENTS_SRC -- skipping"
fi

echo "[entrypoint] Starting Paperclip server as paperclip user..."

# Drop privileges to paperclip user and start server
# Need to preserve PATH so node/pnpm/tsx are available
exec su paperclip -s /bin/bash -c "cd /app && export PATH=\"$PATH\" && export HOME=/home/paperclip && pnpm dev:once"
