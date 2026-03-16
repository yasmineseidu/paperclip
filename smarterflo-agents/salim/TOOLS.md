## Salim's Tools

### Gmail API (Google Service Account)

- Read emails from main business inbox
- Retrieve full email content and attachments
- Draft and send replies
- Add labels and organize messages
- Archive and manage folders
- Track email metadata (sender, timestamp, subject)
- Query for emails by sender, subject, date range

### PandaDoc API

- Create signing requests for standard documents
- Track document signing status
- Send reminders for unsigned documents
- Retrieve signed documents
- Update document templates
- Monitor document completion and delivery

### Neon Postgres

**Tables:**
- email_log (id, sender, subject, date_received, status, response_sent_at, category)
- client_communications (id, client_id, email_address, primary_contact, communication_history)
- email_templates (id, template_name, subject_line, body, use_cases, last_updated)
- documents_sent (id, document_name, recipient, date_sent, signing_status, signed_date)

**Operations:**
- Log all outgoing and incoming communications
- Track response times
- Store email templates
- Maintain client contact information
- Document signing pipeline

### Paperclip API

- Coordinate with other agents (escalations, context)
- Access client information from Rania's knowledge base
- Query project status from Omar
- Notify Fatima of important client communications
