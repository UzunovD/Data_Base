/*(по желанию) Пусть имеется таблица рейсов flights (id, from, to) и 
 * таблица городов cities (label, name). Поля from, to и label содержат 
 * английские названия городов, поле name — русское. Выведите список рейсов 
 * flights с русскими названиями городов.*/

DROP DATABASE IF EXISTS flights_bd;
CREATE DATABASE flights_bd;
USE flights_bd;

DROP TABLE IF EXISTS flights;
CREATE TABLE flights(
	id SERIAL PRIMARY KEY,
	`from` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
	`to` varchar(25) COLLATE utf8_unicode_ci NOT NULL);

INSERT INTO flights
	(`from`, `to`)
VALUES
	('moscow','omsk'),
	('novgorod','kazan'),
	('irkutsk','moscow'),
	('omsk','irkutsk'),
	('moscow','kazan');
	
DROP TABLE IF EXISTS cities;
CREATE TABLE cities(
	label varchar(25) COLLATE utf8_unicode_ci NOT NULL,
	name varchar(25) COLLATE utf8_unicode_ci NOT NULL);

INSERT INTO cities 
	(label, name)
VALUES
	('moscow','Москва'),
	('irkutsk','Иркутск'),
	('novgorod','Новгород'),
	('kazan','Казань'),
	('omsk','Омск');

SELECT 
	f.id, c_from.name, c_to.name
FROM 
	flights AS f
JOIN 
	cities AS c_from 
	ON 
		c_from.label = f.`from`
JOIN 
	cities AS c_to 
	ON 
		c_to.label = f.`to`
ORDER BY f.id
	
