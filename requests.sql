-- стоимость заказа каждого клиента, вывести ID клиента, ID заказа, стоимость заказа
Select "order".client_id, a.order_id, sum(a.price*a.quantity_of_product)
from "order" join (
                    Select products_in_order.order_id, product.price, products_in_order.quantity_of_product
                    from products_in_order join product
                    on products_in_order.product_id = product.product_id) a
on "order".order_id = a.order_id
group by a.order_id, client_id;

-- вывести склад, главного сборщика с этого склада, его имя, фамилию, зарплату
Select storage.storage_id, employee.employee_id, employee.first_name, employee.last_name ,employee.salary
from employee join storage
on employee.storage_id = storage.storage_id
where employee.leader = 'Y';

-- вывести пункт самовывоза и ID заказа, прибывшего в этот пункт
Select pickup_point.pickup_point_id, "order".order_id
from pickup_point join "order"
on "order".pickup_point_id = pickup_point.pickup_point_id
where "order".status = 'на месте';

-- для каждого заказа вывести ID заказа, пункт отправки, пункт доставки, отсортировать по пункту отправки
Select a.order_id, a.address, b.address
from
  (Select "order".order_id, storage.address
    from "order" join storage
    on "order".storage_id = storage.storage_id) a
join
  (Select "order".order_id, pickup_point.address
    from "order" join pickup_point
    on "order".pickup_point_id = pickup_point.pickup_point_id) b
on a.order_id = b.order_id
order by a.address;

-- Вывести ID клиента, ID заказа, сумму заказа, тех клиентов, чья сумма заказа не меньше среднего
Select "order".client_id, a.order_id, sum(a.price*a.quantity_of_product)
from "order" join (
                    Select products_in_order.order_id, product.price, products_in_order.quantity_of_product
                    from products_in_order join product
                    on products_in_order.product_id = product.product_id) a
on "order".order_id = a.order_id
group by a.order_id, client_id
having sum(a.price*a.quantity_of_product) >=
       (Select avg(a.total)
        from
        (Select sum(price*quantity_of_product) as total
         from products_in_order join product
         on products_in_order.product_id = product.product_id
         group by order_id) a);

-- выведите ID самых популярных у клиентов продуктов, их названия и цену
Select distinct products_in_order.product_id, product.name, product.price
from products_in_order join product
on products_in_order.product_id = product.product_id
group by products_in_order.product_id, product.name, product.price
having count(products_in_order.product_id) =(
  Select max(cnt)
  from (
    Select count(products_in_order.product_id) as cnt
    from products_in_order
    group by products_in_order.product_id
    ) a
);
