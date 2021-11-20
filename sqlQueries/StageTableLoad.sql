create table proj_stg (Emp_ID varchar(8),
                       Emp_NM varchar(50),
					   Email  varchar(100),
					   hire_dt date,
					   job_title varchar(100),
					   salary int,
					   department_nm varchar(50),
					   manager varchar(50),
					   start_dt date,
					   end_dt date,
					   location varchar(50),
					   address varchar(100),
					   city varchar(50),
					   state varchar(2),
					   education_lvl varchar(50));

COPY proj_stg FROM '***csv path location***'
DELIMITER ','CSV HEADER;