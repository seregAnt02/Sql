Урок 2. SQL – создание объектов, изменение данных, логические операторы
##### Dmz:
Вывод статуса количества мобильных телефонов

SELECT product_name , product_count,
CASE
WHEN product_count < 2
THEN 'little'
WHEN (product_count > 1 and product_count <= 3)
THEN 'many'
WHEN product_count > 3
THEN 'lots'
END AS product_status
FROM mobile_phones;
