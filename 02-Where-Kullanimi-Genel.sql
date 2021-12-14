--where kullan�m�

select * from Person.Person

-- person tablosunda personType de�eri EM olan kay�tlar� getir

--where
--select * from tablo_adi where sart veya sartlar�m�z�

select count (BusinessEntityID) from Person.Person
where
PersonType = 'EM' 

select * from Person.Person
where
PersonType = 'EM' 

select * from Person.Person where FirstName = 'Ken'
select * from Person.Person where FirstName = 'Ken' OR FirstName = 'Michael'

select * from Production.Product

--color kolonunda de�eri black olan kay�tlar�n name, productnumber ve color de�erlerini bana getirin.

select Name, ProductNumber, Color from Production.Product where Color = 'Black'

-- where dersi - 2

-- C# && -- SQL and ve operat�r�
-- C# || -- SQL or veya operat�r�

--and operat�r�
select * from Production.Product
where
Color = 'Black' and SafetyStockLevel = 500 --and operat�r� ile ba�lanan t�m �artlar sa�lanmal�

--or operat�r�
select * from Production.Product
where
Color = 'Black' or SafetyStockLevel = 500 --or operat�r� ile ba�lanan �artlardan en az bir tanesi sa�lanmal�

--where Dersi -3

-- > b�y�kt�r

select * from Production.Product
where
SafetyStockLevel > 500

-- >= b�y�k veya e�ittir

select * from Production.Product
where
SafetyStockLevel >= 500

-- k���kt�r
select * from Production.Product
where
SafetyStockLevel < 500

-- <= k���k veya e�ittit
select * from Production.Product
where
SafetyStockLevel <= 500

-- = e�ittir
select * from Production.Product
where
Color = 'Black' and SafetyStockLevel = 500

-- != e�it de�ildir
select * from Production.Product
where
Color = 'Black' and SafetyStockLevel != 500