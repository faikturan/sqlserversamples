--Like

--Geni� arama yapmam�z� sa�lar, ProductCode de�eri AB ile ba�layan kay�tlar� getir,
--i�erisinde 1290 olan kay�tlar� getir, son de�eri 9 olan kay�tlar� getir diyebiliriz.

--kolon like '%a' ba��nda ne olursa olsun sonunda a olan kay�tlar� getir.
--kolon like 'a%' ba��nda a ile ba�layan ve devam�nda ne olursa olsun bana kay�tlar� getir.
--kolon like '%a%' ba��nda ve sonunda ne olursa olsun i�erisinde a harfi ge�en t�m kay�tlar� getir.

--kolon like '_a%' ilk harfi ne olursa olsun ikinci karakteri a olan kay�tlar� getir.

--like '%a'
select ProductNumber, Name, ProductID from Production.Product
where
ProductNumber like '%1'

--like 'a%'
select ProductNumber, Name, ProductID from Production.Product
where
ProductNumber like 'b%'

--like '%a%'
select ProductNumber, Name, ProductID from Production.Product
where
ProductNumber like '%R%'

select ProductNumber, Name, ProductID from Production.Product
where
ProductNumber like '%R%1'

--like '_a'
select ProductNumber, Name, ProductID from Production.Product
where
ProductNumber like '_K-_64_-40'




