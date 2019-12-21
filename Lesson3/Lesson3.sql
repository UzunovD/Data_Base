/* ДЗ Написать крипт, добавляющий в БД vk, которую создали на занятии,
  3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей)*/


USE vk;

DROP TABLE IF EXISTS artists;
CREATE TABLE artists(
	id SERIAL PRIMARY KEY,
	`name` VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS music_albums;
CREATE TABLE music_albums(
	id SERIAL PRIMARY KEY,
	`name` VARCHAR(255) NOT NULL,
	artist_id BIGINT UNSIGNED,
	`year` int UNSIGNED,
	
    FOREIGN KEY (artist_id) REFERENCES artists(id)
);

DROP TABLE IF EXISTS music;
CREATE TABLE music(
	id SERIAL PRIMARY KEY,
	media_id BIGINT UNSIGNED NOT NULL,
	`name` VARCHAR(255) NOT NULL,
	artist_id BIGINT UNSIGNED,
	album_id BIGINT UNSIGNED,
	liryc TEXT,
	
	FOREIGN KEY (media_id) REFERENCES media(id),
    FOREIGN KEY (artist_id) REFERENCES artists(id),
    FOREIGN KEY (album_id) REFERENCES music_albums(id),
    
    INDEX (`name`, artist_id)
);