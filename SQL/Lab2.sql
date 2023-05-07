USE AdventureWorks2014

/*1*/

SELECT P.Name , P.ListPrice, PP.Name AS Category FROM Production.Product AS P
JOIN Production.ProductSubcategory AS PPS
ON PPS.ProductSubcategoryID = P.ProductSubcategoryID
JOIN  Production.ProductCategory AS PP
ON PP.ProductCategoryID = PPS.ProductSubcategoryID

/*2*/

SELECT * FROM HumanResources.Employee AS he
    JOIN Person.Person AS pp ON pp. BusinessEntityID = he.b
SELECT * FROM HumanResources.Department