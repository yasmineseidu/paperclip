# Tariq's Tool Stack

## Email Finder APIs
- **Tomba**
  - Env var: `TOMBA_API_KEY`
  - Purpose: Domain-based email finding and verification
  - Rate limit: Check API documentation
  
- **Muraena**
  - Env var: `MURAENA_API_KEY`
  - Purpose: Email finder with company enrichment
  - Rate limit: Check API documentation
  
- **Findymail**
  - Env var: `FINDYMAIL_API_KEY`
  - Purpose: B2B email finder with high accuracy
  - Rate limit: Check API documentation
  
- **Icypeas**
  - Env var: `ICYPEAS_API_KEY`
  - Purpose: Email finder with LinkedIn integration
  - Rate limit: Check API documentation
  
- **Voila Norbert**
  - Env var: `VOILA_NORBERT_API_KEY`
  - Purpose: Email verification and finding
  - Rate limit: Check API documentation
  
- **Anymailfinder**
  - Env var: `ANYMAILFINDER_API_KEY`
  - Purpose: Bulk email finding and verification
  - Rate limit: Check API documentation

## Email Verification
- **Reoon**
  - Env var: `REOON_API_KEY`
  - Purpose: Email verification and validation
  - Used for: Double-checking emails from finder tools
  - Batch processing available

## Database & Storage
- **Neon Postgres**
  - Env var: `DATABASE_URL`
  - Purpose: Lead database, storage, and persistence
  - Schemas: leads, companies, verification_results, lead_scores
  - Backup: Automated via Neon

## Inter-Agent Communication
- **Paperclip API**
  - Env var: `PAPERCLIP_API_KEY`
  - Purpose: Queue and send lead lists to Bilal and Hamza
  - Endpoints:
    - POST /queue/lead-list (send to cold email)
    - POST /queue/linkedin-leads (send to LinkedIn outreach)
  - Authentication: Bearer token

## Environment Variables Checklist
- `TOMBA_API_KEY`
- `MURAENA_API_KEY`
- `FINDYMAIL_API_KEY`
- `ICYPEAS_API_KEY`
- `VOILA_NORBERT_API_KEY`
- `ANYMAILFINDER_API_KEY`
- `REOON_API_KEY`
- `DATABASE_URL`
- `PAPERCLIP_API_KEY`
