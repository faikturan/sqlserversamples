create table Personeller
(
id int primary key,
isim nvarchar(50),
soyisim nvarchar(50),
emailAdres nvarchar(50),
olusturmaTarih datetime,
degistirmeTarih datetime,
silindimi bit
)

---StoreProcedure öncesi..
insert into Personeller values(1, 'Faik', 'Turan','bilgi@faikturan.com.tr', GETDATE(),null, 0)

--create proc procedure_adi
--(
-----Parametreli veya Parametrelerimiz.
--@id int,
--@isim nvarchar(50)
--)
--as
--begin
----procedure body
--end

create proc PersonelKayitEkle
(
@id int,
@isim nvarchar(50),
@soyisim nvarchar(50),
@emailAdres nvarchar(50)
)
as
begin

insert into Personeller (id,isim,soyisim,emailAdres,olusturmaTarih,silindimi) values 
(@id,@isim,@soyisim,@emailAdres,GETDATE(),0)
end


exec PersonelKayitEkle @id=2,@isim='Ali',@soyisim='Gel',@emailAdres='bilgi@aligel.com.tr'


---------------------------------------------------

alter proc PersonelKayitEkle
(
@id int,
@isim nvarchar(50),
@soyisim nvarchar(50),
@emailAdres nvarchar(50)
)
as
begin

insert into Personeller (id,isim,soyisim,emailAdres,olusturmaTarih,degistirmeTarih, silindimi) values 
(@id,@isim,@soyisim,@emailAdres,GETDATE(),getdate(),0)
end

drop proc PersonelKayitEkle

----------------Encrytion ile þifreleme

create proc PersonelKayitEkle
(
@id int,
@isim nvarchar(50),
@soyisim nvarchar(50),
@emailAdres nvarchar(50)
)
with encryption
as
begin

insert into Personeller (id,isim,soyisim,emailAdres,olusturmaTarih,silindimi) values 
(@id,@isim,@soyisim,@emailAdres,GETDATE(),0)
end

-------------------------
create proc PersonelGetir
as
begin
select * from Personeller
end

exec PersonelGetir

--------------------------

select * from HumanResources.Employee

create proc GetHumanResourceEmployee
(
@Gender char(1) ='F'
)
as 
begin
select * from HumanResources.Employee
where 
Gender= @Gender
end

exec GetHumanResourceEmployee @Gender = 'M'


-----------------------------
create table Personeller
(
id int primary key,
isim nvarchar(50),
soyisim nvarchar(50),
emailAdres nvarchar(50),
cinsiyet nchar(1),
olusturmaTarih datetime,
degistirmeTarih datetime,
silindimi bit
)

----------------------
create proc PersonelEkleII
(
@id int,
@isim nvarchar(50),
@soyisim nvarchar(50),
@emailAdres nvarchar(50),
@cinsiyet nchar(1)
)
as
begin

insert into Personeller (id,isim,soyisim,emailAdres,olusturmaTarih,silindimi,cinsiyet) values 
(@id,@isim,@soyisim,@emailAdres,GETDATE(),0,@cinsiyet)
end

---------------------------------
alter proc PersonelEkleII
(
@id int,
@isim nvarchar(50),
@soyisim nvarchar(50),
@emailAdres nvarchar(50),
@cinsiyet nchar(1)='M'
)
as
begin

insert into Personeller (id,isim,soyisim,emailAdres,olusturmaTarih,silindimi,cinsiyet) values 
(@id,@isim,@soyisim,@emailAdres,GETDATE(),0,@cinsiyet)
end

------------------------------------
create database NetworkAkademi
use NetworkAkademi

--Personeller
--id int primary key,
--isim nvarchar(50) zorunlu,
--soyisim nvarchar(50) zorunlu,
--emailAdres nvarchar(200) zorunlu ve benzersiz,
--cinsiyet nchar(1)
--olusturmaTarih zorunlu
--durum bool default true

create table Personeller
(
id int primary key,
isim nvarchar(50) not null,
soyisim nvarchar(50) not null,
emailAdres nvarchar(200)unique not null,
cinsiyet nchar(1),
olusturmaTarih datetime not null,
durum bit default 'true'
)

insert into Personeller(id,isim,soyisim,cinsiyet,emailAdres,olusturmaTarih)
select 
PP.BusinessEntityID, --id
PP.FirstName,--isim
PP.LastName,--soyisim
HRE.Gender,--cinsiyet
(LOWER(PP.FirstName) +'.'+LOWER(PP.LastName)+'@abc.com') as EmailAdres,
GETDATE() as Tarih
from AdventureWorks2012.Person.Person as PP
inner join AdventureWorks2012.HumanResources.Employee HRE on
PP.BusinessEntityID = HRE.BusinessEntityID 
order by PP.BusinessEntityID

select * from AdventureWorks2012.Person.Person 
select * from AdventureWorks2012.HumanResources.Employee

select * from Personeller

/*
PersonelEkle
PersonelDuzenle
PersonelSil

PersonelListe(Parametre almayan sp)
PersonelGetirID(id alan sp deðer giriþi yapýlmaz ise id nin default deðeri 0)
PersonelAraEmailAdres (Email adres deðeri alacak zorunlu)
*/

---PersonelEkle
create proc PersonelEkle
(
@id int,
@isim nvarchar(50),
@soyisim nvarchar(50),
@emailAdres nvarchar(200),
@cinsiyet nchar(1),
@olusturmaTarih datetime,
@durum bit
)
as
begin
insert into Personeller(id,isim,soyisim,emailAdres,cinsiyet, olusturmaTarih,durum)
values (@id,@isim,@soyisim,@emailAdres, @cinsiyet, @olusturmaTarih, @durum)
return @@rowcount
end

-------Personel Düzenle
create proc PersonelDuzenle
(
@id int,
@isim nvarchar(50),
@soyisim nvarchar(50),
@emailAdres nvarchar(200),
@cinsiyet nchar(1),
@olusturmaTarih datetime,
@durum bit
)
as
begin
update Personeller
set
isim =@isim,
soyisim =@soyisim,
emailAdres =@emailAdres,
cinsiyet =@cinsiyet,
olusturmaTarih = @olusturmaTarih,
durum = @durum
where
id =@id
return @@rowcount
end

-------Personel Sil
create proc PersonelSil
(
@id int
)
as
begin
delete Personeller
where
id =@id
return @@rowcount
end

---------PersonelListe
create proc PersonelListe
as
begin
select * from Personeller
end

-----PersonelGetirId
create proc PersonelGetirId
(
@id int =0
)
as 
begin
select * from Personeller where id=@id
end

----PersonelGetirEmail
create proc PersonelGetirEmail
(
@emailAdres nvarchar(20) not null
)
as 
begin
select * from Personeller where emailAdres=@emailAdres
end




