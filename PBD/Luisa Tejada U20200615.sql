--Tarea programación de base de datos
--Luisa Eunice Álvarez Tejada
--U2000615

USE AdventureWorks2022
GO
-- Ejercicio 1:
SELECT * FROM HumanResources.Department
GO
-- Ejercicio 2: 
SELECT GroupName FROM HumanResources.Department GROUP BY GroupName
GO

--Ejercicio 3:
SELECT * FROM HumanResources.Department ORDER BY DepartmentID DESC
GO

--Ejercicio 4:
SELECT * FROM HumanResources.Department ORDER BY DepartmentID ASC
GO
--Ejercicio 5:
SELECT Persona.BusinessEntityID, Persona.FirstName, Persona.LastName FROM HumanResources.Employee Empleado 
INNER JOIN Person.Person Persona ON Empleado.BusinessEntityID = Persona.BusinessEntityID
GO

--Ejercicio 6:
SELECT Empleado.BusinessEntityID, Persona.FirstName, Empleado.Gender FROM HumanResources.Employee Empleado 
INNER JOIN Person.Person Persona ON Empleado.BusinessEntityID = Persona.BusinessEntityID
WHERE Empleado.Gender = 'M'
GO

-- Ejercicio 7:
SELECT Empleado.BusinessEntityID, Persona.FirstName, Empleado.OrganizationLevel FROM HumanResources.Employee Empleado 
INNER JOIN Person.Person Persona ON Empleado.BusinessEntityID = Persona.BusinessEntityID
WHERE Empleado.OrganizationLevel > 3
GO

--Ejercicio 8:
SELECT Empleado.BusinessEntityID, Persona.FirstName, Empleado.OrganizationLevel FROM HumanResources.Employee Empleado 
INNER JOIN Person.Person Persona ON Empleado.BusinessEntityID = Persona.BusinessEntityID
WHERE (Empleado.OrganizationLevel > 2 OR Empleado.OrganizationLevel = 2) AND Empleado.Gender = 'F'
GO

-- Ejercicio 9
SELECT Empleado.BusinessEntityID, Persona.FirstName, Empleado.NationalIDNumber, Empleado.JobTitle FROM HumanResources.Employee Empleado 
INNER JOIN Person.Person Persona ON Empleado.BusinessEntityID = Persona.BusinessEntityID
WHERE Empleado.JobTitle = 'Marketing Assistant' OR Empleado.JobTitle = 'Design Engineer'
GO

-- Ejercicio 10:
SELECT BusinessEntityID, BirthDate FROM HumanResources.Employee 
WHERE BirthDate BETWEEN '1969-1-1' AND '1972-12-31'
GO

--Ejercicio 11:
SELECT BusinessEntityID, VacationHours, (VacationHours * 8.00) AS 'Total a pagar' FROM HumanResources.Employee 
GO

--Ejercicio 12:
SELECT ProductCategoryID, COUNT(ProductSubcategoryID) AS 'Cantidad' FROM Production.ProductSubcategory GROUP BY ProductCategoryID
GO

--Ejercicio 13:
SELECT TerritoryID, COUNT(CustomerID) AS 'Cantidad' FROM Sales.Customer GROUP BY TerritoryID
GO

--Ejercicio 14: 
SELECT CustomerID, SUM(SubTotal) AS 'Suma Total' FROM Sales.SalesOrderHeader WHERE CustomerID = '29825' GROUP BY CustomerID
GO
--Ejercicio 15:
SELECT CardType, COUNT(CreditCardID) AS 'Tarjetas registradas' FROM Sales.CreditCard GROUP BY CardType
GO

--Ejercicio 16:
SELECT LineTotal AS "Compra", 
CASE WHEN LineTotal > 2000 THEN LineTotal * 0.82
WHEN LineTotal > 1500 THEN LineTotal * 0.86 WHEN LineTotal > 1000 THEN LineTotal * 0.90
ELSE LineTotal
END AS "Total a pagar"
FROM Sales.SalesOrderDetail
GO