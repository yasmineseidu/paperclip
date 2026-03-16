# Hamza's Tool Stack

## LinkedIn Automation
- **Heyreach**
  - Env var: `HEYREACH_API_KEY`
  - Purpose: LinkedIn connection requests, DM automation, conversation management
  - Features:
    - Send connection requests with personalized messages
    - Monitor DM responses and incoming messages
    - Automated follow-ups based on engagement
    - Connection acceptance tracking
  - Endpoints:
    - Send connection requests
    - Retrieve incoming messages
    - Send DM responses
    - Track conversation history

## CRM & Pipeline Management
- **GoHighLevel**
  - Env var: `GHL_API_KEY`
  - Purpose: Sales pipeline management, lead tracking, workflow automation
  - Features:
    - Pipeline stages and lead movement
    - Contact profiles and history
    - Task management and reminders
    - Automation triggers
  - Use for: Recording calls, tracking commitments, stage movement

- **Airtable**
  - Env var: `AIRTABLE_API_KEY`
  - Base ID: (store in env)
  - Purpose: Lead tracking, conversation history, pre-call research compilation
  - Tables: Prospects, Conversations, Calls_Scheduled, Pre_Call_Briefs, Pipeline_View
  - Used for: Quick visual pipeline, conversation notes, research compilation

## Calendar Management
- **Google Calendar API**
  - Env var: `GOOGLE_CALENDAR_SERVICE_ACCOUNT` (JSON key)
  - Purpose: Book discovery calls, manage Yasmine's availability
  - Features:
    - Create events
    - Check availability
    - Send invitations
    - Retrieve event details
  - Yasmine's calendar: Check integration details for her specific calendar

## Database & History
- **Neon Postgres**
  - Env var: `DATABASE_URL`
  - Purpose: Conversation history, response tracking, metrics storage
  - Schemas: prospects, conversations, calls_booked, metrics, call_outcomes
  - Backup: Automated via Neon

## Inter-Agent Communication
- **Paperclip API**
  - Env var: `PAPERCLIP_API_KEY`
  - Purpose: Receive positive replies from Bilal, send call booking data
  - Endpoints:
    - GET /queue/positive-replies (receive from Bilal)
    - POST /queue/calls-booked (send call confirmations)
    - POST /queue/pre-call-briefs (send to Yasmine)
  - Authentication: Bearer token

## Environment Variables Checklist
- `HEYREACH_API_KEY`
- `GHL_API_KEY`
- `AIRTABLE_API_KEY`
- `AIRTABLE_BASE_ID`
- `GOOGLE_CALENDAR_SERVICE_ACCOUNT`
- `DATABASE_URL`
- `PAPERCLIP_API_KEY`
