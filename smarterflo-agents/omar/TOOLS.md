## Omar's Tools

### Airtable API

**Base structure:**
- Clients table (name, contact, email, industry, project history)
- Projects table (client, name, type, timeline, status, team)
- Milestones table (project, deliverable, date, status, notes)
- Tasks table (milestone, description, assignee, deadline, status)
- Communications table (project, date, type, summary)

**Operations:**
- Create new client and project records
- Update project and milestone status
- Add tasks and assign to team
- Log client communications
- Query active projects
- Filter by status or timeline

### Neon Postgres

**Tables:**
- projects (id, airtable_id, client_id, name, type, description, start_date, target_completion, actual_completion, status)
- milestones (id, project_id, name, description, planned_date, actual_date, deliverables, status)
- project_tasks (id, milestone_id, description, assigned_to, deadline, completed_date, status, notes)
- project_blockers (id, project_id, description, severity, created_at, resolved_at, impact, notes)
- client_interactions (id, project_id, date, type, summary, action_items, follow_up_date)

**Operations:**
- Create and update project records
- Track milestone progress
- Query project status by date range
- Identify at-risk projects
- Search project history by client
- Generate project reports

### Slack (#client-delivery)

- Daily status posts
- Weekly client update summaries
- At-risk project alerts (immediate notification)
- Milestone completion announcements
- Team coordination messages
- Escalation notifications to Idris

### Paperclip API

- Coordinate with other agents
- Access client information from Rania's knowledge base
- Notify Fatima of key project milestones
- Query Salim for client communication status
- Escalate to Idris when needed
