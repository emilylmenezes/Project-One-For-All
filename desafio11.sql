SELECT
  musica AS nome_musica,
  CASE
    WHEN musica LIKE "%The Bard’s Song" THEN REPLACE(musica, 'Bard', 'QA')
    WHEN musica LIKE "%O Medo de Amar é o Medo de Ser Livre" THEN REPLACE(musica, 'Amar', 'Code Review')
    WHEN musica LIKE "%Como Nossos Pais" THEN REPLACE(musica, 'Pais', 'Pull Requests')
    WHEN musica LIKE "%BREAK MY SOUL" THEN REPLACE(musica,  'SOUL', 'CODE')
    WHEN musica LIKE "%LIEN SUPERSTAR" THEN REPLACE(musica, 'SUPERSTAR', 'SUPERDEV')
  END AS novo_nome
FROM musica
WHERE musica LIKE "%The Bard’s Song"
  OR musica LIKE  '%O Medo de Amar é o Medo de Ser Livre'
  OR musica LIKE "%Como Nossos Pais"
  OR musica LIKE "%BREAK MY SOUL"
  OR musica LIKE "%ALIEN SUPERSTAR"
ORDER BY nome_musica DESC;