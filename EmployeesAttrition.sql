create database HR_Employee
use HR_Employee

select * from dbo.HR_Employee_Attrition
--there are no null values in the data
--check the count of Employees
select count(*) Employees from dbo.HR_Employee_Attrition
--Age more then 50
select * from dbo.HR_Employee_Attrition where Age>50

--Employees per department
select Department,COUNT(Department) as Employees from dbo.HR_Employee_Attrition
group by Department

--Employees per Education 
select EducationField,COUNT(EducationField) Employees from dbo.HR_Employee_Attrition
group by EducationField

--Average Salary
select AVG(MonthlyRate) as Average_salary from dbo.HR_Employee_Attrition

-- Highest salary 
select MAX(MonthlyRate) Highest_salary from dbo.HR_Employee_Attrition

--Lowest salary
select MIN(MonthlyRate) Lowest_salary from dbo.HR_Employee_Attrition
--Total Salary
select SUM(MonthlyRate) Total_salary_expense from dbo.HR_Employee_Attrition
--Employees age with highest salary
select Age,department,MonthlyRate from dbo.HR_Employee_Attrition
where MonthlyRate=(select MAX(MonthlyRate) from dbo.HR_Employee_Attrition)

--Employees age with Lowest salary
select Age,department,MonthlyRate from dbo.HR_Employee_Attrition
where MonthlyRate=(select Min(MonthlyRate) from dbo.HR_Employee_Attrition)

--Average Year of Experience among Employees
select AVG(TotalWorkingYears) as Average_year_experience from dbo.HR_Employee_Attrition

--Average salary per department
select Department,avg(MonthlyRate) Salary from dbo.HR_Employee_Attrition
group by Department

select * from dbo.HR_Employee_Attrition

--Business Travel persons
select BusinessTravel,COUNT(BusinessTravel) Employees from dbo.HR_Employee_Attrition
group by BusinessTravel

--Attrition Department wise
select Department,count(Attrition) Attrition_Employees from dbo.HR_Employee_Attrition
group by Department

--comparison of standard hours and working hours
select sum(HourlyRate)-sum(StandardHours) as Total_Employees_work from dbo.HR_Employee_Attrition
select Department,sum(HourlyRate)-sum(StandardHours) as Employees_worked_Hours from dbo.HR_Employee_Attrition
group by Department

--Total Working year age wise and max compoany change
select Age,Avg(TotalWorkingYears)Working_years ,Max(NumCompaniesWorked) Max_companies_change from dbo.HR_Employee_Attrition
group by Age
Order by Age
--Total Working year age wise and min compoany change
select Age,Avg(TotalWorkingYears)Working_years ,Min(NumCompaniesWorked) Min_companies_change from dbo.HR_Employee_Attrition
group by Age
Order by Age

--Department and age wise EnvironmentSatisfaction
select Age,max(EnvironmentSatisfaction) Max_Rating,min(EnvironmentSatisfaction) Min_Rating from dbo.HR_Employee_Attrition
group by Age

--Age wise max year of promotion
select Age,Max(YearsSinceLastPromotion)Last_promotion_year from dbo.HR_Employee_Attrition
group by Age

--Age wise min year of promotion
select Age,Min(YearsSinceLastPromotion)Min_promotion_year from dbo.HR_Employee_Attrition
group by Age

--Age wise min year current role
select Age,Max(YearsInCurrentRole) Current_role_YEAR from dbo.HR_Employee_Attrition
group by Age

--Salary Hike Age wise
select Age,max(PercentSalaryHike) Salary_Hike from dbo.HR_Employee_Attrition
group by Age

--Salary Hike Department wise
select Department,max(PercentSalaryHike) Salary_Hike from dbo.HR_Employee_Attrition
group by Department


--That is insights in data 
