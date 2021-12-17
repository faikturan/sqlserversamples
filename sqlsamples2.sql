use NORTHWND
declare @sayi int; --degisken tan�mlad�k
set @sayi=20.0; --tan�mlanan de�i�kene deger atamak

print @sayi; --normal yaz� �eklinde ��kt� verir.
select @sayi; --tablo �eklinde ��kt� verir.
--kategoriAdetini tablodan �ektik
declare @kategoriAdet int;
set @kategoriAdet = (select COUNT(*) from Categories);
select @kategoriAdet kategoriAdet

--TODO: CategoryName leri bizim olu�turdu�umuz de�i�kene atay�p yazd�ral�m.

declare @sayimiz int;
set @sayimiz = 25;
--Convert
-- sayimiz i�indeki degeri nvarchar'a d�n��t�r ekrana yazd�r.
--print Convert(nvarchar(5),@sayimiz);

--Try convert
print CONVERT(nvarchar(3),@sayimiz);

set DATEFORMAT dmy;
SELECT CONVERT(datetime2, '17-12-2021') AS Result;

declare @kategoriAdet table(name2 nvarchar(15));
declare @sayac int;
set @sayac = (select COUNT(CategoryName) from Categories)
while (@sayac>=1)
begin 
insert into @kategoriAdet values ((select  CategoryName from Categories where categoryID = @sayac));
set @sayac = @sayac -1
end;
select name2 from @kategoriAdet

--Cast
declare @sayi2 int;
set @sayi2= cast('100' as int);--int'e cast ediyoruz.
print @sayi2

--right
declare @KelimeninBirKismi nvarchar(20);
set @KelimeninBirKismi = RIGHT('network akademi',7);
print @KelimeninBirKismi

--left
declare @KelimeninBirKismi2 nvarchar(20);
set @KelimeninBirKismi2 = LEFT('network akademi',7);
print @KelimeninBirKismi2

--substring
declare @KelimeninBirKismi3 nvarchar(20);
set @KelimeninBirKismi3 = substring('network akademi',2,6);
print @KelimeninBirKismi3

--Replicate
print Replicate('*',15);

--Tarih ve Saat Fonksiyonlar�
--sadece g�n� al�r
PRINT DAY(GETDATE())
--SADECE AY ALIR
PRINT MONTH(GETDATE())
--SADECE YIL ALIR
PRINT YEAR(GETDATE())
PRINT YEAR('2021-12-17')
PRINT DATEPART(HOUR, GETDATE())
PRINT DATEPART(MINUTE, GETDATE())
--O AYIN EN SON G�N�
PRINT EOMONTH(GETDATE())
--��MD� timestamp
PRINT CURRENT_TIMESTAMP

--
print Upper('network')
print Lower('NETWORK')
---

print Round(1234.56789,3,0);
print Round(1234.56789,3,4);

print Round(1234.56789,4,1);

select ROUND(235.415,2,1) as RoundValue
select ROUND(235.415,-1) as RoundValue

--Parameter	Description
--number	Required. The number to be rounded
--decimals	Required. The number of decimal places to round number to
--operation	Optional. If 0, it rounds the result to the number of decimal. If another value than 0, it truncates the result to the number of decimals. Default value is 0
--char index

---
print ascii('B')
print char(66)
print unicode('B')

print charindex('n','network')

print ltrim('      network')
print rtrim('network      ')
print replace('network        akademi',' ','')

select ROUND(125.315,2);
--Result :125.320 (3.parametre atland��� i�in sonu� yuvarlan�r.)

select ROUND(125.315,2, 0);
--Result :125.320 (3.parametre 0 oldu�u i�in sonu� yuvarlan�r.)

select ROUND(125.315,2, 1);
--Result :125.310 (3.parametre 0 olmad��� i�in sonu� kesildi.)

--hassasiyetli round i�lemi
print Round(1234.56789,4,0);
print Round(1234.56789,4,1);
print Round(1234.56789,4,-9);

Declare @ondalikli float
set @ondalikli = 14.7739775;
print str(@ondalikli,2,2);--tip d�n��t�rerek yazd�rd�k

--------------Ko�ul ve D�ng�--------
declare @durum nvarchar(5);
set @durum ='deneme';
select case @durum when 'evet' then 'durumda evet yaz�yor' end
select case @durum when 'deneme' then 'durumda deneme yaz�yor' end

declare @sayi4 int;
set @sayi4=50;
if(@sayi4 > 100)
begin
	print 'say� 100 den b�y�k'
end
else
begin
	print 'say� 100 den k���k'
end