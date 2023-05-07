Use AdventureWorks2014
/*1*/

SELECT * FROM Production.Product

/*2*/

SELECT ProductID, Name, ListPrice FROM Production.Product

/*3*/

SELECT ProductID, Name, ListPrice FROM Production.Product
ORDER BY ListPrice DESC

/*4*/

SELECT Name, StandardCost, ListPrice FROM Production.Product
WHERE ListPrice >= 500

/*5*/

SELECT Name, Color FROM Production.Product
WHERE Color = 'Red'
ORDER BY Name

/*6*/

SELECT FirstName, LastName, MiddleName FROM Person.Person
ORDER BY LastName, FirstName

/*7*/

SELECT BusinessEntityID, HireDate, JobTitle FROM HumanResources.Employee
WHERE JobTitle = 'Sales Representative'
ORDER BY BusinessEntityID, HireDate

/*8*/

SELECT Name, ListPrice FROM Production.Product
WHERE ListPrice BETWEEN 500 AND 1000
ORDER BY ListPrice

/*9*/

SELECT Name, Color, Size FROM Production.Product
WHERE Color = 'Black' AND Size = 'M'
ORDER BY Name

/*10*/

SELECT BusinessEntityID, HireDate FROM HumanResources.Employee
WHERE HireDate LIKE '2010%'
ORDER BY HireDate

/*11*/

SELECT TerritoryID FROM Sales.SalesTerritory
WHERE Name= 'germany'

SELECT CustomerID FROM Sales.Customer
WHERE TerritoryID = 8
ORDER BY PersonID

SELECT CustomerID FROM Sales.Customer
WHERE TerritoryID = (SELECT TerritoryID FROM Sales.SalesTerritory
                    WHERE Name= 'germany')
ORDER BY PersonID

SELECT * FROM SALES.Customer
SELECT * FROM Sales.SalesTerritory

SELECT c.CustomerID, ss.Name FROM Sales.SalesTerritory as ss
JOIN Sales.Customer c on ss.TerritoryID = c.TerritoryID
WHERE ss.Name = 'germany'
ORDER BY C.PersonID

