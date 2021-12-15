--select ProductSubcategoryID from Production.Product
select ProductSubcategoryID from Production.ProductSubcategory
--select * from Production.ProductCategory

select * from Sales.Customer

SELECT * FROM Sales.vSalesPerson

SELECT  * FROM Sales.SalesPerson

select * from Sales.Store

select * from Sales.SalesOrderHeader

select * from Sales.Currency


--inner join isim soyisim toplam satýþ ve bonus
select 

SP.FirstName,SP.LastName,SPP.SalesYTD,SPP.Bonus

from 

Sales.vSalesPerson SP INNER JOIN Sales.SalesPerson SPP

ON SP.BusinessEntityID = SPP.BusinessEntityID


SELECT * FROM Sales.SalesPerson
--Left Join --ÜRÜN ADI , birim fiyat ve renkleri

select

PP.Name,SS.UnitPrice,PP.Color,pp.SafetyStockLevel

from Sales.SalesOrderDetail SS LEFT JOIN Production.Product PP


ON SS.ProductID = PP.ProductID



SELECT * FROM Sales.SalesOrderDetail

SELECT * FROM Production.Product



--Rigt Join 

select

PP.Name,SS.UnitPrice,PP.Color

from Sales.SalesOrderDetail SS RIGHT JOIN Production.Product PP


ON SS.ProductID = PP.ProductID


---FULL JOIN

select

*

from Sales.SalesOrderDetail SS FULL OUTER JOIN Production.Product PP


ON SS.ProductID = PP.ProductID

select 

--ProductID
--Name
--Color
--CategoryName
--CategorySubName
--ListPrice

select 
ProductCategoryName,
ProductSubCategoryName,
COUNT(ProductId) ProductCount,
SUM(ListPrice) as ProductListPriceSum
from
(
select
PP.ProductID,
PP.Name ProductName,
PP.Color ProductColor,
PC.Name ProductCategoryName,
PSC.Name ProductSubCategoryName,
PP.ListPrice
from Production.Product PP
left join Production.ProductSubcategory PSC
on PP.ProductSubcategoryID = PSC.ProductSubcategoryID
left join Production.ProductCategory PC
on PSC.ProductCategoryID = PC.ProductCategoryID) ResultTable
group by
ProductCategoryName,
ProductSubCategoryName
having
ProductCategoryName is not null

select * from Sales.Customer where CustomerID = '956'

select * from Sales.vIndividualCustomer --adres tablosu

select * from Sales.vStoreWithAddresses where BusinessEntityID = '956'

select PP.Name AS [ÜRÜN ADI] , PC.Name AS [KATEGORÝ ADI]
from Production.Product PP LEFT JOIN  Production.ProductSubcategory PC 
ON PP.ProductSubcategoryID = PC.ProductSubcategoryID







