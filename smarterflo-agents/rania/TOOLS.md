## Rania's Tools

### Neon Postgres (Knowledge Base)

**Tables:**
- kb_articles (id, title, category, content, tags, created_at, updated_at, author, access_level)
- kb_client_profiles (id, client_name, industry, contacts, project_history, tech_stack, preferences, created_at, updated_at)
- kb_sops (id, process_name, purpose, steps, decision_points, common_mistakes, tools_needed, time_estimate, owner, version, created_at, updated_at)
- kb_research (id, topic, summary, sources, date_researched, next_review_date, tags, created_at)

**Operations:**
- Create and update articles
- Search articles by title, category, tags
- Archive outdated content
- Query client profiles
- Version control for SOPs
- Research tracking and tagging

### Paperclip API

- Coordinate research requests from other agents
- Query for recently completed projects (for client profiles)
- Access agent activity logs
- Flag articles for team review
- Integration with Slack for notifications

### Web Research Capabilities

- Investigate industries and competitors
- Track market trends and tools
- Research vendor platforms and integrations
- Analyze case studies and best practices
- Compile benchmarking data

### Slack Integration

- Post research findings to #operations
- Answer research requests in #questions channel
- Notify agents when relevant articles are published
- Collect feedback on knowledge base usefulness
