DROP SCHEMA IF EXISTS storages CASCADE;
CREATE SCHEMA storages;

create table storages.storage (
  storage_id int,
  telephone_number_no varchar(50),
  address_desc varchar(100),
  email_txt varchar(50)
);

create table storages.order (
  order_id int,
  order_notes_txt varchar(200),
  client_id int,
  status_desc varchar(50),
  storage_id int,
  pickup_point_id int
);

create table storages.product (
  product_id int,
  name_nm varchar(50),
  price_amt real
);

create table storages.employee (
  employee_id int,
  first_name_nm varchar(50),
  last_name_nm varchar(50),
  position_desc varchar(50),
  storage_id int,
  leader_desc varchar(1),
  salary_amt real,
  telephone_number_no varchar(50),
  email_txt varchar(50)
);

create table storages.client_with_order (
  client_id int,
  first_name_nm varchar(50),
  last_name_nm varchar(50),
  address_desc varchar(100),
  telephone_number_no varchar(50),
  email_txt varchar(50)
);

create table storages.pickup_point (
  pickup_point_id int,
  address_desc varchar(100),
  telephone_number_no varchar(50),
  email_txt varchar(50)
);

create table storages.packer_of_position_in_order (
  order_id int,
  product_id int,
  employee_id int
);

create table storages.products_in_order (
  order_id int,
  product_id int,
  quantity_of_product_cnt int
);

create table storages.products_on_storage (
  storage_id int,
  product_id int,
  quantity_of_product_cnt int
);

SET
  search_path = storages, public;
