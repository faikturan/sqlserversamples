select * from dbo.Products
--100 $ dan b�y�k �r�nleri g�rmek istiyorum
--UnitsInStock (stok) de�eri 10'un alt�nda olan �r�nlerin ad�, fiyat� ve stok bilgileri

Select ProductName from Products where UnitPrice > 100
select ProductName, UnitPrice, UnitsInStock from Products where UnitsInStock < 10

select * from dbo.Customers
-- Brazil'de bulunan m��terilerin �irket Ad�, TemsilciAdi, Adres, �ehir, �lke bilgileri
--Londra'da ya da Paris'te bulunan m��terilerim
select CompanyName, ContactName, City, Country from Customers where Country = 'Brazil'
select CompanyName, ContactName, Address, City, Country  from Customers where City IN('London', 'Paris')


select * from Employees
--Ad�(FirstName) 'A' harfiyle ba�layan �al��anlar�n(Employees) Ad, Soyad ve Do�um Tarihlerini getirelim.


select FirstName, LastName, BirthDate from Employees where FirstName like 'A%'

select * from Products
--50$ ile 100$ aras�nda bulunan t�m adlar� ve fiyatlar� getirelim
select ProductName, UnitPrice from Products
where
UnitPrice >= 50 and UnitPrice <=100

--beetween belirtilen aral�ktaki de�erleri getirir
select ProductName, UnitPrice from Products where UnitPrice between 50 and 100

--order by belirtilen alan� A-Z ye veya Z-A ya s�ralama yapmak i�in kullan�r�z.

--A-Z : asc * opsiyonel default olarak zaten a-z ye do�ru s�ralar.
--Z-A : desc 

--�r�nlerimi en pahal�dan en ucuza do�ru s�ralas�n, ama stoklar�n� k���kten b�y��e do�ru g�stersin sonu� olarak �r�n ad� ve fiyat�n� istiyoruz.
select * from Products
select ProductName, UnitPrice, UnitsInStock from Products order by UnitPrice desc, UnitsInStock asc

--En pahal� 5 �r�n dersem
select top 5 ProductName, UnitPrice, UnitsInStock from Products order by UnitPrice desc, UnitsInStock asc

--Order by
--ProductNumber i�erisinde 20 say�s� ge�en kay�tlar� ProductID ye g�re A-Z ye s�ralayal�m
use AdventureWorks2012
select * from Production.Product
where
ProductNumber like '%20%' order by ProductID

--Beetween
--ProductID 1 ile 500 aras�ndaki �r�nleri ProductID g�re A-Z ye s�ral� getirelim
select * from Production.Product
where
ProductID >= 1 and ProductID <=500 order by ProductID

select * from Production.Product
where
ProductID between 1 and 500 order by ProductID

--Group by
--Color NULL olmayan alanlar� getirelim
select * from Production.Product
where
Color is Not Null

--Color NULL olmayan alanlar� getirelim SafetyStockLevel Toplam�n� ve ListPrice ortalas�n� rengi Black hari� ve renkleri grupland�rarak getirelim.

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
--T�m cirom ne kadar?
select ROUND(SUM((UnitPrice*Quantity)-(UnitPrice*Quantity*Discount)),2)
from [Order Details]

--BUG�N DO�UMG�N� OLAN �ALI�ANLARIM K�MLER?
SELECT * FROM Employees
where MONTH(BirthDate)=month(getdate()) and DAY(BirthDate)=day(getdate())
--SELECT GETDATE()
 
SELECT *
INTO yedek_employess 
FROM Employees

SELECT ReportsTo, * FROM yedek_employess

--UPDATE Employees SET BirthDate = '1948-12-16 00:00:00.000'
--WHERE EmployeeID ='1'

--Hangi �al��an�m hangi �al��an�ma ba�l� ? (isim-isim)
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

--�al��anlar ne kadarl�k sat�� yapm��lar 
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
--WHEN YEAR(Birthdate) < 1960 then 'gen�' 
--WHEN YEAR(BirthDate) > 1960 then 'ya�l�'
--else 'test'
--end 

--as Ya�Durumu

 --FROM Employees 

 --hangi �lkelere sat�� yap�yorum

 select distinct Country from Customers

 select country from Customers group by Country

 --�r�nlere g�re sat���m nas�l ? (�r�n - adet - gelir)
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
ORDER BY 3 ASC -- KOLON numaras�na g�re s�ralar 
--ortalama sat�� miktar�n�n �zerine ��kan sat��lar�m  ?  AVG
--SUBQUERY
SELECT 5+3

select * from Employees 
where YEAR(BirthDate) >(SELECT 1960)

SELECT ord.OrderID, p.ProductName,ord.UnitPrice,ord.Quantity ,ord.Discount
FROM  Products p
left join [Order Details] ord  
on p.ProductID=ord.ProductID
where ord.Quantity >(select AVG(QUANTity) from [Order Details])

--sat��lar�m� ka� g�nde teslim ettim ? 
select * from Orders 
select OrderID, DATEDIFF(day,orderdate,shippeddate) from Orders
--�al��anlar�n ya�lar�n� bulunuz .
select * from Employees
select FirstName , LastName , DATEDIFF(YEAR,BirthDate,GETDATE()) as ya� from Employees
SELECT datepart(dayofyear, getdate())
select DATEDIFF(dayofyear,'2021-01-01',GETDATE())























