select * from sales.orders -- order_id customer_id
select * from sales.customers -- cs_id
--Bir müþteriye ait tüm sipariþler
--Müþteri Adý Soyadý Product_name
select * from sales.order_items -- order _ id , item_id , prdýct_id
select * from production.products -- product_id 

select 
sc.first_name,sc.last_name,pp.product_name
from 
sales.orders so
left join sales.customers sc
on so.customer_id=sc.customer_id 
left join sales.order_items soi 
on  so.order_id = soi.order_id
left join production.products pp
on pp.product_id = soi.product_id


select sc.first_name,sc.last_name,pp.product_name
from sales.customers sc inner join production.products pp
on sc.customer_id = pp.product_id


select c.first_name, c.last_name, p.product_name from sales.customers c right join production.products p on c.customer_id = p.product_id
 
