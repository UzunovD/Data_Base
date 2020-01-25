/*Подсчитайте количество дней рождения, которые приходятся на каждый 
 * из дней недели. Следует учесть, что необходимы дни недели текущего года,
 *  а не года рождения.
*/

DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;
USE shop;

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
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Геннадий', '1990-10-13'),
  ('Наталья', '1984-11-03'),
  ('Александр', '1985-05-25'),
  ('Сергей', '1988-02-04'),
  ('Иван', '1998-01-16'),
  ('Мария', '1992-08-20'),
  ('Мария', '1992-08-29');

SELECT COUNT(*), DAYNAME(CONCAT(YEAR(NOW()),SUBSTRING(birthday_at, 5,6)))
AS day_week FROM users GROUP BY day_week;

