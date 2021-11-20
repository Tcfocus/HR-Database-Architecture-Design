SELECT e.Emp_ID, ee.Emp_Nm, j.Job_Title_NM, d.Dept_NM
FROM Employee_History as e
JOIN Employee as ee
on e.Emp_ID = ee.Emp_ID
Join Job_Title as j
on e.Job_Title_ID = j.Job_Title_ID
JOIN Department AS d
on e.Dept_ID = d.Department_ID;


INSERT INTO Job_Title (Job_Title_NM)
VALUES ('Web Programmer');


UPDATE Job_Title
SET job_title_nm = 'Web Developer'
WHERE job_title_nm = 'Web Programmer';


DELETE FROM Job_Title
WHERE job_title_nm = 'Web Developer';

SELECT d.Dept_NM, COUNT(e.Emp_ID) FROM Employee_History as e
JOIN Department as d
ON e.Dept_ID = d.Department_ID
GROUP BY d.Dept_NM;

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