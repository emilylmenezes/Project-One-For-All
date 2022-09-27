SELECT
username.usuarios AS usuario,
COUNT(hour.reproducoes) AS qt_de_musicas_ouvidas,
ROUND((SUM(tempo)) / 60, 2) AS total_minutos
FROM SpotifyClone.usuarios AS username
INNER JOIN SpotifyClone.historico_reproducao AS hour ON hour.user = username.user
INNER JOIN SpotifyClone.musica AS seconds ON seconds.reproducoes = hour.reproducoes
GROUP BY username.user
ORDER BY username.usuarios;