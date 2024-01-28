1. Используя CRUD-операцию INSERT, наполните сущность manufacturer в соответствии с данными, имеющимися в атрибуте manufacturer сущности mobile_phones.
  
-- Создание таблицы "manufacturer"
DROP TABLE IF EXISTS manufacturer;
CREATE TABLE manufacturer (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

-- Заполнение данными таблицы "manufacturer"
INSERT INTO manufacturer (name)
VALUES 
('Apple'),
('Samsung'),
('Huawei');

2. Необходимо вывести название, производителя и статус количества для мобильных телефонов.
  SELECT product_name , manufacturer,
CASE
WHEN product_count < 100
THEN 'little'
WHEN product_count > 100 and product_count <= 300
THEN 'many'
WHEN product_count > 300
THEN 'lots'
END AS status_count
FROM mobile_phones;
