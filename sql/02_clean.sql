CREATE SCHEMA IF NOT EXISTS clean;

DROP TABLE IF EXISTS clean.students_social_media_addiction_cleaned;

CREATE TABLE clean.students_social_media_addiction_cleaned AS
SELECT
  "Student_ID", 
  "Age", 
  "Gender", 
  "Academic_Level", 
  "Country", 
  "Most_Used_Platform", 
  "Addicted_Score",
  CAST("Avg_Daily_Usage_Hours" AS NUMERIC) AS avg_daily_usage_hours,
  CASE 
    WHEN CAST("Age" AS INTEGER) BETWEEN 16 AND 18 THEN '16-18'
    WHEN CAST("Age" AS INTEGER) BETWEEN 19 AND 21 THEN '19-21'
    WHEN CAST("Age" AS INTEGER) BETWEEN 22 AND 25 THEN '22-25'
    ELSE 'Other'
  END AS age_group,
  CAST("Sleep_Hours_Per_Night" AS NUMERIC) AS sleep_hours_per_night,
  CASE
    WHEN "Addicted_Score" < 4 THEN 'Low'
    WHEN "Addicted_Score" BETWEEN 4 AND 7 THEN 'Medium'
    ELSE 'High'
  END AS addiction_risk
FROM staging."students_social_media_addiction";

select * from student_bi.clean.students_social_media_addiction_cleaned limit 5;
