insert into storage (storage_id, telephone_number, address, email)
  values
  (1, '+7(495)893-20-29', 'Москва, Мичуринский проспект, 11к3', 'first_storage@mail.ru'),
  (2, '+7(499)468-15-85', 'Москва, 5-я улица Соколиной Горы, 25к4, 11к3', 'second_storage@mail.ru'),
  (3, '+7(495)375-73-83', 'Москва, Дмитровское шоссе, 37к1', 'third_storage@mail.ru'),
  (4, '+7(495)753-32-85', 'Москва, улица Сущёвский Вал, 31с2', 'fourth_storage@mail.ru'),
  (5, '+7(495)146-97-30', 'Москва, Шарикоподшипниковская улица, 3', 'fifth_storage@mail.ru');

insert into product (product_id, name, price)
  values
  (137853, 'чайник', 2000),
  (938602, 'тостер', 3000),
  (802853, 'мультиварка', 10000),
  (820174, 'микроволновка', 5000),
  (038284, 'пароварка', 3500),
  (749204, 'кофеварка', 12000),
  (028562, 'кофемолка', 1000),
  (859275, 'кипятильник', 1000),
  (837932, 'електроплитка', 2500),
  (472910, 'вафельница', 4300);

insert into pickup_point (pickup_poin_id, address, telephone_number, email)
  values
  (35, 'Москва, Мурманский проезд, 12', '+7(495)395-29-50', '1pickup@mail.ru'),
  (23, 'Москва, Писцовая улица, 15', '+7(495)492-39-20', '2pickup@mail.ru'),
  (19, 'Москва, улица Татищева, 4', '+7(495)392-68-25', '3pickup@mail.ru'),
  (30, 'Москва, Верхняя Красносельская улица, 8к2', '+7(495)392-35-24', '4pickup@mail.ru'),
  (64, 'Москва, Большой Афанасьевский переулок, 15с1', '+7(495)633-43-24', '5pickup@mail.ru'),
  (12, 'Москва, улица Серпуховский Вал, 5', '+7(495)245-75-23', '6pickup@mail.ru'),
  (75, 'Москва, Волжский бульвар, 6к3', '+7(495)355-24-64', '7pickup@mail.ru'),
  (43, 'Москва, улица Архитектора Власова, 49', '+7(495)864-24-65', '8pickup@mail.ru'),
  (27, 'Москва, Полярная улица, 25к2', '+7(495)245-86-35', '9pickup@mail.ru'),
  (86, 'Москва, улица Крылатские Холмы, 27к3', '+7(495)352-75-24', '10pickup@mail.ru');

insert into employee (employee_id, first_name, last_name, position, storage_id, leader, salary, telephone_number, email)
  values
  (937833, 'Александр', 'Буш', 'сборщик заказа', 1, 'Y', 50000, '+7(909)395-28-59', 'Bush@mail.ru'),
  (593024, 'Аркадий', 'Тараканов', 'сборщик заказа', 1, 'N', 20000, '+7(935)245-46-24', 'BuBuBu@mail.ru'),
  (549253, 'Адам', 'Хасанов', 'сборщик заказа', 2, 'N', 23000, '+7(927)234-75-23', 'Hasanov@mail.ru'),
  (104836, 'Мария', 'Иванова', 'сборщик заказа', 2, 'Y', 35000, '+7(923)674-25-78', 'MarIV@mail.ru'),
  (492843, 'Михаил', 'Портнов', 'сборщик заказа', 3, 'Y', 45000, '+7(935)642-12-64', 'Miha@mail.ru'),
  (463263, 'Арсель', 'Бандаев', 'сборщик заказа', 3, 'N', 25000, '+7(977)341-86-23', 'ARB@mail.ru'),
  (948292, 'Анастасия', 'Крим', 'сборщик заказа', 4, 'N', 28000, '+7(909)235-75-23', 'Anka@mail.ru'),
  (395284, 'Денис', 'Копаев', 'сборщик заказа', 4, 'Y', 48000, '+7(909)137-76-34', 'Den@mail.ru'),
  (058372, 'Мишель', 'Котова', 'сборщик заказа', 5, 'Y', 40000, '+7(943)763-27-24', 'Cat@mail.ru'),
  (058372, 'Константин', 'Петров', 'сборщик заказа', 5, 'N', 24000, '+7(964)923-74-27', 'Bone@mail.ru');

insert into "order" (order_id, order_notes, client_id, status, storage_id, pickup_point_id)
  values
  (104394, '', 01, 'собирается', '1', 35),
  (103928, '', 02, 'в пути', '2', 30),
  (184920, '', 03, 'собирается', '3', 86),
  (183320, '', 04, 'на месте', '2', 27),
  (113894, '', 05, 'получен', '3', 30),
  (125932, '', 06, 'обрабатывается', '1', 12),
  (018493, '', 07, 'собирается', '5', 75),
  (492853, '', 08, 'в пути', '4', 12),
  (068383, '', 09, 'собирается', '3', 12),
  (674932, '', 10, 'собирается', '4', 19);

insert into client_with_order (client_id, first_name, last_name, address, telephone_number, email)
  values
  (01, 'Людмила', 'Маркова', 'Москва, ул Красногвардейская, 5', '+7(904)245-75-36', '1client@mail.ru'),
  (02, 'Евгений', 'Ложкин', 'Москва, ул Мясницкая, 9', '+7(904)246-76-24', '2client@mail.ru'),
  (03, 'Андрей', 'Серый', 'Москва, ул Ушакова, 12', '+7(905)353-86-24', '3client@mail.ru'),
  (04, 'Александр', 'Заяц', 'Москва, ул Парадная, 7', '+7(977)755-75-53', '4client@mail.ru'),
  (05, 'Дмитрий', 'Королёв', 'Москва, ул Жукова, 2', '+7(904)948-75-23', '5client@mail.ru'),
  (06, 'Татьяна', 'Митина', 'Москва, бульвар Дмитрия Донского, 2', '+7(909)243-23-87', '6client@mail.ru'),
  (07, 'Илья', 'Мыльников', 'Москва, ул Карамзина, 29', '+7(904)353-65-63', '7client@mail.ru'),
  (08, 'Григорий', 'Краснов', 'Москва, ул Правая, 13', '+7(904)947-34-34', '8client@mail.ru'),
  (09, 'Михаил', 'Топаев', 'Москва, ул Чёрная, 56', '+7(935)266-33-55', '9client@mail.ru'),
  (10, 'Иван', 'Левый', 'Москва, ул Полкова, 23', '+7(977)346-86-33', '10client@mail.ru');

insert into packer_of_position_in_order (order_id, product_id, employee_id)
  values
  (104394, 593024, 038284),
  (104394, 593024, 749204),
  (125932, 937833, 472910),
  (103928, 549253, 938602),
  (183320, 549253, 837932),
  (184920, 463263, 820174),
  (113894, 463263, 837932),
  (113894, 104836, 472910),
  (113894, 104836, 137853),
  (068383, 463263, 028562),
  (492853, 948292, 038284),
  (674932, 948292, 859275),
  (018493, 058372, 038284),
  (018493, 058372, 938602);

insert into products_in_order (order_id, product_id, quantity_of_product)
  values
  (104394, 038284, 1),
  (104394, 749204, 1),
  (125932, 472910, 1),
  (103928, 938602, 2),
  (183320, 837932, 2),
  (184920, 820174, 1),
  (113894, 837932, 3),
  (113894, 472910, 3),
  (113894, 137853, 1),
  (068383, 028562, 2),
  (492853, 038284, 4),
  (674932, 859275, 2),
  (018493, 038284, 2),
  (018493, 938602, 1);

insert into  products_on_storage (storage_id, product_id, quantity_of_product)
  values
  (1, 038284, 45),
  (1, 749204, 20),
  (1, 472910, 27),
  (1, 938602, 13),
  (1, 820174, 19),
  (2, 938602, 24),
  (2, 837932, 35),
  (2, 472910, 7),
  (3, 820174, 56),
  (3, 837932, 24),
  (3, 472910, 75),
  (3, 137853, 24),
  (3, 028562, 65),
  (3, 038284, 23),
  (3, 938602, 34),
  (4, 038284, 42),
  (4, 859275, 45),
  (4, 938602, 12),
  (4, 472910, 6),
  (5, 038284, 54),
  (5, 938602, 76),
  (5, 837932, 54),
  (5, 749204, 75),
  (5, 028562, 26);
