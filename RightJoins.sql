--Right Join

select * from Sales.SalesPerson
select * from Person.Person

select
SSP.BusinessEntityID,
SSP.Bonus,
PP.FirstName,
PP.LastName,
PP.BusinessEntityID
from 
Sales.SalesPerson SSP
right join Person.Person PP
on SSP.BusinessEntityID = PP.BusinessEntityID

select * from Sales.SalesPerson
where
BusinessEntityID = 295