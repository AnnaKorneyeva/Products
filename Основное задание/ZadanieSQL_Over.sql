
--  Запрос по подсчету суммы заказа  и нумарация позиций в заказе и выводом способа оплаты

      SELECT * FROM  
	 ( SELECT  a.order_id, b.menu_name, quantity,SUM(ROUND(price*quantity, 2)) OVER(PARTITION BY  a.order_id) AS 'Sum' , ROUND(price*quantity, 2) AS total_price,
	  '' as phone_number,'' as first_name,
       ROW_NUMBER() OVER (PARTITION BY a.order_id ORDER BY a.order_id) AS  'Number', c.taken as taken, c.payment_method as payment_method
       FROM orders_products a INNER JOIN products  b ON a.product_id = b.product_id
                              LEFT JOIN  delivery_list c on a.order_id=c.order_id
       
	   union all

     SELECT a.order_id,  '    Итоговая сумма заказа'  as menu_name, null as quantity,SUM(ROUND(price*quantity, 2)) as 'Sum', 0 as total_price,
	 d.phone_number,d.first_name, null as  'Number',taken,c.payment_method
	 FROM orders_products a INNER JOIN products  b ON a.product_id = b.product_id
	                         LEFT JOIN  delivery_list c on a.order_id=c.order_id
                           LEFT JOIN customers  d on c.courier_id=d.customer_id
	 group by a.order_id,d.first_name,d.phone_number,taken,payment_method) a 
	-- where taken ='no'   /*Можно бобавить условие недоставленные заказы*/
	 order by order_id, quantity desc
