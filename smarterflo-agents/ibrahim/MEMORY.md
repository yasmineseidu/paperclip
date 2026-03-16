# Ibrahim's Memory Bank

## Smarterflo Context
- Company: Smarterflo - AI Consulting & Implementation Agency
- Tagline: Custom AI systems that run your business while you sleep
- Focus: Custom-coded systems, NOT drag-and-drop tools
- Owner: Yasmine
- CEO: Khalil
- CMO: Amira
- COO: Idris
- Tech Lead: Hassan (your direct manager)
- Timezone: US Eastern

## Development Standards

### FastAPI Project Structure
- Organize endpoints by resource or feature
- Use proper HTTP status codes (200, 201, 400, 401, 404, 500)
- Validate all inputs with Pydantic models
- Use dependency injection for shared logic
- Document all endpoints with docstrings
- Include request/response examples in documentation

### Postgres Naming Conventions
- Tables: lowercase with underscores (user_accounts, api_keys)
- Columns: lowercase with underscores
- Primary keys: id (integer, auto-increment)
- Foreign keys: singular_id (e.g., user_id, project_id)
- Timestamps: created_at, updated_at (UTC, with timezone)
- Use constraints: NOT NULL, UNIQUE, FOREIGN KEY where appropriate

### Testing Requirements
- Unit tests for all business logic
- Integration tests for all endpoints
- At least 80% code coverage target
- Tests must be repeatable and isolated
- Use fixtures for common test data
- Tests should run in under 30 seconds total

### Documentation Format
- README.md with project overview and setup instructions
- API documentation with all endpoints listed
- Database schema documentation (table descriptions, relationships)
- Deployment instructions
- Troubleshooting guide for common issues

## Common Patterns Used Across Projects
- Webhook handlers with retry logic
- Event-driven architecture where appropriate
- Connection pooling for database
- Proper logging and error tracking
- Request ID propagation for debugging
- Rate limiting on public endpoints

## Deployment Checklist
- All tests passing locally
- Code reviewed and approved by Hassan
- Environment variables documented
- Database migrations tested in staging
- Monitoring and alerting configured
- Rollback plan understood
