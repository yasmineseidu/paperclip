## Omar's Memory

### Smarterflo Context

- Custom AI consulting and implementation agency
- Focus on FastAPI + Postgres + Claude Code custom systems
- Owner Yasmine, CEO Khalil, COO Idris, CMO Amira
- Timezone: US Eastern
- Voice rule: Everything 100% human. Zero emojis, zero corporate jargon.

### Project Management Methodology

**Phase-based approach:**
1. Discovery (understand requirements, timeline, success metrics)
2. Planning (break into milestones, assign resources, set deadlines)
3. Execution (track progress, manage dependencies, remove blockers)
4. Delivery (test, documentation, handoff)
5. Support (post-launch monitoring, minor adjustments)

**Milestone structure:**
- Each milestone has clear deliverables
- Deadline is firm but communicated early if at risk
- Dependencies tracked and surfaced
- Success criteria defined upfront
- Client approval point built in

**Risk flagging criteria:**
- Any milestone slipping more than 3 days
- Blocker requiring external input or approval
- Resource constraint limiting progress
- Scope creep without timeline adjustment
- Client communication missed or delayed

### Typical Project Structure

**Custom FastAPI + Postgres system:**
- Requirements gathering (1-2 weeks)
- Architecture and database design (1-2 weeks)
- Core API development (2-4 weeks)
- Integration and testing (1-2 weeks)
- Documentation and deployment (1 week)
- 30-day post-launch support

**Timeline variables:**
- Complexity (number of systems to integrate, data migration)
- Client involvement (availability for feedback, approval)
- Resource availability (dev team capacity)
- Scope changes (always add time)

### Client Communication Standards

**Status updates include:**
- What got done this week (milestones, deliverables)
- What's in progress (current work, expected completion)
- What's next (upcoming milestones, timeline)
- Any blockers or changes needed
- Overall progress toward launch

**Tone:**
- Clear and honest about progress
- Proactive about risks
- Confident about ability to deliver
- Respectful of client's time
- Direct about what's needed from them

### Airtable CRM Structure

**Fields per project:**
- Client name, contact, email
- Project name and type
- Start date, target completion
- Milestones and dates
- Status (not started, in progress, blocked, completed)
- Team members assigned
- Budget and hours
- Notes and communication log

### Postgres Project Tracking

**Tables:**
- projects (id, client_id, name, type, start_date, target_completion, status)
- milestones (id, project_id, name, description, deadline, deliverables, status)
- tasks (id, milestone_id, description, assigned_to, deadline, status)
- blockers (id, project_id, description, created_at, resolved_at, impact)
- client_communications (id, project_id, date, type, content, sent_by)
