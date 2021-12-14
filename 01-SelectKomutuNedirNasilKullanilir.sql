use AdventureWorks2012 --DB kullan�m� i�in TSQL k�sm�nda Use komutunu kullanabiliriz.

--Select : Tablolar�m�z�n i�erisindeki datalara ula�mam�z� sa�layan komut
--select kolonlar�m�z�n isimleri / * from tablo_ad�

select * from Person.Person -- tablonun i�erisinde bulunan t�m kolonlar� bize getirir

select
BusinessEntityID,
PersonType,
FirstName,
LastName
from Person.Person

-- �dev : Production.Product

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
