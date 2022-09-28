SELECT
username.usuarios AS usuario,
COUNT(hour.reproducoes_id) AS qt_de_musicas_ouvidas,
ROUND((SUM(tempo)) / 60, 2) AS total_minutos
FROM SpotifyClone.usuarios AS username
INNER JOIN SpotifyClone.historico_reproducao AS hour ON hour.user = username.user
INNER JOIN SpotifyClone.musica AS seconds ON seconds.reproducoes_id = hour.reproducoes_id
GROUP BY username.user
ORDER BY username.usuarios;