--where kullanýmý

select * from Person.Person

-- person tablosunda personType deðeri EM olan kayýtlarý getir

--where
--select * from tablo_adi where sart veya sartlarýmýzý

select count (BusinessEntityID) from Person.Person
where
PersonType = 'EM' 

select * from Person.Person
where
PersonType = 'EM' 

select * from Person.Person where FirstName = 'Ken'
select * from Person.Person where FirstName = 'Ken' OR FirstName = 'Michael'

select * from Production.Product

--color kolonunda deðeri black olan kayýtlarýn name, productnumber ve color deðerlerini bana getirin.

select Name, ProductNumber, Color from Production.Product where Color = 'Black'

-- where dersi - 2

-- C# && -- SQL and ve operatörü
-- C# || -- SQL or veya operatörü

--and operatörü
select * from Production.Product
where
Color = 'Black' and SafetyStockLevel = 500 --and operatörü ile baðlanan tüm þartlar saðlanmalý

--or operatörü
select * from Production.Product
where
Color = 'Black' or SafetyStockLevel = 500 --or operatörü ile baðlanan þartlardan en az bir tanesi saðlanmalý

--where Dersi -3

-- > büyüktür

select * from Production.Product
where
SafetyStockLevel > 500

-- >= büyük veya eþittir

select * from Production.Product
where
SafetyStockLevel >= 500

-- küçüktür
select * from Production.Product
where
SafetyStockLevel < 500

-- <= küçük veya eþittit
select * from Production.Product
where
SafetyStockLevel <= 500

-- = eþittir
select * from Production.Product
where
Color = 'Black' and SafetyStockLevel = 500

-- != eþit deðildir
select * from Production.Product
where
Color = 'Black' and SafetyStockLevel != 500