DROP SCHEMA IF EXISTS storages CASCADE;
CREATE SCHEMA storages;

create table storages.storage (
  storage_id int PRIMARY KEY,
  telephone_number_no varchar(50) NOT NULL ,
  address_desc varchar(100) NOT NULL ,
  email_txt varchar(50) NOT NULL
);

create table storages.client_with_order (
  client_id int PRIMARY KEY,
  first_name_nm varchar(50) NOT NULL ,
  last_name_nm varchar(50) NOT NULL ,
  address_desc varchar(100),
  telephone_number_no varchar(50) NOT NULL UNIQUE ,
  email_txt varchar(50) NOT NULL UNIQUE
);

create table storages.pickup_point (
  pickup_point_id int PRIMARY KEY,
  address_desc varchar(100) NOT NULL UNIQUE ,
  telephone_number_no varchar(50) NOT NULL UNIQUE ,
  email_txt varchar(50) NOT NULL UNIQUE
);

create table storages.order (
  order_id int PRIMARY KEY,
  order_notes_txt varchar(200),
  client_id int,
  status_desc varchar(50) NOT NULL ,
  storage_id int,
  pickup_point_id int,
  FOREIGN KEY (client_id) REFERENCES storages.client_with_order (client_id),
  FOREIGN KEY (storage_id) REFERENCES storages.storage (storage_id),
  FOREIGN KEY (pickup_point_id) REFERENCES storages.pickup_point (pickup_point_id)
);

create table storages.product (
  product_id int PRIMARY KEY,
  name_nm varchar(50) NOT NULL UNIQUE,
  price_amt real NOT NULL CHECK (price_amt > 0)
);

create table storages.employee (
  employee_id int PRIMARY KEY,
  first_name_nm varchar(50) NOT NULL ,
  last_name_nm varchar(50) NOT NULL ,
  position_desc varchar(50) NOT NULL ,
  storage_id int,
  leader_desc varchar(1) NOT NULL ,
  salary_amt real NOT NULL CHECK (salary_amt > 0),
  telephone_number_no varchar(50) NOT NULL UNIQUE ,
  email_txt varchar(50) NOT NULL UNIQUE,
  FOREIGN KEY (storage_id) REFERENCES storages.storage (storage_id)
);

create table storages.packer_of_position_in_order (
  order_id int,
  product_id int NOT NULL ,
  employee_id int,
  FOREIGN KEY (order_id) REFERENCES storages.order (order_id),
  FOREIGN KEY (employee_id) REFERENCES storages.employee (employee_id)
);

create table storages.products_in_order (
  order_id int,
  product_id int,
  quantity_of_product_cnt int NOT NULL CHECK (quantity_of_product_cnt > 0),
  FOREIGN KEY (order_id) REFERENCES storages.order (order_id),
  FOREIGN KEY (product_id) REFERENCES storages.product (product_id)
);

create table storages.products_on_storage (
  storage_id int,
  product_id int,
  quantity_of_product_cnt int,
  FOREIGN KEY (storage_id) REFERENCES storages.storage (storage_id),
  FOREIGN KEY (product_id) REFERENCES storages.product (product_id)
);

SET
  search_path = storages, public;
