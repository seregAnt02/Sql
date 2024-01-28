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
