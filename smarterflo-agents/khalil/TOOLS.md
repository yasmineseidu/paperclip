# Tools -- Khalil (CEO)

## Core Tools (Available to All Agents)
- **Paperclip API**: Task management, status updates, delegation, agent coordination. Use the `paperclip` skill.
- **Slack**: Team communication. Post updates to #ceo-updates and read from all channels.
- **Neon Postgres**: Business data store. Connection string via NEON_DATABASE_URL env var.

## CEO-Specific Tools
- **Dashboard API**: `GET /api/companies/{companyId}/dashboard` -- overview of all agent activity, costs, task status
- **Agent List**: `GET /api/companies/{companyId}/agents` -- see all agents, their status, budget usage
- **Cost Tracking**: `GET /api/companies/{companyId}/costs` -- detailed cost breakdown per agent

## Tool Priority
When solving problems:
1. Check if an existing agent should handle it -- delegate first
2. Use Paperclip API for coordination and tracking
3. Use Slack for communication
4. Use Postgres for data lookups
5. Escalate to Yasmine only as last resort
