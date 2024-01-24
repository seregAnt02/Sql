Урок 2. SQL – создание объектов, изменение данных, логические операторы
##### Dmz:
Вывод статуса количества мобильных телефонов

1.
2. SELECT product_name , product_count,
CASE
WHEN product_count < 2
THEN 'little'
WHEN (product_count > 1 and product_count <= 3)
THEN 'many'
WHEN product_count > 3
THEN 'lots'
END AS product_status
FROM mobile_phones;
3.
4. SELECT id , 
CASE
WHEN order_status = 'OPEN'
THEN 'Order is in open state'
WHEN order_status = 'CLOSED'
THEN 'Order is closed'
WHEN order_status = 'CANCELLED'
THEN 'Order is cancelled'
END AS order_status
FROM orders;
