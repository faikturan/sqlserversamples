-- Inner Join : Ýki veya daha fazla tabloyu birleþtirir.

-- select * from tablo_1 inner join table_2 on tablo_1.kolonadi = tablo_2.kolonadi

select * from Person.Person
select * from HumanResources.Employee

--inner join kullanýmý

select
PP.BusinessEntityID,
PP.FirstName,
PP.LastName,
PP.PersonType,
HRE.BirthDate,
HRE.JobTitle,
HRE.MaritalStatus
from Person.Person as PP
inner join HumanResources.Employee as HRE
on PP.BusinessEntityID = HRE.BusinessEntityID


