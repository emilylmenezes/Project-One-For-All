SELECT
  a.artista AS artista,
  alb.album AS album,
  COUNT(s.artista_increment) AS seguidores
FROM album alb
JOIN artista a
  ON a.artista_increment = alb.artista_increment
JOIN seguindo_artistas s
  ON a.artista_increment = s.artista_increment
GROUP BY alb.id
ORDER BY seguidores DESC, artista, album;