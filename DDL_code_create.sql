DROP SCHEMA IF EXISTS storages CASCADE;
CREATE SCHEMA storages;

create table storages.storage (
  storage_id int,
  telephone_number varchar(50),
  address varchar(100),
  email varchar(50)
);

create table storages.order (
  order_id int,
  order_notes varchar(200),
  client_id int,
  status varchar(50),
  storage_id int
);

create table storages.product (
  product_id int,
  name varchar(50),
  price real
);

create table storages.employee (
  employee_id int,
  first_name varchar(50),
  last_name varchar(50),
  position varchar(50),
  storage_id int,
  leader varchar(1),
  salary real,
  telephone_number varchar(50),
  email varchar(50)
);

create table storages.client_with_order (
  client_id int,
  address varchar(100),
  telephone_number varchar(50),
  email varchar(50)
);

create table storages.pickup_point (
  pickup_poin_id int,
  address varchar(100),
  telephone_number varchar(50),
  email varchar(50)
);

create table storages.packer_of_position_in_order (
  order_id int,
  product_id int,
  employee_id int
);

create table storages.products_in_order (
  order_id int,
  product_id int,
  quantity_of_product int
);

create table storages.products_on_storage (
  storage_id int,
  product_id int,
  quantity_of_product int
);

SET
  search_path = storages, public;
