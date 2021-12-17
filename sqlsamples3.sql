select 
count(ProductID),
Color,SUM(ListPrice)
from Production.Product
where productId in (select distinct ProductID from Sales.SalesOrderDetail)
group by Color 
having Color = 'black'

--select * from Production.Product  where Color = 'black'
--select * from sales.SalesOrderDetail where ProductID in (
--select ProductID from Production.Product  where Color = 'black')
--
select count(ProductID), color ,sum(listprice) from Production.Product where Color = 'black' group by color
---
select count(p.ProductID), color , sum(ListPrice) from Production.Product p right join Sales.SalesOrderDetail s 
on p.ProductID = s.ProductID 
group by Color having Color = 'black'



select Color,SUM(ListPrice) from Production.Product
where productId in (select distinct ProductID from Sales.SalesOrderDetail) AND SafetyStockLevel = '4' AND Size = 's ' and ProductID= '841'
group by Color 
having Color = 'black' 
--
select color ,sum(listprice) from Production.Product where Color = 'black' AND SafetyStockLevel = '4' AND Size = 's '  and ProductID= '841'  group by color
--
select p.color , sum( p.ListPrice) from Production.Product p right join Sales.SalesOrderDetail s 
on p.ProductID = s.ProductID 
where  SafetyStockLevel = '4' AND Size = 's '  and p.ProductID= '841' 
group by Color having Color = 'black' 

select * from sales.SalesOrderDetail where ProductID in (select ProductID from Production.Product where color = 'black' AND SafetyStockLevel = '4' AND Size = 's ' and ProductID = '841')


select ProductID , ListPrice from Production.Product where color = 'black' AND SafetyStockLevel = '4' AND Size = 's '  ORDER BY SafetyStockLevel ASC

select DISTINCT(NAME) FROM Production.Product


select ProductID from Production.Product where Color = 'black' --group by color

select distinct ProductID from Sales.SalesOrderDetail 


select 
count(ProductID),
Color,SUM(ListPrice)
from Production.Product
where productId in (select distinct ProductID from Sales.SalesOrderDetail)
group by Color 
having Color = 'black'
