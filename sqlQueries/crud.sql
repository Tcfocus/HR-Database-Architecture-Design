--SQL queries to demonstrate the database capabilities

--Return list of employees with Job Titles and department names
SELECT e.Emp_ID, ee.Emp_Nm, j.Job_Title_NM, d.Dept_NM
FROM Employee_History as e
JOIN Employee as ee
on e.Emp_ID = ee.Emp_ID
Join Job_Title as j
on e.Job_Title_ID = j.Job_Title_ID
JOIN Department AS d
on e.Dept_ID = d.Department_ID;

-- Insert 'Web Programmer' as new job title
INSERT INTO Job_Title (Job_Title_NM)
VALUES ('Web Programmer');

-- Correct the job title from 'Web Programmer' to 'Web Developer'
UPDATE Job_Title
SET job_title_nm = 'Web Developer'
WHERE job_title_nm = 'Web Programmer';

-- Delete the job title 'Web Developer' from the database
DELETE FROM Job_Title
WHERE job_title_nm = 'Web Developer';

-- Return the number of employees in each department
SELECT d.Dept_NM, COUNT(e.Emp_ID) FROM Employee_History as e
JOIN Department as d
ON e.Dept_ID = d.Department_ID
GROUP BY d.Dept_NM;

-- Return the current and past jobs for employee Toni Lembeck over her different tenures
SELECT e.Emp_NM, j.Job_Title_NM, d.Dept_NM, ee.Emp_NM, eh.Start_DT, eh.End_DT 
FROM Employee_History as eh
JOIN Employee as e
ON eh.Emp_ID =e.Emp_ID
JOIN Job_Title as j
ON eh.Job_Title_ID = j.Job_Title_ID
join Department as d
ON eh.Dept_ID = d.Department_ID
JOIN Employee as ee
ON eh.Dept_Manager_ID = ee.Emp_ID
WHERE e.Emp_NM = 'Toni Lembeck';

-- Create view that returns all employee attributes with same format as initial Excel file
CREATE VIEW Full_Employee AS
SELECT eh.Emp_ID, e.Emp_NM, e.Email, eh.Hire_Dt, j.Job_Title_NM, s.Salary_Amount, d.Dept_NM, eh.Dept_Manager_ID, eh.Start_DT, eh.End_DT, l.location_nm, l.address, l.city, l.state, e.Ed_Lvl_id
FROM Employee_History as eh

JOIN Employee as e
ON eh.Emp_ID = e.Emp_ID
JOIN Job_Title as j
ON eh.Job_Title_ID = j.Job_Title_ID
join Department as d
ON eh.Dept_ID = d.Department_ID
JOIN Salary as s
on eh.Salary_ID = s.Salary_ID
JOIN Location as l
ON eh.Location_ID = l.Location_ID;