-- where kriteri ile öðrenmiþ olduðumuz konularý kapsayan ödevler

select * from Production.Product

--Renk deðeri Black veya Yellow olan kayýtlarýn ilk 10 tanesini gösteren sql sorgusunu yazýnýz.

select top 10 * from Production.Product
where
Color = 'Black' or Color = 'Yellow'

select top 10 * from Production.Product
where
Color = 'Black'
Union All
select top 10 * from Production.Product
where
Color = 'Yellow'

--Renk deðeri multi olan kayýtlarýn ve standartCost deðeri 6 dan büyük olanlarýnýn productID, Color, Name ve ProductNumber deðerlerini birleþtirerek getirin.

select ProductID,Color, Name + '-' + ProductNumber as [Name ProductNumber] from Production.Product
where
Color = 'Multi' and StandardCost > 6

select ProductID,Color, Name + '-' + ProductNumber from Production.Product
where
Color = 'Multi' and StandardCost > 6

--List price deðeri 0 dan büyük olan kayýtlarýn toplam adedinin %10 oranýna denk gelen kayýtlarý getirin.

select * from Production.Product
where 
ListPrice > 0

select top 50 percent * from Production.Product
where 
ListPrice > 0