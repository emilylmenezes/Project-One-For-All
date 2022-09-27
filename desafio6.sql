SELECT FORMAT(MIN(p.value_plans), 2) AS 'faturamento_minimo',
MAX(p.value_plans) AS 'faturamento_maximo',
ROUND(AVG(p.value_plans), 2) AS 'faturamento_medio',
TRUNCATE(SUM(p.value_plans), 2) AS 'faturamento_total'
FROM SpotifyClone.planos AS p
INNER JOIN SpotifyClone.usuarios AS u ON p.id = u.id;