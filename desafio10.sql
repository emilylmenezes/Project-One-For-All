SELECT
  s.musica AS nome,
  COUNT(*) AS reproducoes
FROM historico_reproducao hr
JOIN musica s
  ON hr.reproducoes_id = s.reproducoes_id
JOIN usuarios u
  ON hr.user = u.user
JOIN planos p
  ON p.id = u.id
WHERE p.planos IN("gratuito", "pessoal")
GROUP BY nome
ORDER BY nome;