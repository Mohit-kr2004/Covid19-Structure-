
--CREATE TABLES--
--Employee
---------------------------------------------------
CREATE TABLE Employee(
  Employee_Id INT,
  First_Name VARCHAR(25),
  Last_Name VARCHAR(25),
  Hire_Date DATE,
  City VARCHAR(25),
  State VARCHAR(25),
  CONSTRAINT EMPLOYEE_PK PRIMARY KEY (Employee_Id));
  ALTER TABLE Employee
  add ID int
---------------------------------------------------
--Department
---------------------------------------------------
  CREATE TABLE Department(
  Department_Id INT,
  Department_Name VARCHAR(30),
  CONSTRAINT DEPARTMENT_PK PRIMARY KEY (Department_Id)
  );
  
  -------------------------------------------------
  --Salary
  -------------------------------------------------
  
  CREATE TABLE Salary(
  Salary_Id INT,
  Gross_Salary INT,
  Hourly_Pay INT,
  State_Tax VARCHAR(50),
  Federal_Tax VARCHAR(50),
  Account_Id INT,
  CONSTRAINT SALARY_PK PRIMARY KEY (Salary_Id),
  FOREIGN KEY (Account_Id)
        REFERENCES AccountDetails (Account_Id)
  );
  
  -------------------------------------------------
  --DepartmentProject Bridge
  -------------------------------------------------
  CREATE TABLE DepartmentProject(
  Department_Id INT,
  Project_Id INT,
  CONSTRAINT DEPTPROJECT_PK PRIMARY KEY (Department_Id,Project_Id),
  FOREIGN KEY (Department_Id)
        REFERENCES Department(Department_Id),
  FOREIGN KEY (Project_Id)
        REFERENCES Project(Project_Id)
  );
  --------------------------------------------------
  --Project
  --------------------------------------------------
  CREATE TABLE Project(
  Project_Id INT,
  Project_Name VARCHAR(50),
  Project_Description VARCHAR(50),
  CONSTRAINT Project_PK PRIMARY KEY (Project_Id)
  );
  
  ---------------------------------------------------
  --AccountDetails
  ---------------------------------------------------
  
  CREATE TABLE AccountDetails(
  Account_Id INT,
  Bank_Name VARCHAR(50),
  Account_Number VARCHAR(50),
  Employee_Id INT,
  CONSTRAINT Account_PK PRIMARY KEY (Account_Id),
  FOREIGN KEY (Employee_Id)
        REFERENCES Employee(Employee_Id)
  );
  ---------------------------------------------------
  --Education
  ---------------------------------------------------
  CREATE TABLE Education(
  Education_Id INT,
  Employee_Id INT,
  Degree VARCHAR(30),
  Graduation_Year VARCHAR(4),
  CONSTRAINT Location_PK PRIMARY KEY (Education_Id),
  FOREIGN KEY (Employee_Id)
        REFERENCES Employee (Employee_Id)
  );
  ---------------------------------------------------
  --Leave
  ---------------------------------------------------
  
  CREATE TABLE Leave(
  Leave_Id INT,
  Employee_Id INT,
  Leave_date DATE,
  CONSTRAINT Leave_PK PRIMARY KEY (Leave_Id),
  FOREIGN KEY (Employee_Id)
        REFERENCES Employee(Employee_Id)
  );
  
 ----------------------------------------------------
 --EmployeeAttendance Bridge
 ----------------------------------------------------
  
  CREATE TABLE Employee_Attendance(
  Employee_Id INT,
  Attendance_Id INT,
  CONSTRAINT DEPARTMENTPROJECT_PK PRIMARY KEY (Employee_Id,Attendance_Id),
  FOREIGN KEY (Employee_Id)
        REFERENCES Employee(Employee_Id),
  FOREIGN KEY (Attendance_Id)
        REFERENCES Attendance (Attendance_Id)
  );
  
  ----------------------------------------------------
  --Attendance
  ----------------------------------------------------
   
  CREATE TABLE Attendance(
  Attendance_Id INT,
  Hours_Worked INT,
  CONSTRAINT Attendance_PK PRIMARY KEY (Attendance_Id)
  );
  
  ----------------------------------------------------
  --WorkLocation
  ----------------------------------------------------
  CREATE TABLE Work_Location(
  Location_Id INT,
  Location VARCHAR(25),
  Number_Of_Employees INT,
  City VARCHAR(25),
  State VARCHAR(25),
  CONSTRAINT Loc_PK PRIMARY KEY (Location_Id)
  );
  ALTER TABLE Work_Location
  add ID int
  
----------------------------------------------------------------------- 

INSERT INTO Employee VALUES (101,'Ojas','Phansekar',('14-APR-16'),'New York City','New York',1);
INSERT INTO Employee VALUES (102,'Vrushali','Patil',('21-JUN-18'),'Boston','Massachusetts',2);
INSERT INTO Employee VALUES (103,'Pratik','Parija',('13-SEP-19'),'Chicago','Illinois',3);
INSERT INTO Employee VALUES (104,'Chetan','Mistry',('12-APR-11'),'Miami','Florida',4);
INSERT INTO Employee VALUES (105,'Anugraha','Varkey',('16-AUG-17'),'Atlanta','Georgia',5);
INSERT INTO Employee VALUES (106,'Rasagnya','Reddy',('25-JUL-18'),'San Mateo','California',6);
INSERT INTO Employee VALUES (107,'Aishwarya','Boralkar',('18-DEC-10'),'San Francisco','California',7);
INSERT INTO Employee VALUES (108,'Shantanu','Savant',('27-NOV-15'),'Seattle','Washington',8);
INSERT INTO Employee VALUES (109,'Kalpita','Malvankar',('24-APR-16'),'Boston','Massachusetts',8);
INSERT INTO Employee VALUES (110,'Saylee','Bhagat',('21-MAY-14'),'San Francisco','California',7);


INSERT INTO Department VALUES (1,'Human Resources');
INSERT INTO Department VALUES (2,'Software Development');
INSERT INTO Department VALUES (3,'Data Analysis');
INSERT INTO Department VALUES (4,'Data Science');
INSERT INTO Department VALUES (5,'Business Intelligence');
INSERT INTO Department VALUES (6,'Data Engineering');
INSERT INTO Department VALUES (7,'Manufacturing');
INSERT INTO Department VALUES (8,'Quality Control');

INSERT INTO Project VALUES (21,'Dev','Whatever');
INSERT INTO Project VALUES (22,'Prod','do something');
INSERT INTO Project VALUES (23,'Test','focus');
INSERT INTO Project VALUES (24,'Nothing','do nothing');
INSERT INTO Project VALUES (25,'Research','focus on everything');
INSERT INTO Project VALUES (26,'Next Steps','find some way out');

INSERT INTO AccountDetails VALUES (40,'Santander','S12344',101);
INSERT INTO AccountDetails VALUES (41,'Santander','S12345',102);
INSERT INTO AccountDetails VALUES (42,'Santander','S12346',103);
INSERT INTO AccountDetails VALUES (43,'Santander','S12347',104);
INSERT INTO AccountDetails VALUES (44,'Chase','C12344',105);
INSERT INTO AccountDetails VALUES (45,'Chase','C12345',106);
INSERT INTO AccountDetails VALUES (46,'Chase','C12347',107);
INSERT INTO AccountDetails VALUES (47,'Chase','C12334',108);
INSERT INTO AccountDetails VALUES (48,'BOFA','C12378',109);
INSERT INTO AccountDetails VALUES (49,'BOFA','C12390',110);

INSERT INTO Education VALUES (10,101,'MS','2017');
INSERT INTO Education VALUES (11,102,'MS','2019');
INSERT INTO Education VALUES (12,104,'MS','2011');
INSERT INTO Education VALUES (13,108,'MS','2015');
INSERT INTO Education VALUES (14,109,'Bachelor','2013');
INSERT INTO Education VALUES (15,107,'Bachelor','2008');
INSERT INTO Education VALUES (16,106,'Bachelor','2007');


INSERT INTO Leave VALUES (51,104,('1-DEC-19'));
INSERT INTO Leave VALUES (52,108,('2-DEC-19'));
INSERT INTO Leave VALUES (53,109,('3-DEC-19'));
INSERT INTO Leave VALUES (54,107,('4-DEC-19'));
INSERT INTO Leave VALUES (55,106,('5-DEC-19'));
INSERT INTO Leave VALUES (56,104,('6-DEC-19'));
INSERT INTO Leave VALUES (57,108,('7-DEC-19'));
INSERT INTO Leave VALUES (58,109,('7-DEC-19'));
INSERT INTO Leave VALUES (59,107,('8-DEC-19'));
INSERT INTO Leave VALUES (60,106,('9-DEC-19'));

INSERT INTO Attendance VALUES (90,10);
INSERT INTO Attendance VALUES (91,20);
INSERT INTO Attendance VALUES (92,30);
INSERT INTO Attendance VALUES (93,40);
INSERT INTO Attendance VALUES (94,45);
INSERT INTO Attendance VALUES (95,56);
INSERT INTO Attendance VALUES (96,58);

INSERT INTO Work_Location VALUES (71,'North',4,'New York City','New York',101);
INSERT INTO Work_Location VALUES (72,'North',4,'Boston','Massachusetts',102);
INSERT INTO Work_Location VALUES (73,'North',4,'Chicago','Illinois',103);
INSERT INTO Work_Location VALUES (74,'North',89,'Miami','Florida',104);
INSERT INTO Work_Location VALUES (75,'South',90,'Atlanta','Georgia',105);
INSERT INTO Work_Location VALUES (76,'South',100,'San Mateo','California',106);
INSERT INTO Work_Location VALUES (77,'South',4,'San Francisco','California',107);
INSERT INTO Work_Location VALUES (78,'South',2,'Seattle','Washington',108);
INSERT INTO Work_Location VALUES (79,'South',25,'Alpharetta','Georgia',109);
INSERT INTO Work_Location VALUES (80,'South',20,'Keene','New Hampshire',110);
INSERT INTO Work_Location VALUES (81,'South',22,'Hampton','New Hampshire',109);











INSERT INTO Employee_Attendance VALUES (101,90);
INSERT INTO Employee_Attendance VALUES (102,91);
INSERT INTO Employee_Attendance VALUES (103,92);
INSERT INTO Employee_Attendance VALUES (104,93);
INSERT INTO Employee_Attendance VALUES (105,94);
INSERT INTO Employee_Attendance VALUES (106,95);
INSERT INTO Employee_Attendance VALUES (107,96);
INSERT INTO Employee_Attendance VALUES (108,91);
INSERT INTO Employee_Attendance VALUES (109,92);
INSERT INTO Employee_Attendance VALUES (110,93);

INSERT INTO DepartmentProject VALUES (1,21);
INSERT INTO DepartmentProject VALUES (2,22);
INSERT INTO DepartmentProject VALUES (3,23);
INSERT INTO DepartmentProject VALUES (4,24);
INSERT INTO DepartmentProject VALUES (5,25);
INSERT INTO DepartmentProject VALUES (6,26);
INSERT INTO DepartmentProject VALUES (7,21);
INSERT INTO DepartmentProject VALUES (8,24);

INSERT INTO Salary VALUES (1,57600,30,200,1000,40);
INSERT INTO Salary VALUES (2,76800,40,300,1300,41);
INSERT INTO Salary VALUES (3,96000,50,400,1500,42);
INSERT INTO Salary VALUES (4,115200,60,500,1700,43);
INSERT INTO Salary VALUES (5,57600,30,200,1000,44);
INSERT INTO Salary VALUES (6,76800,40,300,1300,45);
INSERT INTO Salary VALUES (7,96000,50,400,1500,46);
INSERT INTO Salary VALUES (8,115200,60,500,1700,47);
INSERT INTO Salary VALUES (9,57600,30,200,1000,48);
INSERT INTO Salary VALUES (10,76800,40,300,1300,49);

select * from dbo.Employee
select * from dbo.Salary
select * from dbo.Department
select * from dbo.Employee_Attendance
select * from dbo.Project

INSERT INTO Employee VALUES (111,'Priyanka','Jonas',('14-NOV-16'),'New York City','New York',1);
INSERT INTO Employee VALUES (112,'John','Vincent',('21-JUN-18'),'Boston','Massachusetts',2);
INSERT INTO Employee VALUES (113,'Pratik','Panhale',('13-SEP-19'),'Chicago','Illinois',3);

use employeepayroll
-- fetch employees with their department and salary.
select CONCAT_WS(' ',First_Name,Last_Name) Employees,Department_Name,Gross_Salary 
from dbo.Employee E 
inner join dbo.Department D on E.ID = D.Department_Id inner join Salary S on D.Department_Id = S.Salary_Id

--how much hourly paid to the employees
select ID,concat_ws(' ',First_Name,Last_Name) as Employee,Salary_Id,Hourly_Pay,Gross_Salary  from dbo.Employee E
inner join dbo.Salary S on E.ID = S.Salary_Id

-- Employees details with their working city state
select concat_ws(' ',First_Name,Last_Name) as Employees, W.City, W.State from 
dbo.Employee E inner join dbo.Work_Location W on E.Employee_Id=W.ID 

select * from dbo.Employee
SELECT * FROM dbo.DepartmentProject
select * from dbo.Project

--Name of employees that are associated with their projects
Select  concat_ws(' ',First_Name,Last_Name) as Employees,Project_Name from 
dbo.Employee E inner join dbo.DepartmentProject DP on E.ID = DP.Department_Id
inner join dbo.Project P on DP.Project_Id = P.Project_Id

use employeepayroll
select * from dbo.Education
SELECT * FROM dbo.DepartmentProject
select * from dbo.Project
select * from dbo.Work_Location
select * from dbo.Salary
select * from dbo.Employee
--name employees with their degree and graduation field
Select  concat_ws(' ',First_Name,Last_Name) as Employees,Degree,Graduation_Year from 
dbo.Employee E inner join dbo.Education ED on E.Employee_Id = ED.Employee_Id

-- That employee WORKING IN 'Atlanta' 
Select  concat_ws(' ',First_Name,Last_Name) as Employees,WL.City from 
dbo.Employee E inner join dbo.Work_Location WL on E.Employee_Id = WL.ID where WL.City = 'Atlanta'

--find their salary too
Select  concat_ws(' ',First_Name,Last_Name) as Employee,WL.City, S.Gross_Salary from 
dbo.Employee E inner join dbo.Work_Location WL on E.Employee_Id = WL.ID inner join dbo.Salary S on E.ID =S.Salary_Id where WL.City = 'Atlanta'

--about eduation
Select  concat_ws(' ',First_Name,Last_Name) as Employee,WL.City,Degree ,S.Gross_Salary from 
dbo.Employee E inner join dbo.Work_Location WL on E.Employee_Id = WL.ID 
inner join dbo.Salary S on E.ID =S.Salary_Id inner join dbo.Education ED on ED.Employee_Id = WL.ID
where WL.City = 'Atlanta'

-- bank names according to the 
Select  concat_ws(' ',First_Name,Last_Name) as Employees,Bank_Name 
, Account_Number from dbo.Employee E inner join dbo.AccountDetails A
on E.Employee_Id = A.Employee_Id

--increase salary of each employee with 10% in new year
update dbo.Salary set Gross_Salary = Gross_Salary+(Gross_Salary*0.1)

SELECT * FROM dbo.Department
select * from dbo.Employee
select * from dbo.Education

-- DEGREE and year according to their department
select  concat_ws(' ',First_Name,Last_Name) as Employee, Department_Name, Degree, Graduation_Year
from dbo.Employee E inner join dbo.Department D 
on  E.ID=D.Department_Id inner join dbo.Education ED on ED.Employee_Id = E.Employee_Id

--