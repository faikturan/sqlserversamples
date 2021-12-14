-- where kriteri ile ��renmi� oldu�umuz konular� kapsayan �devler

select * from Production.Product

--Renk de�eri Black veya Yellow olan kay�tlar�n ilk 10 tanesini g�steren sql sorgusunu yaz�n�z.

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

--Renk de�eri multi olan kay�tlar�n ve standartCost de�eri 6 dan b�y�k olanlar�n�n productID, Color, Name ve ProductNumber de�erlerini birle�tirerek getirin.

select ProductID,Color, Name + '-' + ProductNumber as [Name ProductNumber] from Production.Product
where
Color = 'Multi' and StandardCost > 6

select ProductID,Color, Name + '-' + ProductNumber from Production.Product
where
Color = 'Multi' and StandardCost > 6

--List price de�eri 0 dan b�y�k olan kay�tlar�n toplam adedinin %10 oran�na denk gelen kay�tlar� getirin.

select * from Production.Product
where 
ListPrice > 0

select top 50 percent * from Production.Product
where 
ListPrice > 0