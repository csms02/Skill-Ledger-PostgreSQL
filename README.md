# Skill Ledger – PostgreSQL

A PostgreSQL database that tracks skills, courses, specializations, certificates, projects and learning roadmaps, and shows how well each skill is backed up by real work.

> Based on [HossamJa/Self-Learning-Ledger-DB](https://github.com/HossamJa/Self-Learning-Ledger-DB) (Apache-2.0). Modified and extended by [Abhishek Jha].

## What I added
- **`skill_gaps` view**: lists skills I have studied in courses but not yet demonstrated in any project, so I know what to build next (`my_queries.sql`)
- **Windows setup**: the original loads data using Docker paths. I adapted the data loading to run on a local Windows PostgreSQL install with pgAdmin
- Screenshots of the working views

## Database design
- **6 core tables:** skills, courses, specializations, certificates, projects, roadmaps
- **5 relationship tables** for many-to-many links (course_skills, project_skills, certificate_skills, specialization_courses, roadmap_learning_units)
- **Integrity:** foreign keys, CHECK constraints (e.g. skill level 1-5, end date after start date), composite primary keys
- **Triggers:** automate skill-level updates, course completion and protection of skills linked to certificates
- **Views:** skill_coverage, roadmap_skills, roadmap_progress, total_learning_hours, portfolio_summary, plus my own skill_gaps

## How to run (PostgreSQL + pgAdmin)
1. Create a database named `skill_ledger`
2. Run these files in order in the Query Tool:
   1. `db/schema/tables.sql`
   2. `db/schema/views.sql`
   3. `db/schema/triggers.sql`
3. Open `db/init-data.sql` and change `/data/` to the full path of the `data` folder on your machine (e.g. `C:/db/data/`), then run it
4. Run `queries.sql` and `my_queries.sql`

## Screenshots
![Skill gaps](screenshots/skill_gaps.png)
![Skill coverage](screenshots/skill_coverage.png)
![Roadmap progress](screenshots/roadmap_progress.png)
![Portfolio summary](screenshots/portfolio_summary.png)

## Tech
PostgreSQL 18, pgAdmin 4, SQL (DDL, views, triggers, joins, aggregation)

## Credits
Original project by HossamJa (CS50 SQL final project), licensed under Apache-2.0. See `LICENSE`.
