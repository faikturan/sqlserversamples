use BikeStores
select * from production.products
select * from production.brands
select * from production.categories


--Hangi marka ve kategoride hangi ürünler var. 
--Yıllara göre kategori satışları


select 
PP.category_id,SUM(PP.list_price) AS [TOPLAM SATİS], PP.model_year
from production.products PP LEFT JOIN production.brands PB
ON PP.brand_id=PB.brand_id 
LEFT JOIN production.categories PC
ON PC.category_id=PP.category_id
group by PP.model_year,PP.category_id


select Pb.brand_name , PC.category_name, pp.product_name

from production.products PP LEFT JOIN production.brands PB
ON PP.brand_id=PB.brand_id 
LEFT JOIN production.categories PC
ON PC.category_id=PP.category_id

--Hangi store da hangi çalışan hangi siparişi almış
select * from sales.stores
select * from sales.staffs
select * from sales.orders
select * from sales.order_items

select
SS.store_name,
(SS2.first_name + ' ' + SS2.last_name) as FullName,
SO.order_id

from sales.orders SO
LEFT JOIN sales.stores SS
ON SO.store_id = SS.store_id
LEFT JOIN sales.staffs SS2
ON SS2.staff_id =SO.staff_id
