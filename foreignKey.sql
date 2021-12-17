--Foreign Key

--Database oluþturma 
create  database Store

--Database Silme
drop database Store

--Database Deðiþtirme
alter database store modify name =  networkstore


--Tablo oluþturduk
create table musteri
(
id int primary key,
musteriNumara int,
tckn nvarchar(15),
vkn nvarchar(15),
isim nvarchar(50),
soyisim nvarchar(50),
olusturmaTarih dateTime
)

--Tablo oluþturduk
create table musteriIletisimBilgileri
(
id int primary key,
musteriId int,
iletisimTip int, --1: Gsm / 2: Acýk adres / 3: Sabit Telefon
deger nvarchar(500),
olusturmaTarih datetime,
foreign key (musteriId) references musteri(id)
)

-- Tabloya kayýt eklemek
Insert into musteri (id, musteriNumara, tckn, vkn, isim, soyisim, olusturmaTarih)
Values
(
1, 1500, 123456789456789, 987654321896532, 'Faik', 'Turan',GETDATE()
)
Insert into musteri (id, musteriNumara, tckn, vkn, isim, soyisim, olusturmaTarih)
Values
(
2, 1501, 785456789456789, 456654321896532, 'Arif', 'Turan',GETDATE()
)

Insert into musteriIletisimBilgileri(id, musteriId, iletisimTip, deger, olusturmaTarih)
Values
(4, 1, 2, 'Darýca', GETDATE()), (5, 1, 3, '02125556642', GETDATE())

Insert into musteriIletisimBilgileri(id, musteriId, iletisimTip, deger, olusturmaTarih)
Values
(
2, 2, 1, 05554565656, GETDATE()
)

select * from musteriIletisimBilgileri

--Var olan bir tabloya yeni kolon eklemek
Alter table musteri
Add DenemeKolon int null -- DenemeKolon isimli int tipinde null alabilir kolon

select * from musteri
Alter table musteri
Add maas int not null default 4250

update
musteri set maas = 15000 where soyisim = 'Turan'

--Var olan bir tablodaki bir kolonu silmek
Alter table musteri
drop column DenemeKolon --DenemeKolon silindi.

--Var olan bir tablodaki var olan bir kolonda deðiþiklik 
Alter table musteri
Alter column maas int null 
exec sp_rename 'musteri.maas', 'Ucret', 'column'