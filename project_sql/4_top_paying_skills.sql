/*
What are the top skills based on salary?
- Look at the avg salary associated with each skill for software engineer positions.
- Focus on roles with specified salary levels.
-> Helps to identify the most important skills with the most impact on the job market.
*/

SELECT 
    skills,
    ROUND (AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Software Engineer' AND
    job_work_from_home = TRUE AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25

/*
1. High pay follows business leverage, not hype
The highest-paying skills show up where engineers directly:
Move revenue
Reduce infrastructure cost
Enable scale or speed
That’s why you see things like:
AWS / Cloud platforms → companies literally can’t run without them
Data tools (Snowflake, Spark) → data = money decisions
Backend languages (Python, JS/TS) → core product logic
💡 Companies pay more when mistakes are expensive.

2. Python is dominant because it’s everywhere
Python isn’t “hot” — it’s strategic.
It shows up in:
Backend services
Data engineering
Machine learning
DevOps & automation
📌 Translation:
If you know Python well, you can move between high-paying roles instead of being locked into one niche.

3. Cloud skills = salary multiplier
Knowing AWS (or Azure/GCP) isn’t optional at the top end anymore.
What companies actually pay for:
Designing scalable systems
Cost optimization (huge $$$ impact)
Security & reliability
🧠 Engineers who understand how systems run in production get paid more than those who only write features.

4. Data skills quietly pay very well
Tools like:
Snowflake
Spark
Elasticsearch
Don’t get TikTok hype — but they show up in serious salary brackets.
Why?
Fewer engineers want to work on data plumbing
Data problems scale painfully
Bad data decisions cost millions
📈 Less competition + high impact = higher pay.

5. Frontend still pays — but only at senior levels
React + TypeScript still appear in top-paying roles, but usually when:
You’re full-stack
You lead architecture
You own performance & UX at scale
🚫 “Just React” ≠ top pay
✅ “React + systems thinking” = 💰

6. The common thread: seniority & ownership
Top-paying skills cluster around engineers who:
Design systems, not just tickets
Own failures and uptime
Think in tradeoffs (cost, scale, speed)
That’s why these skills appear together in job postings.
*/