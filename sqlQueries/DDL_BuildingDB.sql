
--Create tables

CREATE TABLE Location (Location_ID SERIAL PRIMARY KEY,
                      Location_NM VARCHAR(50),
                      Address VARCHAR(50),
                      City VARCHAR(50),
                      State VARCHAR(50));

CREATE TABLE Department (Department_ID SERIAL PRIMARY KEY,
                      Dept_NM VARCHAR(50));

CREATE TABLE Job_Title (Job_Title_ID SERIAL PRIMARY KEY,
                      Job_Title_NM VARCHAR(50));
                      
CREATE TABLE Salary (Salary_ID SERIAL PRIMARY KEY,
                      Salary_Amount INT);
                      
CREATE TABLE Education_Level (Ed_Lvl_ID SERIAL PRIMARY KEY,
                      Ed_Lvl VARCHAR(50));

CREATE TABLE Employee (Emp_ID VARCHAR(10) PRIMARY KEY,
                     Emp_NM VARCHAR(50),
                      Email VARCHAR(50),
                      Ed_Lvl_ID INT REFERENCES Education_Level(Ed_Lvl_ID));
                      
CREATE TABLE Employee_History (Emp_ID VARCHAR(10) REFERENCES Employee(Emp_ID),
                      Hire_DT DATE,
                      Start_DT DATE,
                      End_DT DATE,
                      Dept_ID INT REFERENCES Department(Department_ID),
                      Dept_Manager_ID VARCHAR(10) REFERENCES Employee(Emp_ID),
                      Location_ID INT REFERENCES Location(Location_ID),
                      Job_Title_ID INT REFERENCES Job_Title(Job_Title_ID),
                      Salary_ID INT REFERENCES Salary(Salary_ID),
                      PRIMARY KEY(Emp_ID, Job_Title_ID));

--Load data into tables from employee excel 

INSERT INTO Location(Location_NM, Address, City, State) 
SELECT DISTINCT location, address, city, state FROM proj_stg;

INSERT INTO Department (Dept_NM)
SELECT DISTINCT department_nm FROM proj_stg;

INSERT INTO Job_Title (Job_Title_NM)
SELECT DISTINCT job_title FROM proj_stg;

INSERT INTO Salary (Salary_Amount)
SELECT DISTINCT salary FROM proj_stg;

INSERT INTO Education_Level (Ed_Lvl)
SELECT DISTINCT education_lvl FROM proj_stg;

INSERT INTO Employee (Emp_ID, Emp_NM, Email, Ed_Lvl_ID)
SELECT DISTINCT emp_ID, Emp_NM, Email, ed.Ed_Lvl_ID 
FROM proj_stg as p
JOIN Education_Level as ed
ON p.education_lvl = ed.Ed_LVL;

INSERT INTO Employee_History (Emp_ID, Hire_DT, Start_DT, End_DT, Job_Title_ID, Location_ID, Dept_ID, Salary_ID, Dept_Manager_ID)
SELECT e.Emp_ID, Hire_DT, Start_DT, End_DT, j.Job_Title_ID, l.Location_ID, d.Department_ID, s.Salary_ID, dp.Emp_ID
FROM proj_stg as p
JOIN Employee as e
ON p.Emp_ID = e.Emp_ID
JOIN Job_Title as j
ON p.job_title = j.Job_Title_NM
JOIN Location as l
ON p.location = l.Location_NM
JOIN Department AS d
ON p.department_nm = d.Dept_NM
JOIN Salary as s
ON p.salary = s.Salary_Amount
LEFT JOIN Employee as dp
ON p.manager = dp.Emp_NM;







