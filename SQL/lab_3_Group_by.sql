Use AdventureWorks2014

/*1. Jakie są średnie roczne zarobki pracowników [HumanResources.Employee] Adventure Works
według stanowisk? [humanresources.employeepayhistory]*/

/* w 2014 roku było 2000 h pracy */

SELECT
    hre.JobTitle,
    AVG(heph.Rate * 2000) AS AvgAnnualEarning
FROM HumanResources.Employee AS hre
JOIN HumanResources.employeepayhistory AS heph
ON heph.BusinessEntityID = hre.BusinessEntityID
GROUP BY hre.JobTitle


/*2. Jakie jest łączne zamówienie dla każdego klienta, który kupił produkty Adventure Works w
2013 roku? [Sales.SalesOrderHeader]*/

SELECT
    CustomerID,
    SUM(TotalDue) AS SumTotalDue
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2013
GROUP BY CustomerID

/*3. Ile zamówień zostało złożonych przez każdego pracownika Adventure Works?
[Sales.SalesOrderHeader]*/

SELECT
    SalesPersonID,
    pp.FirstName,
    pp.LastName,
    count(*) AS SumSalesOrder
FROM Sales.SalesOrderHeader AS ssoh
JOIN Sales.SalesPerson AS ssp
ON ssp.BusinessEntityID = ssoh.SalesPersonID
JOIN HumanResources.Employee AS hre
ON hre.BusinessEntityID = ssp.BusinessEntityID
JOIN Person.Person AS pp
ON pp.BusinessEntityID = hre.BusinessEntityID
WHERE SalesPersonID is not null
GROUP BY SalesPersonID, pp.FirstName, pp.LastName


/*4. Jaka jest łączna ilość zamówień (LineTotal) dla każdej kategorii produktów Adventure Works?
[Sales.SalesOrderDetail] [Production.Product]*/

SELECT
    ppc.Name AS CategoryName,
    SUM(ssod.LineTotal) as SumLineTotal
FROM Production.Product AS pp
LEFT JOIN Production.ProductSubcategory AS pps
ON pps.ProductSubcategoryID = pp.ProductSubcategoryID
LEFT JOIN Production.ProductCategory AS ppc
ON ppc.ProductCategoryID = pps.ProductCategoryID
LEFT JOIN Sales.SpecialOfferProduct AS ssop
ON ssop.ProductID = pp.ProductID
LEFT JOIN Sales.SalesOrderDetail AS ssod
ON ssod.ProductID = ssop.ProductID
WHERE ppc.Name is not null
Group by ppc.Name


/*5. Znajdź średnią wartość zamówienia dla każdego klienta w 2012 roku [Sales.Customer]
[Sales.SalesOrderHeader]*/

SELECT
    sc.CustomerID,
    AVG(ssoh.TotalDue) AS AvgTotalDue
FROM Sales.Customer AS sc
LEFT JOIN Sales.SalesOrderHeader AS ssoh
ON ssoh.CustomerID = sc.CustomerID
WHERE YEAR(ssoh.OrderDate) = 2012
GROUP BY sc.CustomerID
ORDER BY CustomerID


/*6. Znajdź trzy najlepiej sprzedające się produkty (w największej ilości orderqty) w 2016 roku
[Production.Product] [Sales.SalesOrderDetail] [Sales.SalesOrderHeader]*/

SELECT * FROM Production.Product
SELECT * FROM Sales.SalesOrderHeader
SELECT * FROM Sales.SalesOrderDetail

/* brak sprzedaży w 2016 roku*/

SELECT TOP 3
    pp.ProductID,
    SUM(ssod.OrderQty) AS SumOrderQty
FROM Production.Product AS pp
         JOIN Sales.SalesOrderDetail AS ssod
              ON ssod.ProductID = pp.ProductID
         JOIN Sales.SalesOrderHeader AS ssoh
              ON ssoh.SalesOrderID = ssod.SalesOrderID
WHERE YEAR(ssoh.OrderDate) = 2016
GROUP BY pp.ProductID
ORDER BY SumOrderQty DESC


/* np. 3 nalepiej sprzedające się produkty w 2011*/

SELECT TOP 3
    pp.ProductID,
    SUM(ssod.OrderQty) AS SumOrderQty
FROM Production.Product AS pp
         JOIN Sales.SalesOrderDetail AS ssod
              ON ssod.ProductID = pp.ProductID
         JOIN Sales.SalesOrderHeader AS ssoh
              ON ssoh.SalesOrderID = ssod.SalesOrderID
WHERE YEAR(ssoh.OrderDate) = 2011
GROUP BY pp.ProductID
ORDER BY SumOrderQty DESC

/*7. Znajdź średnią wartość zamówienia dla każdego kraju. Weź pod uwagę tylko klientów którzy
dokonali co najmniej 10 zamówień (subquery) [Sales.Customer] [Sales.SalesOrderHeader]*/

SELECT * FROM Sales.Customer
SELECT * FROM Sales.SalesOrderHeader
SELECT * FROM SALES.SalesTerritory

SELECT sst.TerritoryID, sst.Name AS TerritoryName, sst.CountryRegionCode, AVG(ssoh.TotalDue) AS AvgOrderValue FROM Sales.Customer AS sc
JOIN (SELECT CustomerID,
             Count(*) AS OrderQty
      FROM Sales.SalesOrderHeader
      GROUP BY CustomerID
      HAVING COUNT(*) >= 10 ) AS sub
ON sub.CustomerID = sc.CustomerID
JOIN sales.SalesOrderHeader AS ssoh
ON ssoh.CustomerID = sc.CustomerID
JOIN Sales.SalesTerritory AS sst
ON sst.TerritoryID = sc.TerritoryID
GROUP BY sst.TerritoryID, sst.Name, sst.CountryRegionCode


/*8. Znajdź 10 najlepszych klientów pod względem wartości zamówień (TotalDue)
[Sales.Customer] [Sales.SalesOrderHeader]*/

SELECT * FROM Sales.Customer
SELECT * FROM Sales.SalesOrderHeader

SELECT TOP 10
    sc.CustomerID,
    SUM(ssoh.TotalDue) as SumTotalDue
FROM Sales.Customer AS sc
JOIN Sales.SalesOrderHeader AS ssoh
ON ssoh.CustomerID = sc.CustomerID
GROUP BY sc.CustomerID
ORDER BY  SumTotalDue DESC


/*9. Napisz zapytanie, aby znaleźć 5 najlepszych sprzedawców z najwyższą średnią kwotą
sprzedaży na zamówienie, i uwzględnij ich Imię, Nazwisko i średnią kwotę sprzedaży na
zamówienie. Uporządkuj wyniki według średniej wielkości sprzedaży na zamówienie w
kolejności malejącej [Sales.SalesPerson] [Sales.SalesOrderHeader] [Sales.SalesOrderDetail]*/

SELECT * FROM Sales.SalesPerson
SELECT * FROM Sales.SalesOrderHeader
SELECT * FROM Sales.SalesOrderDetail

SELECT TOP 5
    ssp.BusinessEntityID,
    pp.FirstName,
    pp.LastName,
    AVG(ssod.LineTotal) AS AvgOrderAmount
FROM Sales.SalesPerson AS ssp
JOIN Sales.SalesOrderHeader AS ssoh
ON ssoh.SalesPersonID = ssp.BusinessEntityID
JOIN HumanResources.Employee as hre
ON hre.BusinessEntityID = ssp.BusinessEntityID
JOIN Person.Person AS pp
ON pp.BusinessEntityID = hre.BusinessEntityID
JOIN sales.SalesOrderDetail AS ssod
ON ssod.SalesOrderID = ssoh.SalesOrderID
GROUP BY ssp.BusinessEntityID, pp.FirstName, pp.LastName
ORDER BY AvgOrderAmount DESC


/*10. Napisz zapytanie, aby znaleźć 10 najlepszych produktów o najwyższej łącznej wartości
sprzedaży i podaj nazwę produktu, kategoria produktu i łączna kwota sprzedaży. Posortuj
wyniki według łącznej kwoty sprzedaży w kolejności malejącej [Production.Product]
[Production.ProductSubcategory] [Sales.SalesOrderDetail]*/

SELECT * FROM Production.Product
SELECT * FROM Production.ProductSubcategory
SELECT * FROM Sales.SalesOrderDetail

SELECT TOP 10
    pp.ProductID,
    pp.Name AS ProductName,
    ppc.Name AS CategoryName,
    SUM(ssod.LineTotal) AS SumOrderAmount
FROM Production.Product AS pp
JOIN Production.ProductSubcategory AS pps
ON pps.ProductSubcategoryID = pp.ProductSubcategoryID
JOIN Production.ProductCategory AS ppc
ON ppc.ProductCategoryID = pps.ProductCategoryID
JOIN Sales.SpecialOfferProduct AS ssop
ON ssop.ProductID = pp.ProductID
JOIN Sales.SalesOrderDetail AS ssod
ON ssod.ProductID = ssop.ProductID
GROUP BY pp.ProductID, pp.Name, ppc.Name
ORDER BY SumOrderAmount DESC