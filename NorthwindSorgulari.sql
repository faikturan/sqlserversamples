select * from dbo.Products
--100 $ dan büyük ürünleri görmek istiyorum
--UnitsInStock (stok) deðeri 10'un altýnda olan ürünlerin adý, fiyatý ve stok bilgileri

Select ProductName from Products where UnitPrice > 100
select ProductName, UnitPrice, UnitsInStock from Products where UnitsInStock < 10

select * from dbo.Customers
-- Brazil'de bulunan müþterilerin Þirket Adý, TemsilciAdi, Adres, Þehir, Ülke bilgileri
--Londra'da ya da Paris'te bulunan müþterilerim
select CompanyName, ContactName, City, Country from Customers where Country = 'Brazil'
select CompanyName, ContactName, Address, City, Country  from Customers where City IN('London', 'Paris')


select * from Employees
--Adý(FirstName) 'A' harfiyle baþlayan çalýþanlarýn(Employees) Ad, Soyad ve Doðum Tarihlerini getirelim.


select FirstName, LastName, BirthDate from Employees where FirstName like 'A%'

select * from Products
--50$ ile 100$ arasýnda bulunan tüm adlarý ve fiyatlarý getirelim
select ProductName, UnitPrice from Products
where
UnitPrice >= 50 and UnitPrice <=100

--beetween belirtilen aralýktaki deðerleri getirir
select ProductName, UnitPrice from Products where UnitPrice between 50 and 100

--order by belirtilen alaný A-Z ye veya Z-A ya sýralama yapmak için kullanýrýz.

--A-Z : asc * opsiyonel default olarak zaten a-z ye doðru sýralar.
--Z-A : desc 

--Ürünlerimi en pahalýdan en ucuza doðru sýralasýn, ama stoklarýný küçükten büyüðe doðru göstersin sonuç olarak ürün adý ve fiyatýný istiyoruz.
select * from Products
select ProductName, UnitPrice, UnitsInStock from Products order by UnitPrice desc, UnitsInStock asc

--En pahalý 5 ürün dersem
select top 5 ProductName, UnitPrice, UnitsInStock from Products order by UnitPrice desc, UnitsInStock asc

--Order by
--ProductNumber içerisinde 20 sayýsý geçen kayýtlarý ProductID ye göre A-Z ye sýralayalým
use AdventureWorks2012
select * from Production.Product
where
ProductNumber like '%20%' order by ProductID

--Beetween
--ProductID 1 ile 500 arasýndaki ürünleri ProductID göre A-Z ye sýralý getirelim
select * from Production.Product
where
ProductID >= 1 and ProductID <=500 order by ProductID

select * from Production.Product
where
ProductID between 1 and 500 order by ProductID

--Group by
--Color NULL olmayan alanlarý getirelim
select * from Production.Product
where
Color is Not Null

--Color NULL olmayan alanlarý getirelim SafetyStockLevel Toplamýný ve ListPrice ortalasýný rengi Black hariç ve renkleri gruplandýrarak getirelim.

--Group by having
select Color, SUM(SafetyStockLevel) as SafetyStockLevelSum, AVG(ListPrice) as ListPriceAvg from Production.Product
where Color is Not Null
group by Color
having Color != 'Black'

select Color, SUM(SafetyStockLevel) as SafetyStockLevelSum, AVG(ListPrice) as ListPriceAvg from Production.Product
--where Color is Not Null
group by Color
having Color is not null

use NORTHWND
select * from [Order Details]
--Tüm cirom ne kadar?
select ROUND(SUM((UnitPrice*Quantity)-(UnitPrice*Quantity*Discount)),2)
from [Order Details]

--BUGÜN DOÐUMGÜNÜ OLAN ÇALIÞANLARIM KÝMLER?
SELECT * FROM Employees
where MONTH(BirthDate)=month(getdate()) and DAY(BirthDate)=day(getdate())
--SELECT GETDATE()
 
SELECT *
INTO yedek_employess 
FROM Employees

SELECT ReportsTo, * FROM yedek_employess

--UPDATE Employees SET BirthDate = '1948-12-16 00:00:00.000'
--WHERE EmployeeID ='1'

--Hangi çalýþaným hangi çalýþanýma baðlý ? (isim-isim)
--
select e.FirstName + e.LastName , em.FirstName + em.LastName from Employees e 

inner join 
Employees em

on e.EmployeeID=em.EmployeeID

select 
e.FirstName as employee,
e.EmployeeID,
rp.Title,

rp.FirstName as reports,
rp.EmployeeID
from
Employees e left join Employees rp
on e.EmployeeID = rp.ReportsTo

--çalýþanlar ne kadarlýk satýþ yapmýþlar 
select * from Employees
select * from Orders
select * from [Order Details]

select e.FirstName +' '+ e.LastName , SUM(Quantity*UnitPrice)

From Employees e 
inner join orders o 
on e.EmployeeID = o.EmployeeID
inner join [Order Details] od
on o.OrderID = od.OrderID
group by e.FirstName , e.LastName

--SELECT 
--Firstname, Lastname,
--CASE 
--WHEN YEAR(Birthdate) < 1960 then 'genç' 
--WHEN YEAR(BirthDate) > 1960 then 'yaþlý'
--else 'test'
--end 

--as YaþDurumu

 --FROM Employees 

 --hangi ülkelere satýþ yapýyorum

 select distinct Country from Customers

 select country from Customers group by Country

 --ürünlere göre satýþým nasýl ? (ürün - adet - gelir)
 select * from Products 
 select * from [Order Details]
 select 
 p.ProductName,
 SUM(o.Quantity) as Miktar,
 Round (SUM(o.Quantity*o.UnitPrice * (1-o.Discount)),2) as Gelir
 from 
 Products p 
 left join [Order Details] o 
 on p.ProductID=o.ProductID
group by p.ProductName 
ORDER BY 3 ASC -- KOLON numarasýna göre sýralar 
--ortalama satýþ miktarýnýn üzerine çýkan satýþlarým  ?  AVG
--SUBQUERY
SELECT 5+3

select * from Employees 
where YEAR(BirthDate) >(SELECT 1960)

SELECT ord.OrderID, p.ProductName,ord.UnitPrice,ord.Quantity ,ord.Discount
FROM  Products p
left join [Order Details] ord  
on p.ProductID=ord.ProductID
where ord.Quantity >(select AVG(QUANTity) from [Order Details])

--satýþlarýmý kaç günde teslim ettim ? 
select * from Orders 
select OrderID, DATEDIFF(day,orderdate,shippeddate) from Orders
--çalýþanlarýn yaþlarýný bulunuz .
select * from Employees
select FirstName , LastName , DATEDIFF(YEAR,BirthDate,GETDATE()) as yaþ from Employees
SELECT datepart(dayofyear, getdate())
select DATEDIFF(dayofyear,'2021-01-01',GETDATE())























