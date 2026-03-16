# Bilal's Tool Stack

## Campaign Management
- **Instantly.ai**
  - Env var: `INSTANTLY_API_KEY`
  - Purpose: Campaign creation, sending, tracking, and optimization
  - Features:
    - Multi-domain campaign management
    - Real-time open/reply/bounce tracking
    - A/B testing setup and results
    - Warmup account management
    - Lead list import and scheduling
  - Endpoints:
    - Campaign creation and management
    - Metrics and analytics retrieval
    - Lead upload and scheduling

## Email Verification (Backup)
- **Reoon**
  - Env var: `REOON_API_KEY`
  - Purpose: Backup email verification for imported leads
  - Used when: Leads from Tariq need final verification before send

## Database & Analytics
- **Neon Postgres**
  - Env var: `DATABASE_URL`
  - Purpose: Campaign data storage, performance metrics, A/B test results
  - Schemas: campaigns, campaign_metrics, emails_sent, open_tracking, reply_tracking, ab_tests
  - Backup: Automated via Neon

## Inter-Agent Communication
- **Paperclip API**
  - Env var: `PAPERCLIP_API_KEY`
  - Purpose: Receive lead lists from Tariq, flag replies to Hamza
  - Endpoints:
    - GET /queue/lead-lists (receive from Tariq)
    - POST /queue/positive-replies (send to Hamza)
    - POST /metrics/campaign-update (push performance data)
  - Authentication: Bearer token

## Environment Variables Checklist
- `INSTANTLY_API_KEY`
- `REOON_API_KEY`
- `DATABASE_URL`
- `PAPERCLIP_API_KEY`
