/*Создайте таблицу logs типа Archive. Пусть при каждом создании записи 
 * в таблицах users, catalogs и products в таблицу logs помещается время 
 * и дата создания записи, название таблицы, идентификатор первичного 
 * ключа и содержимое поля name.*/

-- подготовка базы

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
  (NULL, 'Материнские платы');

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20');

DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название',
  description TEXT COMMENT 'Описание',
  price DECIMAL (11,2) COMMENT 'Цена',
  catalog_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_catalog_id (catalog_id)
) COMMENT = 'Товарные позиции';

INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  ('Intel Core i3-8100', 'Процессор для настольных персональных компьютеров, 
основанных на платформе Intel.', 7890.00, 1),
  ('Intel Core i5-7400', 'Процессор для настольных персональных компьютеров, 
основанных на платформе Intel.', 12700.00, 1);

-- выполнение задания
 
DROP TABLE IF EXISTS logs;

CREATE TABLE logs(
tablename VARCHAR(255), primary_id INT, name VARCHAR(255),
created_at DATETIME DEFAULT CURRENT_TIMESTAMP)
ENGINE=Archive;

DELIMITER // ;

DROP TRIGGER IF EXISTS log_after_insert_to_users//

CREATE TRIGGER log_insert_to_users AFTER INSERT ON users
FOR EACH ROW BEGIN
	INSERT INTO logs (tablename, primary_id, name) 
	VALUES('users', NEW.id, NEW.name);
END//

CREATE TRIGGER log_insert_to_catalogs AFTER INSERT ON catalogs
FOR EACH ROW BEGIN
	INSERT INTO logs (tablename, primary_id, name) 
	VALUES('catalogs', NEW.id, NEW.name);
END//

CREATE TRIGGER log_insert_to_products AFTER INSERT ON products
FOR EACH ROW BEGIN
	INSERT INTO logs (tablename, primary_id, name) 
	VALUES('products', NEW.id, NEW.name);
END//

-- test

INSERT INTO catalogs VALUES
  (NULL, 'Оперативная память')//

INSERT INTO users (name, birthday_at) VALUES
  ('Мария', '1992-08-29')//

INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  ('MSI B250M GAMING PRO', 'Материнская плата MSI B250M GAMING PRO, B250, 
Socket 1151, DDR4, mATX', 5060.00, 2)//

SELECT * FROM logs//








