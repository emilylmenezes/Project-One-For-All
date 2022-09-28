SELECT song.musica AS 'cancao', COUNT(r.reproducao) AS 'reproducoes'
FROM SpotifyClone.musica song
INNER JOIN SpotifyClone.historico_reproducao r ON song.reproducoes_id = r.reproducoes_id
GROUP BY song.musica
ORDER BY reproducoes DESC, cancao
LIMIT 2;