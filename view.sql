Create or replace view pickup_point_view as
Select address_desc,
       concat(substring(telephone_number_no, 1, 7), '***-**', substring(telephone_number_no, 14, 3)) as telephone_number_no,
       concat('*****', substring(email_txt, strpos(email_txt, '@'), length(email_txt) + 1 - strpos(email_txt, '@'))) as email_txt
from pickup_point;

Create or replace view storage_view as
Select concat(substring(telephone_number_no, 1, 7), '***-**', substring(telephone_number_no, 14, 3)) as telephone_number_no,
       address_desc,
       concat('*****', substring(email_txt, strpos(email_txt, '@'), length(email_txt) + 1 - strpos(email_txt, '@'))) as email_txt
from storage;

Create or replace view employee_view as
Select first_name_nm, last_name_nm, position_desc, leader_desc, salary_amt,
       concat(substring(telephone_number_no, 1, 7), '***-**', substring(telephone_number_no, 14, 3)) as telephone_number_no,
       concat('*****', substring(email_txt, strpos(email_txt, '@'), length(email_txt) + 1 - strpos(email_txt, '@'))) as email_txt
from employee;

Create or replace view order_view as
Select order_id, order_notes_txt, status_desc, pickup_point.address_desc
from "order" left join pickup_point
on "order".pickup_point_id = pickup_point.pickup_point_id;

Create or replace view product_view as
Select product_id, name_nm, price_amt
from product;

Create or replace view client_with_order_view as
Select first_name_nm, last_name_nm, address_desc, telephone_number_no,
       concat('*****', substring(email_txt, strpos(email_txt, '@'), length(email_txt) + 1 - strpos(email_txt, '@'))) as email_txt
from client_with_order;

Create or replace view packer_of_position_in_oder_view as
Select order_id, product_id, first_name_nm, last_name_nm
from packer_of_position_in_order left join employee
on packer_of_position_in_order.employee_id = employee.employee_id;

Create or replace view products_in_order_view as
Select order_id, name_nm, quantity_of_product_cnt
from products_in_order left join product
on product.product_id = products_in_order.product_id;

Create or replace view products_on_storage_view as
Select address_desc, name_nm, quantity_of_product_cnt
from products_on_storage, storage, product
where storage.storage_id = products_on_storage.storage_id and product.product_id = products_on_storage.product_id;
