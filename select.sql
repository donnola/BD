-- стоимость заказа каждого клиента, вывести ID клиента, ID заказа, стоимость заказа
Select "order".client_id, a.order_id, sum(a.price_amt*a.quantity_of_product_cnt)
from "order" join (
                    Select products_in_order.order_id, product.price_amt, products_in_order.quantity_of_product_cnt
                    from products_in_order join product
                    on products_in_order.product_id = product.product_id) a
on "order".order_id = a.order_id
group by a.order_id, client_id;

-- вывести склад, главного сборщика с этого склада, его имя, фамилию, зарплату
Select storage.storage_id, employee.employee_id, employee.first_name_nm, employee.last_name_nm, employee.salary_amt
from employee join storage
on employee.storage_id = storage.storage_id
where employee.leader_desc = 'Y';

-- вывести пункт самовывоза и ID заказа, прибывшего в этот пункт
Select pickup_point.pickup_point_id, "order".order_id
from pickup_point join "order"
on "order".pickup_point_id = pickup_point.pickup_point_id
where "order".status_desc = 'на месте';

-- для каждого заказа вывести ID заказа, пункт отправки, пункт доставки, отсортировать по пункту отправки
Select a.order_id, a.address_desc, b.address_desc
from
  (Select "order".order_id, storage.address_desc
    from "order" join storage
    on "order".storage_id = storage.storage_id) a
join
  (Select "order".order_id, pickup_point.address_desc
    from "order" join pickup_point
    on "order".pickup_point_id = pickup_point.pickup_point_id) b
on a.order_id = b.order_id
order by a.address_desc;

-- Вывести ID клиента, ID заказа, сумму заказа, тех клиентов, чья сумма заказа не меньше среднего
Select "order".client_id, a.order_id, sum(a.price_amt*a.quantity_of_product_cnt)
from "order" join (
                    Select products_in_order.order_id, product.price_amt, products_in_order.quantity_of_product_cnt
                    from products_in_order join product
                    on products_in_order.product_id = product.product_id) a
on "order".order_id = a.order_id
group by a.order_id, client_id
having sum(a.price_amt*a.quantity_of_product_cnt) >=
       (Select avg(b.total)
        from
        (Select sum(price_amt*quantity_of_product_cnt) as total
         from products_in_order join product
         on products_in_order.product_id = product.product_id
         group by order_id) b);

-- выведите ID самых популярных у клиентов продуктов, их названия и цену
Select distinct products_in_order.product_id, product.name_nm, product.price_amt
from products_in_order join product
on products_in_order.product_id = product.product_id
group by products_in_order.product_id, product.name_nm, product.price_amt
having count(products_in_order.product_id) =(
  Select max(cnt)
  from (
    Select count(products_in_order.product_id) as cnt
    from products_in_order
    group by products_in_order.product_id
    ) a
);
