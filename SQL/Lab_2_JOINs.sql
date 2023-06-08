USE AdventureWorks2014

/* 1. Wybierz nazwę produktu i cenę katalogową dla wszystkich produktów w tabeli
[Production.Product] i dołącz nazwę kategorii produktów [Production.ProductCategory]*/

SELECT
    pp.Name AS ProductName,
    pp.ListPrice,
    ISNULL(ppc.Name,'No category') AS CategoryName
FROM Production.Product AS pp
LEFT JOIN Production.ProductSubcategory AS pps
ON pps.ProductSubcategoryID = pp.ProductSubcategoryID
LEFT JOIN Production.ProductCategory AS ppc
ON ppc.ProductCategoryID = pps.ProductCategoryID


/*2. Wybierz imię, nazwisko i adres e-mail dla wszystkich pracowników w
[HumanResources.Employee] i podaj nazwy działu z tabeli [HumanResources.Department]*/

SELECT
    pp.FirstName,
    pp.LastName,
    pea.EmailAddress,
    hrd.Name AS DepartmentName
FROM HumanResources.Employee AS hr
LEFT JOIN Person.Person AS pp
ON pp.BusinessEntityID = hr.BusinessEntityID
LEFT JOIN Person.EmailAddress AS pea
ON pea.BusinessEntityID = pp.BusinessEntityID
LEFT JOIN HumanResources.EmployeeDepartmentHistory AS edh
ON edh.BusinessEntityID = hr.BusinessEntityID
LEFT JOIN HumanResources.Department AS hrd
ON hrd.DepartmentID = edh.DepartmentID


/* lub przy użyciu zwykłego JOIN --> wynik ten sam,
   bezpieczniejsze zastosowanie będzie LEFT JOIN  */

SELECT
    pp.FirstName,
    pp.LastName,
    pea.EmailAddress,
    hrd.Name AS DepartmentName
FROM HumanResources.Employee AS hr
JOIN Person.Person AS pp
ON pp.BusinessEntityID = hr.BusinessEntityID
JOIN Person.EmailAddress AS pea
ON pea.BusinessEntityID = pp.BusinessEntityID
JOIN HumanResources.EmployeeDepartmentHistory AS edh
ON edh.BusinessEntityID = hr.BusinessEntityID
JOIN HumanResources.Department AS hrd
ON hrd.DepartmentID = edh.DepartmentID


/*3. Wybierz datę zamówienia, nazwa klienta (Imię + Nazwisko) i sumę należności dla wszystkich
zamówień w tabeli [Sales.SalesOrderHeader], i podaj nazwę obszaru sprzedaży z tabeli
[Sales.SalesTerritory]*/

SELECT
    ssoh.SalesOrderID,
    ssoh.OrderDate,
    pp.FirstName + ' ' +pp.LastName AS FullNameCustomer,
    ssoh.SubTotal,
    sst.Name AS TerritoryName,
    sst.CountryRegionCode
FROM Sales.SalesOrderHeader AS ssoh
LEFT JOIN Sales.Customer AS	sc
ON sc.CustomerID = ssoh.CustomerID
JOIN Person.Person AS pp
ON pp.BusinessEntityID = sc.PersonID
JOIN Sales.SalesTerritory AS sst
ON sst.TerritoryID = sc.TerritoryID


/*4. Pobierz listę wszystkich klientów i odpowiadające im zamówienia sprzedaży [Sales.Customer]
[Sales.SalesOrderHeader]*/

SELECT
    sc.CustomerID,
    ISNULL(CONVERT(varchar, ssoh.SalesOrderID),'brak zamówień') AS SalesOrderID
FROM Sales.Customer AS sc
LEFT JOIN Sales.SalesOrderHeader AS ssoh
ON ssoh.CustomerID = sc.CustomerID


/*5. Wybierz Imię i Nazwisko wszystkich klientów [Sales.Customer] wraz z ich adresami e-mail
[Person.EmailAddress]*/

SELECT
    SC.CustomerID,
    ISNULL(pp.FirstName, 'brak') AS FirstName,
    ISNULL(pp.LastName, 'brak') AS LastName,
    ISNULL(pea.EmailAddress, 'brak') AS EmailAddress
FROM Sales.Customer AS SC
LEFT JOIN Person.Person AS pp
ON pp.BusinessEntityID = SC.PersonID
LEFT JOIN Person.EmailAddress AS PEA
ON PEA.BusinessEntityID = PP.BusinessEntityID


/*6. Pobierz listę wszystkich zamówień sprzedaży [Sales.SalesOrderHeader] oraz odpowiadających
im klientów [Sales.Customer] do wyniku załącz adresy [Person.Address]*/

SELECT
    ssoh.SalesOrderID,
    ssoh.OrderDate,
    sc.CustomerID,
    pa.AddressLine1,
    ISNULL(pa.AddressLine2, 'brak') AS AddressLine2,
    pa.City,
    pa.PostalCode,
    pa.StateProvinceID
FROM Sales.SalesOrderHeader AS ssoh
LEFT JOIN Sales.Customer AS sc
ON sc.CustomerID = ssoh.CustomerID
LEFT JOIN Person.Address AS pa
ON pa.AddressID = ssoh.BillToAddressID


/*7. Wybierz wszystkich pracowników [HumanResources.Employee] wraz z nazwami
departamentów. [humanresources.department]. Posortuj dane po Nazwisku malejąco i Sart
Date rosnąco*/

SELECT
    hre.BusinessEntityID,
    pp.FirstName,
    pp.LastName,
    hrd.Name AS DepartmentName,
    hrdh.StartDate
FROM HumanResources.Employee AS hre
LEFT JOIN HumanResources.EmployeeDepartmentHistory AS hrdh
ON hrdh.BusinessEntityID = hre.BusinessEntityID
LEFT JOIN HumanResources.Department AS hrd
ON hrd.DepartmentID = hrdh.DepartmentID
LEFT JOIN Person.Person AS pp
ON pp.BusinessEntityID = hre.BusinessEntityID
ORDER BY pp.LastName DESC, hrdh.StartDate


/*8. Wybierz wszystkie nazwy produktów [Production.Product] wraz z ich dostawcami (tylko
nazwa) [Purchasing.Vendor]*/

SELECT
    pp.ProductID,
    pp.Name AS ProductName,
    ISNULL(CONVERT(varchar, pv.BusinessEntityID), 'brak'),
    ISNULL(pv.Name, 'brak') AS SupplierName
FROM Production.Product AS pp
LEFT JOIN Purchasing.ProductVendor AS ppv
ON ppv.ProductID = pp.ProductID
LEFT JOIN Purchasing.Vendor AS pv
ON pv.BusinessEntityID = ppv.BusinessEntityID

select * from Purchasing.ProductVendor
where ProductID = 350

/*9. Wybierz wszystkie zamówienia pracowników [humanresources.employee] o imieniu
zaczynającym się na 'E' oraz metodzie dostawy zawierającej 'OVER' [purchasing.shipmethod]*/

SELECT
    pp.FirstName AS FirstName,
    ssoh.SalesOrderID AS SalesOrderID,
    psm.Name AS ShipMethodName
FROM HumanResources.Employee AS hre
LEFT JOIN Sales.SalesPerson AS ssp
ON ssp.BusinessEntityID = hre.BusinessEntityID
LEFT JOIN Sales.SalesOrderHeader AS ssoh
ON ssoh.SalesPersonID = ssp.BusinessEntityID
LEFT JOIN Purchasing.ShipMethod AS psm
ON psm.ShipMethodID = ssoh.ShipMethodID
LEFT JOIN Person.Person AS pp
ON pp.BusinessEntityID = hre.BusinessEntityID
WHERE pp.FirstName LIKE 'E%' AND psm.Name LIKE '%OVER%'


/*10. Wybierz wszystkie zamówienia [Sales.SalesOrderHeader] wraz z danymi o pracownikach
odpowiedzialnych za ich obsługę [HumanResources.Employee]*/

SELECT
    SalesOrderID,
    SalesPersonID,
    pp.FirstName,
    pp.LastName,
    hre.JobTitle
FROM sales.SalesOrderHeader AS ssoh
JOIN Sales.SalesPerson AS ssp
ON ssp.BusinessEntityID = ssoh.SalesPersonID
LEFT JOIN HumanResources.Employee AS hre
ON hre.BusinessEntityID = ssp.BusinessEntityID
LEFT JOIN Person.Person AS pp
ON pp.BusinessEntityID = hre.BusinessEntityID


/* Albo wszystkie zamówienia, gdzie większość jest bez danych sprzedawcy*/

SELECT
    SalesOrderID,
    ISNULL(CONVERT(varchar, ssoh.SalesPersonID),'brak'),
    ISNULL(pp.FirstName,'brak'),
    ISNULL(pp.LastName,'brak'),
    ISNULL(hre.JobTitle,'brak')
FROM sales.SalesOrderHeader AS ssoh
LEFT JOIN Sales.SalesPerson AS ssp
ON ssp.BusinessEntityID = ssoh.SalesPersonID
LEFT JOIN HumanResources.Employee AS hre
ON hre.BusinessEntityID = ssp.BusinessEntityID
LEFT JOIN Person.Person AS pp
ON pp.BusinessEntityID = hre.BusinessEntityID


/*11. Wybierz wszystkie produkty [Production.Product] z kategorii "Clothing"
[production.productcategory] wraz z danymi o dostawcach[Purchasing.Vendor]*/

SELECT
    pp.ProductID,
    pp.Name AS ProductName,
    ppc.Name AS CategoryName,
    pv.BusinessEntityID AS VendorID,
    pv.Name AS VendorName
FROM Production.Product AS pp
JOIN Production.ProductSubcategory AS pps
ON pps.ProductSubcategoryID = pp.ProductSubcategoryID
JOIN Production.ProductCategory AS ppc
ON ppc.ProductCategoryID = pps.ProductCategoryID
JOIN Purchasing.ProductVendor AS ppv
ON ppv.ProductID = pp.ProductID
JOIN Purchasing.Vendor AS pv
ON pv.BusinessEntityID = ppv.BusinessEntityID
WHERE ppc.Name = 'Clothing'


/*12. Wybierz wszystkie zamówienia złożone w 2008 roku wraz z danymi o klientach.
[Sales.SalesOrderHeader] [Sales.Customer]*/

SELECT
    ssoh.SalesOrderID AS SalesOrderID,
    ssoh.OrderDate,
    sc.CustomerID,
    pp.*
FROM Sales.SalesOrderHeader AS ssoh
LEFT JOIN Sales.Customer AS sc
ON sc.CustomerID = ssoh.CustomerID
LEFT JOIN Person.Person AS pp
ON pp.BusinessEntityID = sc.PersonID
WHERE YEAR(ssoh.OrderDate) = 2008


/*13. Wybierz wszystkie produkty [Production.Product] z ceną detaliczną (ListPrice) większą niż 25
dolarów wraz z danymi o dostawcach [Purchasing.Vendor]. Posortuj wyniki po cenie malejąco*/

SELECT
    pp.ProductID,
    pp.Name AS ProductName,
    pp.ListPrice,
    ISNULL(CONVERT(varchar,pv.BusinessEntityID),'brak') AS VendorID,
    ISNULL(pv.Name,'brak') AS VendorName
FROM Production.Product AS pp
LEFT JOIN Purchasing.ProductVendor AS ppv
ON ppv.ProductID = pp.ProductID
LEFT JOIN Purchasing.Vendor AS pv
ON pv.BusinessEntityID = ppv.BusinessEntityID
WHERE pp.ListPrice > 25
ORDER BY pp.ListPrice DESC



/*Tam gdzie są dane dostawców */

SELECT
    pp.ProductID,
    pp.Name AS ProductName,
    pp.ListPrice,
    pv.BusinessEntityID AS VendorID,
    pv.Name AS VendorName
FROM Production.Product AS pp
JOIN Purchasing.ProductVendor AS ppv
ON ppv.ProductID = pp.ProductID
JOIN Purchasing.Vendor AS pv
ON pv.BusinessEntityID = ppv.BusinessEntityID
WHERE pp.ListPrice > 25
ORDER BY pp.ListPrice DESC


