SELECT 
(
	SELECT COUNT(reproducoes)
	FROM SpotifyClone.historico_reproducao
	WHERE usuarios.user = historico_reproducao.user
) AS quantidade_musicas_no_historico
FROM SpotifyClone.usuarios
WHERE usuarios = 'Barbara Liskov';