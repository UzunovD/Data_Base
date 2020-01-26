/*Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..
*/
USE vk;

SELECT count(*) as c
FROM likes
WHERE user_id in (SELECT user_id
		FROM profiles
		WHERE (birthday + INTERVAL 10 YEAR) > NOW())
