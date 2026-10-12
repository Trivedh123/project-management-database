USE company_sql_practice;

SELECT 
employee_name,
city,
salary
FROM employees
WHERE city = 'Hyderabad';

SELECT 
employee_name
FROM employees
WHERE employee_name LIKE 'A%';

SELECT * 
FROM employees
WHERE salary BETWEEN 50000 AND 80000;

SELECT * 
FROM employees
WHERE email is NULL;

SELECT * 
FROM employees
WHERE city in ('Hyderabad', 'Bangalore') AND salary > 70000;

SELECT * 
FROM employees 
WHERE employee_name LIKE '%ra%' and salary > 60000;

SELECT * 
FROM employees
WHERE city in ('Hyderabad', 'Chennai', 'Bangalore') AND salary BETWEEN 60000 AND 90000;

SELECT  
UPPER(employee_name) AS employee_name,
salary
FROM employees
ORDER BY salary DESC;

SELECT 
employee_name,
LENGTH(employee_name) AS name_length
FROM employees
ORDER BY name_length DESC;

SELECT 
employee_name,
SUBSTRING(employee_name, 1, 3) AS First_Three_Characters,
city
FROM employees;

SELECT * 
FROM employees
WHERE hire_date > '2023-01-01'
order by hire_date DESC;

SELECT * 
FROM employees
WHERE hire_date BETWEEN '2021-01-01' AND '2023-12-31';

SELECT * 
FROM employees
WHERE hire_date > '2021-12-31'
ORDER BY salary DESC
LIMIT 5;

SELECT 
COUNT(*) AS 'Number of employees',
AVG(salary) AS Average_salary
FROM employees;

SELECT 
MAX(salary) AS Highest_salary,
MIN(salary) AS Lowest_salary,
AVG(salary) AS Average_salry
FROM employees;

SELECT 
COUNT(*) AS Number_of_employees,
city
FROM employees
GROUP BY city;

SELECT 
Avg(salary) AS Average_Salary,
city
FROM employees
GROUP BY city
ORDER BY Average_Salary DESC;

SELECT 
city,
COUNT(*) AS Employee_Count
FROM employees
GROUP BY city 
HAVING COUNT(*) > 2;

SELECT 
city,
COUNT(*) AS Employee_Count
FROM employees
GROUP BY city 
HAVING COUNT(*) > 2 AND AVG(salary) > 60000;

SELECT 
city,
SUM(salary) AS Total_Salary_Paid
FROM employees
GROUP BY city;

SELECT 
city,
AVG(salary) AS AVG_salary
FROM employees
GROUP BY city
ORDER BY AVG_salary DESC
LIMIT 1;

SELECT 
employee_name,
salary,
CASE 
WHEN salary >= 100000 THEN 'High'
WHEN salary >= 60000 THEN 'Medium'
ELSE 'lOW'
END AS salary_category
FROM employees;

SELECT 
CASE 
WHEN salary >= 100000 THEN 'High'
WHEN salary >= 60000 THEN 'Medium'
ELSE 'lOW'
END AS salary_category,
COUNT(*) AS Employee_count
FROM employees
GROUP BY salary_category;

SELECT * 
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT * 
FROM employees 
WHERE salary = (SELECT MAX(salary) FROM employees);

SELECT 
MAX(salary) AS Second_highest_salary
FROM employees
WHERE salary <(SELECT MAX(salary) FROM employees);

SELECT 
department_id ,
AVG(budget) AS Average_budget,
MAX(budget) AS Highest_budget,
MIN(budget) AS Lowest_budget
FROM projects 
GROUP BY department_id; 

SELECT 
department_id ,
COUNT(*) AS project_count
FROM projects 
GROUP BY department_id 
HAVING COUNT(*) >= 2;

SELECT 
employee_id,
SUM(hours_worked) AS Total_hours
FROM employee_projects
GROUP BY employee_id
ORDER BY Total_hours
LIMIT 3;

SELECT employee_id, SUM(hours_worked) AS total_hours
FROM employee_projects
GROUP BY employee_id
ORDER BY total_hours DESC
LIMIT 3;

SELECT 
project_name,
budget
FROM projects
WHERE budget > (SELECT AVG(budget) FROM projects);

SELECT 
project_name,
budget
FROM projects
WHERE budget = (SELECT MAX(budget) FROM projects);

SELECT 
e.employee_name,
d.department_name,
p.project_name,
ep.role
FROM employees e
join departments d  on d.department_id = e.department_id
join employee_projects ep on e.employee_id = ep.employee_id
join projects p on ep.project_id = p.project_id;

SELECT 
e.employee_name,
d.department_name,
e.salary
FROM departments d
join employees e on d.department_id = e.department_id
WHERE d.department_name = 'Engineering';

SELECT 
e.employee_name,
p.project_name
FROM employees e
join employee_projects ep on ep.employee_id = e.employee_id 
join projects p on p.project_id = ep.project_id
WHERE project_name = 'Mobile Banking App';

SELECT e.employee_name
FROM employees e
JOIN employee_projects ep ON e.employee_id = ep.employee_id
JOIN projects p ON ep.project_id = p.project_id
WHERE p.project_name = 'Mobile Banking App'; 

SELECT 
p.project_name,
p.budget 
FROM projects p 
join departments d on d.department_id = p.department_id
WHERE d.department_name = 'Engineering';

SELECT 
e.employee_name,
p.project_name ,
ep.hours_worked
FROM employees e
join employee_projects ep on e.employee_id = ep.employee_id
join projects p on ep.project_id = p.project_id
ORDER BY hours_worked DESC;

SELECT 
e.employee_name,
p.project_name ,
p.budget
FROM employees e
join employee_projects ep on e.employee_id = ep.employee_id
join projects p on ep.project_id = p.project_id
WHERE p.budget > 2000000;

SELECT 
e.employee_name,
p.project_name ,
p.budget
FROM employees e
join employee_projects ep on e.employee_id = ep.employee_id
join projects p on ep.project_id = p.project_id
WHERE p.budget > 1000000 AND e.city = 'Hyderabad';

SELECT 
e.employee_name,
p.project_name,
c.city 
FROM employees e 
join employee_projects ep on e.employee_id = ep.employee_id
join projects p on ep.project_id = p.project_id 
join clients c on c.client_id = p.client_id 
WHERE c.city = 'Hyderabad';

SELECT 
e.employee_name,
p.project_name,
c.client_name,
c.industry 
FROM employees e 
join employee_projects ep on e.employee_id = ep.employee_id
join projects p on ep.project_id = p.project_id 
join clients c on c.client_id = p.client_id 
WHERE c.industry IN ('Technology', 'Finance');

SELECT 
p.project_name,
d.department_name, 
p.budget
FROM departments d
join projects p on d.department_id = p.department_id 
WHERE p.budget > 1500000 AND d.department_name = 'Engineering';

SELECT 
e.employee_name,
p.project_name,
p.start_date
FROM employees e 
JOIN employee_projects ep on e.employee_id = ep.employee_id
JOIN projects p on ep.project_id = p.project_id 
WHERE p.start_date >= '2024-01-01' AND  p.end_date <= '2025-01-01';

SELECT 
e.employee_name,
ep.hours_worked,
p.project_name,
c.industry
FROM employees e
JOIN employee_projects ep on e.employee_id = ep.employee_id 
JOIN projects p ON ep.project_id = p.project_id 
JOIN clients c ON c.client_id = p.client_id 
WHERE ep.hours_worked > 150 AND c.industry = 'Technology';

SELECT 
p.project_name,
c.client_name,
c.city,
p.budget
FROM projects p 
JOIN clients c on p.client_id = c.client_id 
WHERE p.budget > 1000000 AND c.city = 'Chennai';

SELECT 
e.employee_name, 
d.department_name, 
COUNT(ep.project_id) AS project_count 
FROM employees e
JOIN employee_projects ep ON e.employee_id = ep.employee_id 
JOIN departments d on e.department_id = d.department_id 
WHERE d.department_name = 'Engineering'
GROUP BY e.employee_id, e.employee_name
HAVING project_count > 1;

SELECT 
d.department_name,
COUNT(e.employee_id) AS employees_count
FROM departments d 
JOIN employees e ON e.department_id = d.department_id 
WHERE e.salary > 60000
GROUP BY d.department_id 
HAVING employees_count > 2;

SELECT  
c.client_name,
SUM(p.budget)
FROM projects p 
JOIN clients c ON p.client_id = c.client_id 
WHERE P.budget > 500000
GROUP BY c.client_id 
HAVING SUM(p.budget) > 2000000;

SELECT 
d.department_name, 
AVG(p.budget) AS Average_Porject_Budget
FROM departments d 
JOIN projects p ON p.department_id = d.department_id 
WHERE p.budget > 1000000
GROUP BY d.department_id 
HAVING AVG(p.budget) > 1500000;

SELECT 
d.department_name,
COUNT(e.employee_id) AS employee_count 
FROM departments d 
JOIN employees e ON e.department_id = d.department_id 
GROUP BY d.department_id 
HAVING employee_count > 2;

SELECT 
d.department_name,
AVG(e.salary) AS Average_salary 
FROM departments d 
JOIN employees e ON e.department_id = d.department_id 
GROUP BY d.department_id 
HAVING Average_salary > 70000;

SELECT
c.client_name,
SUM(p.budget) AS Total_budget
FROM projects p 
JOIN clients c ON p.client_id = c.client_id  
GROUP BY c.client_id 
HAVING Total_budget > 2000000;

SELECT 
d.department_name, 
SUM(ep.hours_worked) AS Total_hours_worked 
FROM departments d 
JOIN employees e ON d.department_id = e.department_id 
JOIN employee_projects ep ON e.employee_id = ep.employee_id 
GROUP BY d.department_id, d.department_name
HAVING SUM(ep.hours_worked) > 500;

SELECT 
c.client_name,
COUNT(p.project_id) AS project_count
FROM projects p 
JOIN clients c ON c.client_id = p.client_id 
GROUP BY c.client_id 
HAVING COUNT(p.project_id) >= 2;

SELECT 
c.client_name,
AVG(p.budget) AS AVG_project_budget 
FROM projects p 
JOIN clients c ON c.client_id = p.client_id 
GROUP BY c.client_id
HAVING AVG_project_budget > 1500000;

SELECT c.client_name, AVG(p.budget) AS average_project_budget
FROM clients c
JOIN projects p ON c.client_id = p.client_id
GROUP BY c.client_id, c.client_name
HAVING AVG(p.budget) > 1500000;

SELECT 
p.project_name,
COUNT(DISTINCT e.employee_id) AS employee_count 
FROM employees e
JOIN employee_projects ep ON e.employee_id = ep.employee_id
JOIN projects p ON p.project_id = ep.project_id
GROUP BY p.project_id 
HAVING COUNT(DISTINCT e.employee_id) > 3;

SELECT 
c.client_name,
SUM(ep.hours_worked) AS Total_hours
FROM employees e 
JOIN employee_projects ep ON e.employee_id = ep.employee_id 
JOIN projects p ON ep.project_id = p.project_id 
JOIN clients c ON p.client_id = c.client_id 
WHERE c.industry = 'Technology'
GROUP BY c.client_id 
HAVING SUM(ep.hours_worked) > 500;

SELECT 
p.project_name,
COUNT(DISTINCT e.employee_id) AS employee_count
FROM employees e 
JOIN employee_projects ep ON e.employee_id = ep.employee_id 
JOIN projects p ON p.project_id = ep.project_id 
WHERE ep.hours_worked > 100
GROUP BY p.project_id 
HAVING employee_count >= 3;

SELECT 
e.employee_name,
d.department_name,
p.project_name,
c.client_name, 
ep.role,
ep.hours_worked
FROM departments d 
JOIN employees e ON d.department_id = e.department_id 
JOIN employee_projects ep ON e.employee_id = ep.employee_id 
JOIN projects p ON ep.project_id = p.project_id 
JOIN clients c ON c.client_id = p.client_id;

SELECT 
d.department_name, 
p.project_name, 
c.client_name,
p.budget
FROM departments d 
JOIN projects p ON d.department_id = p.department_id
JOIN clients c ON p.client_id = c.client_id
WHERE p.budget > 1000000
ORDER BY p.budget DESC;

SELECT 
e.employee_name 
FROM employees e 
LEFT JOIN employee_projects ep ON e.employee_id = ep.employee_id 
WHERE ep.project_id IS NULL;

SELECT d.department_name
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;