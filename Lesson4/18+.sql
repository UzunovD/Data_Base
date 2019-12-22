/*Написать скрипт, отмечающий несовершеннолетних пользователей
 *  как неактивных (поле is_active = true). При необходимости
 *  предварительно добавить такое поле в таблицу profiles со 
 * значением по умолчанию = false (или 0)*/
USE vk;

ALTER TABLE profiles ADD is_inactive BOOL DEFAULT FALSE NOT NULL; -- добавление столбца в базу

UPDATE profiles SET is_inactive = TRUE
	WHERE ((YEAR(CURRENT_DATE)-YEAR(birthday))-(RIGHT(CURRENT_DATE,5)
	<RIGHT(birthday,5))<18);
