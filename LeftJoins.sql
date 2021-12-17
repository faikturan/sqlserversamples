--left Join
select PP.BusinessEntityID, PP.FirstName, PP.LastName,HE.*
from
Person.Person PP left join
HumanResources.Employee HE
on PP.BusinessEntityID = HE.BusinessEntityID

select * from HumanResources.Employee
where BusinessEntityID = 293


select * from Production.Product
select * from Sales.SalesOrderDetail

select 
PP.Name,
PP.ProductID,
PP.Color,
SOD.*
from
Production.Product PP left join
Sales.SalesOrderDetail SOD 
on PP.ProductID = SOD.ProductID

select 
PP.Color,
SUM(SOD.UnitPrice) SumUnitPrice
from
Production.Product PP left join
Sales.SalesOrderDetail SOD 
on PP.ProductID = SOD.ProductID
group by PP.Color