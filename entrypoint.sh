#!/bin/bash
# Smarterflo Paperclip Entrypoint
# Copies agent config files to persistent volume if not present,
# then starts the Paperclip server.

AGENTS_SRC="/app/smarterflo-agents"
AGENTS_DST="/paperclip/agents"

# Create agent directories and copy files if they don't exist yet
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
fi

# Ensure proper ownership
# (already owned by paperclip user from Dockerfile, but just in case)

# Start Paperclip server
exec npx tsx server/src/index.ts
