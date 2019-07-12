--Представления самых дешёвых продуктов с каждого склада (первых трёх по цене)

Create or replace view cheap_products_on_storage_view as
Select a.storage_id, a.name_nm, a.price_amt from
(Select storage_id, name_nm, price_amt, dense_rank() over(partition by storage_id order by price_amt) as rank_of_product
from products_on_storage join product
on product.product_id = products_on_storage.product_id) a
where a.rank_of_product = 1 or a.rank_of_product = 2 or a.rank_of_product = 3;

--Представление возможных сборщиков заказа

Create or replace view possible_packers_of_order as
Select "order".storage_id, order_id, employee_id, first_name_nm, last_name_nm, leader_desc
from "order" join employee
on "order".storage_id= employee.storage_id
where position_desc = 'сборщик заказа'
order by "order".storage_id, order_id, leader_desc;
