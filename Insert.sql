--CREATE TABLE EmployeeDemographics
--(EmployeeID int,
--FirstName varchar(50),
--LastName varchar(50),
--Age int,
--Gender varchar(50)
--)


--CREATE TABLE EmployeeSalary
--(EmployeeID int,
--JobTitle varchar(50),
--Salary int)


--CREATE TABLE WareHouseEmployeeDemographics (
--    EmployeeID INT,
--    FirstName VARCHAR(50),
--    LastName VARCHAR(50),
--    Age INT,
--    Gender VARCHAR(10)
--);




--INSERT INTO EmployeeDemographics VALUES
--(1001, 'Jim', 'Halpert', 30, 'Male'),
--(1002, 'Pam', 'Beasley', 30, 'Female'),
--(1003, 'Dwight', 'Schrute', 29, 'Male'),
--(1004, 'Angela', 'Martin', 31, 'Female'),
--(1005, 'Toby', 'Flenderson', 32, 'Male'),
--(1006, 'Michael', 'Scott', 35, 'Male'),
--(1007, 'Meredith', 'Palmer', 32, 'Female'),
--(1008, 'Stanley', 'Hudson', 38, 'Male'),
--(1009, 'Kevin', 'Malone', 31, 'Male')


--INSERT INTO EmployeeSalary VALUES
--(1001, 'Salesman', 45000),
--(1002, 'Receptionist', 36000),
--(1003, 'Salesman', 63000),
--(1004, 'Accountant', 47000),
--(1005, 'HR', 50000),
--(1006, 'Regional Manager', 65000),
--(1007, 'Supplier Relations', 41000),
--(1008, 'Salesman', 48000),
--(1009, 'Accountant', 42000)

INSERT INTO EmployeeDemographics VALUES
(NULL, 'Holly', 'Flax', NULL, NULL)

--INSERT INTO EmployeeSalary VALUES
--(NULL, 'Marketing', 40000)


INSERT INTO EmployeeSalary
VALUES
(2001, 'Warehouse Foreman', 52000),
(2002, 'Warehouse Worker', 40000),
(2003, 'Warehouse Worker', 42000),
(2004, 'Warehouse Worker', 41000),
(2005, 'Warehouse Associate', 39000),
(2006, 'Forklift Operator', 45000),
(2007, 'Warehouse Worker', 43000);

--DELETE FROM EmployeeSalary
--WHERE EmployeeID IN (2001, 2002, 2003, 2004, 2005, 2006, 2007);

INSERT INTO WareHouseEmployeeDemographics
VALUES
(1011, 'Darryl', 'Philbin', 35, 'Male'),
(1012, 'Lonny', 'Collins', 32, 'Male'),
(1013, 'Madge', 'Madsen', 40, 'Female'),
(1014, 'Roy', 'Anderson', 30, 'Male'),
(1015, 'Nate', 'Nickerson', 28, 'Male'),
(1016, 'Glenn', 'Shine', 45, 'Male'),
(1017, 'Hide', 'Tadanobu', 50, 'Male');



