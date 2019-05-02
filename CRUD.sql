update "order"
set status_desc = 'в пути'
where order_id = 018493;

select *
from "order"
where status_desc = 'в пути';

delete
from product
where product_id not in (Select distinct product_id
                         from products_in_order
                         group by products_in_order.product_id);

insert into product
values (865734, 'огнетушитель', 4000);


insert into employee
values (432523, 'Арина', 'Петрова', 'бухгалтер', 1, 'Y', 70000, '+7(977)246-75-32', 'Petro@mail.ru');
