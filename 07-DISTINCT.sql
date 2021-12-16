--ürünleri renklerini bulunuz distinct ile 
select distinct (Color)  from Production.Product where color is not null
-- satýþý olan ürünler ?? 
select ProductID,ProductNumber,Name,Color from Production.Product 
where ProductID in ( select  distinct ProductID from Sales.SalesOrderDetail  )
--renklerin toplam satýþ fiyatlarý
select Color,SUM(ListPrice) from Production.Product
where productId in (select distinct ProductID from Sales.SalesOrderDetail)
group by Color 
having Color = 'black'--
select color ,sum(listprice) from Production.Product where Color = 'black' group by color---
select color , sum(ListPrice) from Production.Product p right join Sales.SalesOrderDetail s 
on p.ProductID = s.ProductID 
group by Color having Color = 'black'