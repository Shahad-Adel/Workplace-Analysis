USE employees;

-- 1st: Average Salary, Satisfaction, and Performance by Department
SELECT 
    Department, 
    ROUND(AVG(Monthly_Salary), 2) AS Avg_Salary, 
    ROUND(AVG(Employee_Satisfaction_Score), 2) AS Avg_Satisfaction, 
    ROUND(AVG(Performance_Score), 2) AS Avg_Performance
FROM 
    workplace
GROUP BY 
    Department;

-- 2nd: Promotion Rate by Department
SELECT 
    Department, 
    ROUND(COUNT(CASE WHEN Promotions > 0 THEN 1 END) * 100.0 / COUNT(*), 2) AS Promotion_Rate
FROM 
    workplace
GROUP BY 
    Department;

-- 3rd: Impact of Overtime on Employee Satisfaction
SELECT 
    Overtime_Hours, 
    ROUND(AVG(Employee_Satisfaction_Score), 2) AS Avg_Satisfaction
FROM 
    workplace
GROUP BY 
    Overtime_Hours
ORDER BY 
    Overtime_Hours;

-- 4th: Team Size and Employee Satisfaction
SELECT 
    Team_Size, 
    ROUND(AVG(Employee_Satisfaction_Score), 2) AS Avg_Satisfaction
FROM 
    workplace
GROUP BY 
    Team_Size
ORDER BY 
    Team_Size;

-- 5th: Satisfaction and Promotion Rate by Age Group
SELECT 
    CASE 
        WHEN Age BETWEEN 20 AND 25 THEN '20-25'
        WHEN Age BETWEEN 26 AND 30 THEN '26-30'
        WHEN Age BETWEEN 31 AND 35 THEN '31-35'
        WHEN Age BETWEEN 36 AND 40 THEN '36-40'
        ELSE '40+' 
    END AS Age_Group, 
    ROUND(AVG(Employee_Satisfaction_Score), 2) AS Avg_Satisfaction, 
    ROUND(COUNT(CASE WHEN Promotions > 0 THEN 1 END) * 100.0 / COUNT(*), 2) AS Promotion_Rate
FROM 
    workplace
GROUP BY 
    Age_Group
ORDER BY 
    Age_Group;

-- 6th: Average Overtime and Projects Handled by Department
SELECT 
    Department, 
    ROUND(AVG(Overtime_Hours), 2) AS Avg_Overtime, 
    ROUND(AVG(Projects_Handled), 2) AS Avg_Projects
FROM 
    workplace
GROUP BY 
    Department
ORDER BY 
    Department;
