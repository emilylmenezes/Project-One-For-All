SELECT artista.artista, album.album
FROM SpotifyClone.artista AS artista
INNER JOIN SpotifyClone.album AS album
ON artista.artista_increment = album.artista_increment
WHERE artista = 'Elis Regina';