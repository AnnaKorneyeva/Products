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
