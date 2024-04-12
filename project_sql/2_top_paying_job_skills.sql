/*
Question: What skills are required for the top-paying data analyst jobs?
- Why? It provides a detailed look at which high-paying jobs demand ceratin skills,
- Helping job seekers understand which skills to develop that align with top salaries.
*/

WITH top_paying_jobs AS (
    SELECT
        job_id, 
        job_title, 
        salary_year_avg, 
        name as company_name
    FROM
        job_postings_fact jf
    LEFT JOIN company_dim cd ON jf.company_id = cd.company_id
        WHERE job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
        ORDER BY salary_year_avg DESC
        LIMIT 10
)

SELECT 
    tpj.*,
    skills
From top_paying_jobs tpj
INNER JOIN skills_job_dim sjd ON tpj.job_id = sjd.job_id
INNER JOIN skills_dim sd ON sd.skill_id = sjd.skill_id
ORDER BY salary_year_avg DESC;

/*
Skill Frequency insights

Breakdown of the most demanded skills for data analysts in 2023
- SQL is leading with a bold count of 8
- Python follows closely with a bold count of 7
- Tableau is also highly sought after, with a bold count of 6.
- Other skills like R, Software, Pandas and Excel show varying degrees of demand.
*/