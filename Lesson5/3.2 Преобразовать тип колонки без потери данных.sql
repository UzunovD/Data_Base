/*Таблица users была неудачно спроектирована. 
 * Записи created_at и updated_at были заданы типом 
 * VARCHAR и в них долгое время помещались значения 
 * в формате "20.10.2017 8:10". Необходимо преобразовать
 *  поля к типу DATETIME, сохранив введеные ранее значения.
*/

DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;
USE shop;

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела',
  UNIQUE unique_name(name(10))
) COMMENT = 'Разделы интернет-магазина';

INSERT INTO catalogs VALUES
  (NULL, 'Процессоры'),
  (NULL, 'Материнские платы'),
  (NULL, 'Видеокарты'),
  (NULL, 'Жесткие диски'),
  (NULL, 'Оперативная память');

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at VARCHAR(55) DEFAULT '20.10.2017 8:10',
  updated_at VARCHAR(55) DEFAULT '20.10.2017 8:10'
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');

ALTER TABLE users 
ADD (
  created_at_1 DATETIME,
  updated_at_1 DATETIME
  );

UPDATE users
SET
  created_at_1 = STR_TO_DATE(created_at, '%d.%m.%Y %h:%i'),
  updated_at_1 = STR_TO_DATE(updated_at, '%d.%m.%Y %h:%i');

ALTER TABLE users DROP column created_at;
ALTER TABLE users DROP column updated_at;

ALTER TABLE users CHANGE created_at_1 created_at DATETIME;
ALTER TABLE users CHANGE updated_at_1 updated_at DATETIME;