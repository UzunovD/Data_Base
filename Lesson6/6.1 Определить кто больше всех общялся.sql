/*Пусть задан некоторый пользователь. Из всех друзей этого пользователя 
 *найдите человека, который больше всех общался с нашим пользователем.*/
USE vk;
SELECT from_user_id, count(*) as c
		FROM messages
		WHERE to_user_id = 3
		GROUP BY from_user_id	
		ORDER BY c DESC 
		LIMIT 1)