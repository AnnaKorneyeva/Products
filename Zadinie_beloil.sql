-- Продукты 

 /* drop table orders_products
  drop table customers
  drop table courier_info
  drop table orders
  drop table delivery_list
  drop table customers
  drop table products*/

-- Продукты 
CREATE TABLE products
(
 product_id INT IDENTITY(1,1) PRIMARY KEY,
 menu_name  VARCHAR(80) NOT NULL,
 price      FLOAT NOT NULL,
 weight     FLOAT NULL);

INSERT INTO products(menu_name, price,weight) VALUES
('Чикен Фрайз', 5.0,270.0),
('Шаурма Арабская Тарелка', 11.0,690),
('Шаурма Кинг', 7.50,450),
('Фалафель Ролл', 6,400),
('Картофель фри', 3.0,120),
('Чикен Чизбургер', 5.0,320),
('+ сыр в шаурму', 1.0,null),
('+ халапеньо в шаурму', 1.0,null),
('Кока-Кола 0.5л', 2.3,null),
('Фьюз Ти лимон-лемонграсс 0.5л', 2.5,null),
('Соус Чесночный', 4.1,50),
('Бонаква негазированная 0.5л', 1.80,null); 
select * from products

-- Клинеты создание таблицы 
CREATE TABLE customers
(customer_id INT IDENTITY(1,1) PRIMARY KEY,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(35) NOT NULL,
phone_number VARCHAR(20) NOT NULL,
district VARCHAR(15) NOT NULL,
street VARCHAR(25) NOT NULL,
house INT NOT NULL,
apartment INT NOT NULL);

-- Клинеты Добавление данных в таблицу 
INSERT INTO customers(first_name, last_name, phone_number, district, street, house, apartment) VALUES
('Наталья', 'Морозова', '+375 29 141 6572', 'South', 'Первая улица', 1, 10),
('Сергей', 'Крот', '+ 375 41 568 8452', 'West', 'Весенняя улица', 2, 35),
('Oлег', 'Харьков', '+ 375 41 782 5648', 'East', 'Пятая улица', 77, 14),
('Дмитрий', 'Марчик', '+ 375 41 752 1224', 'South', 'Круглая улица', 24, 89),
('Елнена', 'Веллорова', '+ 375 41 555 4568', 'South', 'Первая улица', 11, 85),
('Катерина', 'Романова', '+ 375 41 321 3211', 'West', 'Весенняя улица', 123, 52),
('Жанна', 'Головацкая', '+ 375 41 321 1232', 'West', 'Круглая улица', 76, 44),
('Михаил', 'Гордон', '+ 375 41 122 4554', 'East', 'Пятая улица', 21, 91),
('Светлана', 'Лапицкая', '+ 375 41 758 1667', 'North', 'Зеленый проспект', 23, 67),
('Эльвира', 'Мазурова', '+ 375 41 765 8582', 'South', 'Первая улица', 62, 44),
('Геннадий', 'Иванов', '+ 375 41 657 5528', 'South', 'Зеленый проспект', 15, 56),
('Александр', 'Рогачевский', '+ 375 41 624 3643', 'South', 'Первая улица', 5, 13),
('Владислав', 'Фелотов', '+ 375 41 303 8181', 'North', 'Садовый проспект', 18, 88),
('Петр', 'Рабочий', '+ 375 41 466 7562', 'North', 'Садовый проспект', 17, 7),
('Андрей', 'Ватсон', '+ 375 41 114 7812', 'South', 'Лесная улица ', 18, 9);

--Работники доставки
CREATE TABLE courier_info
(courier_id INT IDENTITY(1,1) PRIMARY KEY,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(35) NOT NULL,
phone_number VARCHAR(20) NOT NULL,
delivery_type VARCHAR(6) NOT NULL);

INSERT INTO courier_info(first_name, last_name, phone_number, delivery_type) VALUES
('Даниил', 'Роев', '+ 375 41 655 0954', 'Пешком'),
('Лизавета', 'Лифанова', '+ 375 41 743 0146', 'Авто'),
('Борис', 'Киреев', '+ 375 41 107 7798', 'Авто'),
('Назар', 'Борщев', '+ 375 41 566 5516', 'Авто'),
('Артемий', 'Ковалев', '+ 375 41 566 5516', 'Вело');

CREATE TABLE orders
(order_id INT IDENTITY(1,1) PRIMARY KEY,
customer_id INT NOT NULL,
date_get datetime NOT NULL, 
FOREIGN KEY (customer_id) REFERENCES customers (customer_id));

INSERT INTO orders(customer_id, date_get) VALUES(1, getdate()),
(2, getdate()),(3, getdate()),(4, getdate()),
(5, getdate()),(6, getdate()),(7, getdate()),
(8, getdate()),(9, getdate()),(10, getdate()),
(11, getdate()),(12, getdate()),(13, getdate()),
(14, getdate()),(15, getdate())


CREATE TABLE delivery_list
(delivery_id INT IDENTITY(1,1) PRIMARY KEY,
order_id INT UNIQUE NOT NULL,
courier_id INT NOT NULL,
date_arrived datetime  NULL,  
taken VARCHAR(3) NOT NULL,
payment_method VARCHAR(4),
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (courier_id) REFERENCES courier_info(courier_id));


INSERT INTO delivery_list VALUES
(1, 3, '2021-02-26 17:59:15', 'Yes', 'Cash'),
(2, 4, '2021-02-26 18:01:05', 'Yes', 'Card'),
(3, 1, '2021-02-26 18:04:36', 'Yes', 'Cash'),
(4, 2, '2021-02-26 18:03:11', 'Yes', 'Cash'),
(5, 1, '2021-02-26 18:19:56', 'Yes', 'Cash'),
(6, 3, '2021-02-26 18:18:44', 'Yes', 'Card'),
(7, 2, '2021-02-26 18:50:11', 'No', 'NULL'),
(8, 4, '2021-02-26 18:35:07', 'Yes', 'Card'),
(9, 4, '2021-02-26 18:58:28', 'NO', 'NULL'),
(10, 3, '2021-02-26 18:36:51', 'Yes', 'Card'),
(11, 2, '2021-02-26 19:10:34', 'Yes', 'Cash'),
(12, 1, NULL, 'NO', 'NULL'), 
(13, 2, '2021-02-26 19:17:04', 'Yes', 'Cash'),
(14, 3, '2021-02-26 18:56:17', 'Yes', 'Card'),
(15, 4, '2021-02-26 19:05:29', 'Yes', 'Card');

--Заказы продуктов

CREATE TABLE orders_products
(order_id INT NOT NULL,
product_id INT NOT NULL,
quantity INT NOT NULL,
PRIMARY KEY (order_id, product_id),
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (product_id) REFERENCES products(product_id));

INSERT INTO orders_products VALUES
(1, 1, 2), (1, 4, 1), (1, 10, 1),
(2, 4, 1), (2, 5, 1), (3, 3, 1),
(4, 7, 2), (5, 2, 1), (5, 3, 1),
(6, 8, 3), (7, 1, 1), (7, 6, 4),
(8, 1, 2), (9, 2, 1), (9, 3, 1),
(10, 1, 2), (10, 2, 1),(12, 5, 2), 
(12, 10, 1),(13, 4, 2),(14, 5, 1),
(15, 8, 1), (15, 7, 2);

-- Запрос по анализу клиентов по районам проживания

  SELECT district, COUNT(district) as kol
  FROM customers
  GROUP BY district
  ORDER BY COUNT(district) DESC

-- Запрос по количеству выполненных заказов работниками доставки
  SELECT a.courier_id,b.first_name as 'Работник доставки',b.last_name,b.phone_number, 
  COUNT(order_id) as 'Количество выполненных заказов'
  FROM delivery_list a LEFT JOIN courier_info  b on a.courier_id=b.courier_id
  WHERE date_arrived IS NOT NULL
  GROUP BY a.courier_id,b.first_name,b.last_name,b.phone_number

--  Запрос по анализу позиций в меню по степени востребованности (объединение таблиц)
  SELECT menu_name, '+ Есть заказы' as '+/-' FROM products products
  WHERE EXISTS
   (SELECT * FROM orders_products orders_products
       WHERE orders_products.product_id = products.product_id)
 union all

  SELECT menu_name,'- Нет заказов' FROM products products
  WHERE NOT EXISTS
   (SELECT * FROM orders_products orders_products
      WHERE orders_products.product_id = products.product_id)

--  Запрос по подсчету суммы заказа  и нумарация позиций в заказе

      SELECT  a.order_id, b.menu_name, quantity,d.phone_number,d.first_name, ROUND(price*quantity, 2) AS total_price,
   SUM(ROUND(price*quantity, 2)) OVER(PARTITION BY  a.order_id) AS 'Sum' ,
   ROW_NUMBER() OVER (PARTITION BY a.order_id ORDER BY a.order_id) AS 'Number'
   FROM orders_products a INNER JOIN products  b ON a.product_id = b.product_id
   LEFT JOIN  delivery_list c on a.order_id=c.order_id
   LEFT JOIN customers  d on c.courier_id=d.customer_id
   -- where first_name like '%Сергей%'
