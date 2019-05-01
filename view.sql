Create or replace view pickup_point_view as
Select address,
       concat(substring(telephone_number, 1, 7), '***-**', substring(telephone_number, 14, 3)) as telephone_number,
       concat('*****', substring(email, strpos(email, '@'), length(email) + 1 - strpos(email, '@'))) as email
from pickup_point;

Create or replace view storage_view as
Select concat(substring(telephone_number, 1, 7), '***-**', substring(telephone_number, 14, 3)) as telephone_number,
       address,
       concat('*****', substring(email, strpos(email, '@'), length(email) + 1 - strpos(email, '@'))) as email
from storage;

Create or replace view employee_view as
Select first_name, last_name, position, leader, salary,
       concat(substring(telephone_number, 1, 7), '***-**', substring(telephone_number, 14, 3)) as telephone_number,
       concat('*****', substring(email, strpos(email, '@'), length(email) + 1 - strpos(email, '@'))) as email
from employee;

Create or replace view order_view as
Select order_id, order_notes, status, pickup_point.address
from "order" left join pickup_point
on "order".pickup_point_id = pickup_point.pickup_point_id;

Create or replace view product_view as
Select product_id, name, price
from product;

Create or replace view client_with_order_view as
Select first_name, last_name, address, telephone_number,
       concat('*****', substring(email, strpos(email, '@'), length(email) + 1 - strpos(email, '@'))) as email
from client_with_order;

Create or replace view packer_of_position_in_oder_view as
Select order_id, product_id, first_name, last_name
from packer_of_position_in_order left join employee
on packer_of_position_in_order.employee_id = employee.employee_id;

Create or replace view products_in_order_view as
Select order_id, name, quantity_of_product
from products_in_order left join product
on product.product_id = products_in_order.product_id;

Create or replace view products_on_storage_view as
Select address, name, quantity_of_product
from products_on_storage, storage, product
where storage.storage_id = products_on_storage.storage_id and product.product_id = products_on_storage.product_id;
