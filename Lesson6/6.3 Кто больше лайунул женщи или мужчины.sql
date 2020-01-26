-- Определить кто больше поставил лайков (всего) - мужчины или женщины?

USE vk;

SELECT 
	gender,
	COUNT(*) as c 
FROM profiles
WHERE user_id in (SELECT user_id
FROM likes)
GROUP BY gender -- большинство сверху
-- LIMIT 1 - Выводим строку с максимальнЫМ количеством
