use AdventureWorks2012 --DB kullanýmý için TSQL kýsmýnda Use komutunu kullanabiliriz.

--Select : Tablolarýmýzýn içerisindeki datalara ulaþmamýzý saðlayan komut
--select kolonlarýmýzýn isimleri / * from tablo_adý

select * from Person.Person -- tablonun içerisinde bulunan tüm kolonlarý bize getirir

select
BusinessEntityID,
PersonType,
FirstName,
LastName
from Person.Person

-- Ödev : Production.Product

--Name
--ProductNumber
--Color
--ProductID

select
Name,
ProductNumber,
Color,
ProductID
from Production.Product
