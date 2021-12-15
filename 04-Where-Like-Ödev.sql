--Like ile ilgili ödevler...

select * from HumanResources.Employee
--HumanResources.Employee tablosunda 
--NationalIDNumber kolonunun içerisinde 96 geçen
--JobTitle deðeri Research ile baþlayan
--Cinsiyeti (Gender) M olan
--Çalýþanlarýn listesini getirin.

select * from HumanResources.Employee
where
NationalIDNumber like '%96%' and
JobTitle like 'Research%' and Gender = 'M'

select * from Sales.SalesOrderDetail
--ProductID deðeri 100 den büyük ve 1000 den küçük olan
--CarrierTrackingNumber kolonunun son iki deðeri AE olan
--Satýþ detaylarýný listeleyiniz.

select ProductID, * from Sales.SalesOrderDetail
where
ProductID > 100 and ProductID < 1000 and CarrierTrackingNumber like '%AE'

select ProductID, * from Sales.SalesOrderDetail
where
ProductID Between 100 and 1000 and CarrierTrackingNumber like '%AE' 