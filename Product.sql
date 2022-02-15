-- �������� 
IF object_id('tempdb.dbo.#products') is not null drop table #products
IF object_id('tempdb.dbo.#customers') is not null drop table #customers
IF object_id('tempdb.dbo.#courier_info') is not null drop table #courier_info
IF object_id('tempdb.dbo.#orders') is not null drop table #orders
IF object_id('tempdb.dbo.#delivery_list') is not null drop table #delivery_list
IF object_id('tempdb.dbo. #orders_products') is not null drop table  #orders_products
--IF object_id('tempdb.dbo. #orders_products') is not null drop table  #orders_products
 

CREATE TABLE #products
(
--product_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
 product_id INT IDENTITY(1,1) PRIMARY KEY,
 menu_name  VARCHAR(80) NOT NULL,
 price      FLOAT NOT NULL,
 weight     FLOAT NULL);

INSERT INTO #products(menu_name, price,weight) VALUES
('����� �����', 5.0,270.0),
('������ �������� �������', 11.0,690),
('������ ����', 7.50,450),
('�������� ����', 6,400),
('��������� ���', 3.0,120),
('����� ���������', 5.0,320),
('+ ��� � ������', 1.0,null),
('+ ��������� � ������', 1.0,null),
('����-���� 0.5�', 2.3,null),
('���� �� �����-���������� 0.5�', 2.5,null),
('���� ���������', 4.1,50),
('������� �������������� 0.5�', 1.80,null); 
select * from #products
-- ������� �������� ������� 

CREATE TABLE #customers
(customer_id INT IDENTITY(1,1) PRIMARY KEY,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(35) NOT NULL,
phone_number VARCHAR(20) NOT NULL,
district VARCHAR(15) NOT NULL,
street VARCHAR(25) NOT NULL,
house INT NOT NULL,
apartment INT NOT NULL);

-- ������� ���������� ������ � ������� 
INSERT INTO #customers(first_name, last_name, phone_number, district, street, house, apartment) VALUES
('�������', '��������', '+375 29 141 6572', 'South', '������ �����', 1, 10),
('������', '����', '+ 375 41 568 8452', 'West', '�������� �����', 2, 35),
('O���', '�������', '+ 375 41 782 5648', 'East', '����� �����', 77, 14),
('�������', '������', '+ 375 41 752 1224', 'South', '������� �����', 24, 89),
('������', '���������', '+ 375 41 555 4568', 'South', '������ �����', 11, 85),
('��������', '��������', '+ 375 41 321 3211', 'West', '�������� �����', 123, 52),
('�����', '����������', '+ 375 41 321 1232', 'West', '������� �����', 76, 44),
('������', '������', '+ 375 41 122 4554', 'East', '����� �����', 21, 91),
('��������', '��������', '+ 375 41 758 1667', 'North', '������� ��������', 23, 67),
('�������', '��������', '+ 375 41 765 8582', 'South', '������ �����', 62, 44),
('��������', '������', '+ 375 41 657 5528', 'South', '������� ��������', 15, 56),
('���������', '�����������', '+ 375 41 624 3643', 'South', '������ �����', 5, 13),
('���������', '�������', '+ 375 41 303 8181', 'North', '������� ��������', 18, 88),
('����', '�������', '+ 375 41 466 7562', 'North', '������� ��������', 17, 7),
('������', '������', '+ 375 41 114 7812', 'South', '������ ����� ', 18, 9);

select * from #customers


--��������� ��������
CREATE TABLE #courier_info
(courier_id INT IDENTITY(1,1) PRIMARY KEY,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(35) NOT NULL,
phone_number VARCHAR(20) NOT NULL,
delivery_type VARCHAR(6) NOT NULL);

INSERT INTO #courier_info(first_name, last_name, phone_number, delivery_type) VALUES
('������', '����', '+ 375 41 655 0954', '������'),
('��������', '��������', '+ 375 41 743 0146', '����'),
('�����', '������', '+ 375 41 107 7798', '����'),
('�����', '������', '+ 375 41 566 5516', '����'),
('�������', '�������', '+ 375 41 566 5516', '����');

select * from #courier_info

CREATE TABLE #orders
(order_id INT IDENTITY(1,1) PRIMARY KEY,
customer_id INT NOT NULL,
--date_get TIMESTAMP NOT NULL, 
date_get datetime NOT NULL, 
FOREIGN KEY (customer_id) REFERENCES #customers (customer_id));


INSERT INTO #orders(customer_id, date_get) VALUES(1, getdate());

INSERT INTO #orders(customer_id, date_get) VALUES(2, getdate());
INSERT INTO #orders(customer_id, date_get) VALUES(3, getdate());
INSERT INTO #orders(customer_id, date_get) VALUES(4, getdate());
INSERT INTO #orders(customer_id, date_get) VALUES(5, getdate());
INSERT INTO #orders(customer_id, date_get) VALUES(6, getdate());
INSERT INTO #orders(customer_id, date_get) VALUES(7, getdate());
INSERT INTO #orders(customer_id, date_get) VALUES(8, getdate());
INSERT INTO #orders(customer_id, date_get) VALUES(9, getdate());
INSERT INTO #orders(customer_id, date_get) VALUES(10, getdate());
INSERT INTO #orders(customer_id, date_get) VALUES(11, getdate());
INSERT INTO #orders(customer_id, date_get) VALUES(12, getdate());
INSERT INTO #orders(customer_id, date_get) VALUES(13, getdate());
INSERT INTO #orders(customer_id, date_get) VALUES(14, getdate());
INSERT INTO #orders(customer_id, date_get) VALUES(15, getdate());
select * from #orders
--INSERT INTO #orders(customer_id, date_get) VALUES(15, NOW());


CREATE TABLE #delivery_list
(delivery_id INT IDENTITY(1,1) PRIMARY KEY,
order_id INT UNIQUE NOT NULL,
courier_id INT NOT NULL,
--date_arrived TIMESTAMP UNIQUE,  --# the time when couriers bring ordes to clients
date_arrived datetime  NULL,  --# the time when couriers bring ordes to clients
taken VARCHAR(3) NOT NULL,--  # it means whether a client's taken its order or not
payment_method VARCHAR(4),
FOREIGN KEY (order_id) REFERENCES #orders(order_id),
FOREIGN KEY (courier_id) REFERENCES #courier_info(courier_id));


INSERT INTO #delivery_list VALUES
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

--select * from #delivery_list

CREATE TABLE #orders_products
(order_id INT NOT NULL,
product_id INT NOT NULL,
quantity INT NOT NULL,
PRIMARY KEY (order_id, product_id),
FOREIGN KEY (order_id) REFERENCES #orders(order_id),
FOREIGN KEY (product_id) REFERENCES #products(product_id));

INSERT INTO #orders_products VALUES
(1, 1, 2), (1, 4, 1), (1, 10, 1),
(2, 4, 1), (2, 5, 1), (3, 3, 1),
(4, 7, 2), (5, 2, 1), (5, 3, 1),
(6, 8, 3), (7, 1, 1), (7, 6, 4),
(8, 1, 2), (9, 2, 1), (9, 3, 1),
(10, 1, 2), (10, 2, 1),(12, 5, 2), 
(12, 10, 1),(13, 4, 2),(14, 5, 1),
(15, 8, 1), (15, 7, 2);


SELECT district, COUNT(district)
FROM #customers
GROUP BY district
ORDER BY COUNT(district) DESC


SELECT a.courier_id,b.first_name as '�������� ��������',b.last_name,b.phone_number, COUNT(order_id) as '���������� ����������� �������'
From #delivery_list a 
     left join #courier_info  b on a.courier_id=b.courier_id
WHERE date_arrived IS NOT NULL
GROUP BY a.courier_id,b.first_name,b.last_name,b.phone_number


SELECT menu_name, '+ ���� ������' as '+/-' FROM #products products
WHERE EXISTS
(SELECT * FROM #orders_products orders_products
WHERE orders_products.product_id = products.product_id)
 union all
SELECT menu_name,'- ���� ��� �������' FROM #products products
WHERE NOT EXISTS
(SELECT * FROM #orders_products orders_products
WHERE orders_products.product_id = products.product_id)


SELECT a.order_id, b.menu_name, quantity,
ROUND(price*quantity, 2) AS total_price
FROM #orders_products a
INNER JOIN #products  b ON a.product_id = b.product_id
ORDER BY order_id, quantity



/*   ������� ������� (������� ��� ����������) OVER (
[PARTITION BY ������� ��� �����������]
[ORDER BY ������� ��� ����������]
[ROWS ��� RANGE ��������� ��� ����������� ����� � �������� ������]*/
   
  --menu_name, price,weight


   SELECT 
  a.order_id, b.menu_name, quantity,
ROUND(price*quantity, 2) AS total_price
, SUM(rOUND(price*quantity, 2)) OVER(PARTITION BY  a.order_id) AS 'Sum' 
FROM #orders_products a
INNER JOIN #products  b ON a.product_id = b.product_id