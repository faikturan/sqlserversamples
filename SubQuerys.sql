select PP.BusinessEntityID, PP.FirstName, PP.LastName, HE.BirthDate, HE.MaritalStatus
from
Person.Person PP inner join
HumanResources.Employee HE
on PP.BusinessEntityID = HE.BusinessEntityID

--Yukar�daki sorguda kullan�lan HE.BirthDate ve HE.MaritalStatus kolanlar� ayr� bir select sorgusu ile subquery haline getirelim BusinessEntityID ler �zerinden

select
BusinessEntityID,
FirstName,
LastName,
(select BirthDate from HumanResources.Employee where BusinessEntityID = Person.BusinessEntityID) as BirthDate,
(select MaritalStatus from HumanResources.Employee where BusinessEntityID = Person.BusinessEntityID) as MS
from Person.Person