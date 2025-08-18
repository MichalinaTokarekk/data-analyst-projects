/*
	Top, Distinct, Count, As, Max, Min, Avg
*/

SELECT *
FROM EmployeeDemographics

SELECT TOP 5 *
FROM EmployeeDemographics

SELECT DISTINCT(Gender)
FROM EmployeeDemographics

SELECT Gender
FROM EmployeeDemographics

SELECT COUNT(LastName) AS LastNameCount
FROM EmployeeDemographics

SELECT MAX(Salary)
FROM EmployeeSalary

SELECT AVG(Salary)
FROM EmployeeSalary

/*
	Where Statement 
	=, <>, <, >, And, Or, Like, Null, Not Null, In

	In to jest jak equal ale dla wielu rzeczy
*/

SELECT *
FROM EmployeeDemographics
WHERE FirstName <> 'Jim'

SELECT *
FROM EmployeeDemographics
WHERE Age <= 32 OR Gender = 'Male'

SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE 'S%'

SELECT *
FROM EmployeeDemographics
WHERE FirstName is NOT NULL

SELECT *
FROM EmployeeDemographics
WHERE FirstName IN ('Jim', 'Michael')

/*
	Group By, Order By
*/

SELECT Gender, COUNT(Gender)
FROM EmployeeDemographics

SELECT Gender, COUNT(Gender) AS CounterGender
FROM EmployeeDemographics
GROUP BY Gender
ORDER BY Gender DESC


SELECT *
FROM EmployeeDemographics
ORDER BY 5 DESC, 4 DESC

/*
	Inner Joins, Full/Right/Left, Outer Joins
*/

SELECT *
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT *
FROM EmployeeDemographics
FULL OUTER JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT *
FROM EmployeeDemographics
LEFT OUTER JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT *
FROM EmployeeDemographics
RIGHT OUTER JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT EmployeeSalary.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE FirstName <> 'Michael'
ORDER BY Salary DESC

SELECT JobTitle, AVG(Salary)
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Salesman'
GROUP BY JobTitle

/*
	UNION, UNION ALL
*/

SELECT *
FROM EmployeeDemographics
FULL OUTER JOIN WareHouseEmployeeDemographics
	ON EmployeeDemographics.EmployeeID = WareHouseEmployeeDemographics.EmployeeID

SELECT *
FROM EmployeeDemographics
UNION
SELECT *
FROM WareHouseEmployeeDemographics

SELECT *
FROM EmployeeDemographics
UNION ALL
SELECT *
FROM WareHouseEmployeeDemographics

SELECT EmployeeID, FirstName, Age
FROM EmployeeDemographics
UNION ALL
SELECT EmployeeID, JobTitle, Salary
FROM EmployeeSalary


/*
	Case Statement
*/


SELECT FirstName, LastName, Age,
CASE
	WHEN Age > 30 THEN 'Old'
	ELSE 'Young'
END
FROM EmployeeDemographics
WHERE Age IS NOT NULL
ORDER BY Age



SELECT FirstName, LastName, JobTitle, Salary,
CASE
	WHEN JobTitle = 'Salesman' THEN Salary + (Salary* .10)
	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * .05)
	WHEN JobTitle = 'HR' THEN Salary + (Salary * .000001)
	ELSE Salary + (Salary * .03)
END AS SalaryAfterRaise
FROM EmployeeDemographics
JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


/*
	Having Clause
*/

SELECT JobTitle, COUNT(JobTitle)
FROM EmployeeDemographics
JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle) > 1


--SELECT COUNT(JobTitle)
--FROM EmployeeDemographics
--JOIN EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

SELECT JobTitle, AVG(Salary)
FROM EmployeeDemographics
JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary) > 45000
ORDER BY AVG(Salary)


/*
	Updating/Deleting Data
*/

SELECT *
FROM EmployeeDemographics

UPDATE EmployeeDemographics
SET Age = 31, Gender = 'Female'
WHERE FirstName = 'Holly' AND LastName = 'Flax'


DELETE TOP (1)
FROM EmployeeDemographics
WHERE FirstName = 'Jim' AND LastName = 'Halpert';


/*
	Aliasing
*/

SELECT *
FROM EmployeeDemographics

SELECT FirstName + ' ' + LastName AS FullName
FROM EmployeeDemographics



/*
	Partition By
*/

SELECT FirstName, LastName, Gender, Salary,
COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender
FROM [SQL learning].dbo.EmployeeDemographics dem
JOIN [SQL learning].dbo.EmployeeSalary sal
	ON dem.EmployeeID = sal.EmployeeID


SELECT 
FirstName, 
LastName, 
Gender, 
Salary,
RANK() OVER (PARTITION BY Gender ORDER BY Salary DESC) AS RankInGender
FROM EmployeeDemographics dem
JOIN EmployeeSalary sal
    ON dem.EmployeeID = sal.EmployeeID;


SELECT 
    FirstName, 
    LastName, 
    JobTitle, 
    Salary,
    SUM(Salary) OVER (PARTITION BY JobTitle ORDER BY Salary) AS RunningTotal
FROM EmployeeDemographics dem
JOIN EmployeeSalary sal
    ON dem.EmployeeID = sal.EmployeeID;


/*
	CTESs (Common Table Expression)
*/

WITH CTE_Employee AS 
(SELECT FirstName, LastName, Gender, Salary,
COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender,
AVG(Salary) OVER (PARTITION BY Gender) AS AvgSalary
FROM [SQL learning].dbo.EmployeeDemographics dem
JOIN [SQL learning].dbo.EmployeeSalary sal
	ON dem.EmployeeID = sal.EmployeeID
WHERE Salary > '45000'
)

SELECT *
FROM CTE_Employee




;WITH S AS (
  SELECT Gender, AVG(Salary) AS AvgSal
  FROM [SQL learning].dbo.EmployeeDemographics dem
  JOIN [SQL learning].dbo.EmployeeSalary sal ON dem.EmployeeID = sal.EmployeeID
  GROUP BY Gender
)
SELECT * FROM S WHERE AvgSal > 50000
UNION ALL
SELECT * FROM S WHERE AvgSal BETWEEN 40000 AND 60000;


--To samo zapytanie ale bez CTE's 

SELECT *
FROM (
    SELECT Gender, AVG(Salary) AS AvgSal
    FROM EmployeeDemographics dem 
    JOIN EmployeeSalary sal ON dem.EmployeeID = sal.EmployeeID
    GROUP BY Gender
) S
WHERE AvgSal > 50000

UNION ALL

SELECT *
FROM (
    SELECT Gender, AVG(Salary) AS AvgSal
    FROM EmployeeDemographics dem 
    JOIN EmployeeSalary sal ON dem.EmployeeID = sal.EmployeeID
    GROUP BY Gender
) S
WHERE AvgSal BETWEEN 40000 AND 60000;


/*
	Temp tables
*/

CREATE TABLE #temp_Employee (
EmployeeID int,
JobTitle varchar(100),
Salary int
)

SELECT *
FROM #temp_Employee

INSERT INTO #temp_Employee VALUES (
'1001', 'HR', '45000')


INSERT INTO #temp_Employee
SELECT *
FROM EmployeeSalary

drop table if exists #temp_employees_per_job
CREATE TABLE #temp_employees_per_job (
JobTitle varchar(100),
EmployeesPerJob int,
AvgAge int,
AvgSalary int
)

INSERT INTO #temp_employees_per_job 
SELECT JobTitle, COUNT(JobTitle), Avg(Age), Avg(Salary)
FROM EmployeeDemographics dem
JOIN EmployeeSalary sal
	ON dem.EmployeeID = sal.EmployeeID
GROUP BY JobTitle


select *
from #temp_employees_per_job

/*

Today's Topic: String Functions - TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower

*/


CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

Insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

Select *
From EmployeeErrors


-- Using Trim, LTRIM, RTRIM

select EmployeeID, TRIM(EmployeeID) as idtrim
from EmployeeErrors

select EmployeeID, ltrim(EmployeeID) as idtrim
from EmployeeErrors

select EmployeeID, rtrim(EmployeeID) as idtrim
from EmployeeErrors

-- Using Replace

Select LastName, REPLACE(LastName, '- Fired', '') as LastNameFixed
FROM EmployeeErrors
