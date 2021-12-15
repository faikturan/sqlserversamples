use BikeStores
select * from production.products
select * from production.brands
select * from production.categories



--Hangi marka ve kategoride hangi �r�nler var. 
--Y�llara g�re kategori sat��lar�


select 
PP.category_id,SUM(PP.list_price) AS [TOPLAM SAT�S], PP.model_year
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