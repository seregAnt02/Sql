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
3.Создайте для сущности mobile_phones внешний ключ manufacturer_id (идентификатор производителя), направленный на атрибут id сущности manufacturer. Установите каскадное обновление - CASCADE, а при удалении записи из сущности manufacturer – SET NULL. 
      
Используя CRUD-операцию UPDATE обновите данные в атрибуте manufacturer_id сущности mobile_phones согласно значений, имеющихся в атрибуте manufacturer.

Удалите атрибут manufacturer из сущности mobile_phones.

Выведите идентификатор, название и идентификатор производителя сущности mobile_phones.

   * ALTER TABLE mobile_phones 
      ADD COLUMN IF NOT EXISTS manufacturer_id BIGINT,
      ADD CONSTRAINT fk_manufacturer
          FOREIGN KEY (manufacturer_id) 
          REFERENCES mobile_phones.manufacturer(id)
          ON UPDATE CASCADE ON DELETE SET NULL;
      
      UPDATE itresume9430829.mobile_phones 
          SET manufacturer_id = 3
          WHERE manufacturer = 'Apple';
      
      UPDATE itresume9430829.mobile_phones 
          SET manufacturer_id = 2
          WHERE manufacturer = 'Samsung';
      
      UPDATE itresume9430829.mobile_phones 
          SET manufacturer_id = 1
          WHERE manufacturer = 'Huawei';
      
      ALTER TABLE itresume9430829.mobile_phones 
      DROP COLUMN manufacturer;
      
      SELECT id, product_name, manufacturer_id
      FROM itresume9430829.mobile_phones;

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
