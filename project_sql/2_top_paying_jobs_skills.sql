/*
Question: What are the top paying software engineer jobs?
- Identify the top 10 highest paying software engineer roles that are available remotely.
- Focuses on job postings with specified salaries (NOT NULL).
- Provide a detailed look at which skills are demanded for certain jobs,
    helping job seekers understand which skills to develop that align with top salaries.
*/

WITH top_paying_jobs AS (

    SELECT
        job_id,
        job_title,
        name AS company_name,
        salary_year_avg
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Software Engineer' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC



/*
Here´s a breakdown of the most demanded skills.

Tier 1 – Absolutely worth learning
Python → shows up everywhere (backend, data, ML, infra tooling)
AWS → cloud is non-negotiable for top salaries

Tier 2 – High-paying specializations
Snowflake → data engineering & analytics roles pay very well
React → still dominant for high-end frontend/full-stack roles

Tier 3 – Strong complements
JavaScript / TypeScript → foundational for modern stacks
Azure / GCP → valuable if you want cloud flexibility
Spark → big data & distributed systems
Elasticsearch → search, logging, large-scale systems

[
  {
    "job_id": 562251,
    "job_title": "Senior Software Engineer",
    "company_name": "Datavant",
    "salary_year_avg": "225000.0",
    "skills": "python"
  },
  {
    "job_id": 562251,
    "job_title": "Senior Software Engineer",
    "company_name": "Datavant",
    "salary_year_avg": "225000.0",
    "skills": "javascript"
  },
  {
    "job_id": 562251,
    "job_title": "Senior Software Engineer",
    "company_name": "Datavant",
    "salary_year_avg": "225000.0",
    "skills": "typescript"
  },
  {
    "job_id": 562251,
    "job_title": "Senior Software Engineer",
    "company_name": "Datavant",
    "salary_year_avg": "225000.0",
    "skills": "azure"
  },
  {
    "job_id": 562251,
    "job_title": "Senior Software Engineer",
    "company_name": "Datavant",
    "salary_year_avg": "225000.0",
    "skills": "aws"
  },
  {
    "job_id": 562251,
    "job_title": "Senior Software Engineer",
    "company_name": "Datavant",
    "salary_year_avg": "225000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 562251,
    "job_title": "Senior Software Engineer",
    "company_name": "Datavant",
    "salary_year_avg": "225000.0",
    "skills": "spark"
  },
  {
    "job_id": 562251,
    "job_title": "Senior Software Engineer",
    "company_name": "Datavant",
    "salary_year_avg": "225000.0",
    "skills": "react"
  },
  {
    "job_id": 365528,
    "job_title": "Engineering",
    "company_name": "Huckleberry Labs",
    "salary_year_avg": "205000.0",
    "skills": "python"
  },
  {
    "job_id": 365528,
    "job_title": "Engineering",
    "company_name": "Huckleberry Labs",
    "salary_year_avg": "205000.0",
    "skills": "aws"
  },
  {
    "job_id": 365528,
    "job_title": "Engineering",
    "company_name": "Huckleberry Labs",
    "salary_year_avg": "205000.0",
    "skills": "gcp"
  },
  {
    "job_id": 1356375,
    "job_title": "Senior Software Engineer, Full Stack",
    "company_name": "SmarterDx",
    "salary_year_avg": "205000.0",
    "skills": "python"
  },
  {
    "job_id": 1356375,
    "job_title": "Senior Software Engineer, Full Stack",
    "company_name": "SmarterDx",
    "salary_year_avg": "205000.0",
    "skills": "elasticsearch"
  },
  {
    "job_id": 1356375,
    "job_title": "Senior Software Engineer, Full Stack",
    "company_name": "SmarterDx",
    "salary_year_avg": "205000.0",
    "skills": "dynamodb"
  },
  {
    "job_id": 1356375,
    "job_title": "Senior Software Engineer, Full Stack",
    "company_name": "SmarterDx",
    "salary_year_avg": "205000.0",
    "skills": "aws"
  },
  {
    "job_id": 1356375,
    "job_title": "Senior Software Engineer, Full Stack",
    "company_name": "SmarterDx",
    "salary_year_avg": "205000.0",
    "skills": "snowflake"
  },
  {
    "job_id": 1356375,
    "job_title": "Senior Software Engineer, Full Stack",
    "company_name": "SmarterDx",
    "salary_year_avg": "205000.0",
    "skills": "pandas"
  },
  {
    "job_id": 1356375,
    "job_title": "Senior Software Engineer, Full Stack",
    "company_name": "SmarterDx",
    "salary_year_avg": "205000.0",
    "skills": "airflow"
  },
  {
    "job_id": 1356375,
    "job_title": "Senior Software Engineer, Full Stack",
    "company_name": "SmarterDx",
    "salary_year_avg": "205000.0",
    "skills": "react"
  },
  {
    "job_id": 1356375,
    "job_title": "Senior Software Engineer, Full Stack",
    "company_name": "SmarterDx",
    "salary_year_avg": "205000.0",
    "skills": "graphql"
  },
  {
    "job_id": 1356375,
    "job_title": "Senior Software Engineer, Full Stack",
    "company_name": "SmarterDx",
    "salary_year_avg": "205000.0",
    "skills": "node.js"
  },
  {
    "job_id": 1231528,
    "job_title": "Senior Software Engineer, Server Security",
    "company_name": "MongoDB",
    "salary_year_avg": "200000.0",
    "skills": "mongodb"
  },
  {
    "job_id": 1231528,
    "job_title": "Senior Software Engineer, Server Security",
    "company_name": "MongoDB",
    "salary_year_avg": "200000.0",
    "skills": "mongodb"
  },
  {
    "job_id": 1398776,
    "job_title": "Senior Software Engineer, Cluster Scalability",
    "company_name": "MongoDB",
    "salary_year_avg": "200000.0",
    "skills": "mongodb"
  },
  {
    "job_id": 1398776,
    "job_title": "Senior Software Engineer, Cluster Scalability",
    "company_name": "MongoDB",
    "salary_year_avg": "200000.0",
    "skills": "mongodb"
  },
  {
    "job_id": 64759,
    "job_title": "Senior Ruby Engineer - Analytics Platform - $190-210k+",
    "company_name": "Orbis",
    "salary_year_avg": "200000.0",
    "skills": "typescript"
  },
  {
    "job_id": 64759,
    "job_title": "Senior Ruby Engineer - Analytics Platform - $190-210k+",
    "company_name": "Orbis",
    "salary_year_avg": "200000.0",
    "skills": "ruby"
  },
  {
    "job_id": 64759,
    "job_title": "Senior Ruby Engineer - Analytics Platform - $190-210k+",
    "company_name": "Orbis",
    "salary_year_avg": "200000.0",
    "skills": "ruby"
  },
  {
    "job_id": 946351,
    "job_title": "Staff Frontend Engineer",
    "company_name": "Webflow",
    "salary_year_avg": "191000.0",
    "skills": "javascript"
  },
  {
    "job_id": 946351,
    "job_title": "Staff Frontend Engineer",
    "company_name": "Webflow",
    "salary_year_avg": "191000.0",
    "skills": "css"
  },
  {
    "job_id": 946351,
    "job_title": "Staff Frontend Engineer",
    "company_name": "Webflow",
    "salary_year_avg": "191000.0",
    "skills": "react"
  },
  {
    "job_id": 946351,
    "job_title": "Staff Frontend Engineer",
    "company_name": "Webflow",
    "salary_year_avg": "191000.0",
    "skills": "graphql"
  },
  {
    "job_id": 946351,
    "job_title": "Staff Frontend Engineer",
    "company_name": "Webflow",
    "salary_year_avg": "191000.0",
    "skills": "node.js"
  },
  {
    "job_id": 946351,
    "job_title": "Staff Frontend Engineer",
    "company_name": "Webflow",
    "salary_year_avg": "191000.0",
    "skills": "react.js"
  },
  {
    "job_id": 1054268,
    "job_title": "Staff Software Engineer, AI",
    "company_name": "Pulley",
    "salary_year_avg": "185000.0",
    "skills": "python"
  },
  {
    "job_id": 1054268,
    "job_title": "Staff Software Engineer, AI",
    "company_name": "Pulley",
    "salary_year_avg": "185000.0",
    "skills": "javascript"
  },
  {
    "job_id": 1054268,
    "job_title": "Staff Software Engineer, AI",
    "company_name": "Pulley",
    "salary_year_avg": "185000.0",
    "skills": "typescript"
  },
  {
    "job_id": 1054268,
    "job_title": "Staff Software Engineer, AI",
    "company_name": "Pulley",
    "salary_year_avg": "185000.0",
    "skills": "golang"
  },
  {
    "job_id": 182858,
    "job_title": "Senior Software Engineer (Confirmations - System)",
    "company_name": "ConsenSys",
    "salary_year_avg": "184500.0",
    "skills": "javascript"
  },
  {
    "job_id": 182858,
    "job_title": "Senior Software Engineer (Confirmations - System)",
    "company_name": "ConsenSys",
    "salary_year_avg": "184500.0",
    "skills": "typescript"
  },
  {
    "job_id": 182858,
    "job_title": "Senior Software Engineer (Confirmations - System)",
    "company_name": "ConsenSys",
    "salary_year_avg": "184500.0",
    "skills": "react"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "company_name": "Robert Half",
    "salary_year_avg": "182500.0",
    "skills": "python"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "company_name": "Robert Half",
    "salary_year_avg": "182500.0",
    "skills": "javascript"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "company_name": "Robert Half",
    "salary_year_avg": "182500.0",
    "skills": "html"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "company_name": "Robert Half",
    "salary_year_avg": "182500.0",
    "skills": "css"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "company_name": "Robert Half",
    "salary_year_avg": "182500.0",
    "skills": "c#"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "company_name": "Robert Half",
    "salary_year_avg": "182500.0",
    "skills": "mongodb"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "company_name": "Robert Half",
    "salary_year_avg": "182500.0",
    "skills": "redis"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "company_name": "Robert Half",
    "salary_year_avg": "182500.0",
    "skills": "mysql"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "company_name": "Robert Half",
    "salary_year_avg": "182500.0",
    "skills": "elasticsearch"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "company_name": "Robert Half",
    "salary_year_avg": "182500.0",
    "skills": "mongodb"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "company_name": "Robert Half",
    "salary_year_avg": "182500.0",
    "skills": "dynamodb"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "company_name": "Robert Half",
    "salary_year_avg": "182500.0",
    "skills": "couchbase"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "company_name": "Robert Half",
    "salary_year_avg": "182500.0",
    "skills": "azure"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "company_name": "Robert Half",
    "salary_year_avg": "182500.0",
    "skills": "aws"
  },
  {
    "job_id": 117409,
    "job_title": "Director of Software Engineer",
    "company_name": "Robert Half",
    "salary_year_avg": "182500.0",
    "skills": "asp.net"
  }
]
*/