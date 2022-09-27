SELECT u.usuarios AS usuario,
IF(MAX(YEAR(h.reproducao)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario 
FROM SpotifyClone.usuarios AS u
INNER JOIN SpotifyClone.historico_reproducao AS h ON u.user = h.user
GROUP BY u.usuarios
ORDER BY u.usuarios;