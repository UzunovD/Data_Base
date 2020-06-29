CREATE OR REPLACE VIEW view_afisha
AS
SELECT
cities.name AS city,
date,
time,
theaters.name AS theater,
movies.name AS movie
FROM sessions
JOIN theaters on sessions.theater_id = theaters.id
JOIN cities on theaters.city_id = cities.id
JOIN movies on sessions.movies_id = movies.id;


