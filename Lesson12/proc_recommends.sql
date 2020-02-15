
DROP PROCEDURE IF EXISTS recommends;

delimiter //

CREATE PROCEDURE recommends(IN for_user_id INT)
BEGIN
	SELECT movies.id
	FROM movies
	WHERE movies.genre = (SELECT genre FROM movies WHERE id = (
		SELECT movie_id FROM marks WHERE user_id = for_user_id
			and likes = 1,));
END//

delimiter ;
