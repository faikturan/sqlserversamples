--Like ile ilgili �devler...

select * from HumanResources.Employee
--HumanResources.Employee tablosunda 
--NationalIDNumber kolonunun i�erisinde 96 ge�en
--JobTitle de�eri Research ile ba�layan
--Cinsiyeti (Gender) M olan
--�al��anlar�n listesini getirin.

select * from HumanResources.Employee
where
NationalIDNumber like '%96%' and
JobTitle like 'Research%' and Gender = 'M'

select * from Sales.SalesOrderDetail
--ProductID de�eri 100 den b�y�k ve 1000 den k���k olan
--CarrierTrackingNumber kolonunun son iki de�eri AE olan
--Sat�� detaylar�n� listeleyiniz.

select ProductID, * from Sales.SalesOrderDetail
where
ProductID > 100 and ProductID < 1000 and CarrierTrackingNumber like '%AE'

select ProductID, * from Sales.SalesOrderDetail
where
ProductID Between 100 and 1000 and CarrierTrackingNumber like '%AE' 