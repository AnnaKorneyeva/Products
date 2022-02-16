#### Products
  База данных на  примере службы доставки 
  
###### Создание таблиц 
  products
  customers
  courier_info
  orders
  delivery_list
  orders_products
    
  ###### Запросы
    1. Запрос по подсчету выполненных заказов работниками доставки      
    
    SELECT a.courier_id,b.first_name as 'Работник доставки',b.last_name,b.phone_number, COUNT(order_id) as 'Количество выполненных заказов'
    FROM #delivery_list a 
       LEFT join #courier_info  b on a.courier_id=b.courier_id
   WHERE date_arrived IS NOT NULL
   GROUP BY a.courier_id,b.first_name,b.last_name,b.phone_number
   
     2. запрос по анализу востребованности позиций в меню (есть или нет заказов)
     
      SELECT menu_name, '+ Есть заказы' as '+/-' FROM #products products
      WHERE EXISTS
      (SELECT * FROM #orders_products orders_products
      WHERE orders_products.product_id = products.product_id)
      
      UNION ALL
     
     SELECT menu_name,'- Пока нет заказов' FROM #products products
     WHERE NOT EXISTS
     (SELECT * FROM #orders_products orders_products
     WHERE orders_products.product_id = products.product_id)
     
     3. Запрос по подсчету суммы заказа и нумарация позиций в заказах
     
        SELECT  a.order_id, b.menu_name, quantity, ROUND(price*quantity, 2) AS total_price,
         SUM(rOUND(price*quantity, 2)) OVER(PARTITION BY  a.order_id) AS 'Sum' ,
         ROW_NUMBER() OVER (PARTITION BY a.order_id ORDER BY a.order_id) AS 'Number'
         FROM #orders_products a  INNER JOIN #products  b ON a.product_id = b.product_id
     
   
  

