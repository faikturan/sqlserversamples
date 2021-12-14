--Like

--Geniþ arama yapmamýzý saðlar, ProductCode deðeri AB ile baþlayan kayýtlarý getir,
--içerisinde 1290 olan kayýtlarý getir, son deðeri 9 olan kayýtlarý getir diyebiliriz.

--kolon like '%a' baþýnda ne olursa olsun sonunda a olan kayýtlarý getir.
--kolon like 'a%' baþýnda a ile baþlayan ve devamýnda ne olursa olsun bana kayýtlarý getir.
--kolon like '%a%' baþýnda ve sonunda ne olursa olsun içerisinde a harfi geçen tüm kayýtlarý getir.

--kolon like '_a%' ilk harfi ne olursa olsun ikinci karakteri a olan kayýtlarý getir.

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




