CREATE OR REPLACE VIEW skill_gaps AS
SELECT
	s.id,
	s.name,
	s.category,
	s.level,
	sc.courses_count,
	sc.certificates_count
FROM skills s
JOIN skill_coverage sc ON s.id = sc.id
WHERE sc.projects_count = 0
AND sc.courses_count > 0;