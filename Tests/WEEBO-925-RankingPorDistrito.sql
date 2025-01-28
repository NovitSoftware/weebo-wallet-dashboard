SELECT top 3 da.Distrito, SUM(fp.TarjetasActivadas) AS 'Ranking'
FROM dwh.Fact_AfiliacionEmpresa fae
INNER JOIN dwh.Fact_Planes fp ON fp.KeyEmpresa = fae.KeyEmpresa
INNER JOIN dwh.Dim_Afiliado da ON fae.KeyAfiliado = da.keyAfiliado
WHERE fae.FlagActivo = 1
GROUP BY da.Distrito
ORDER BY 'Ranking' DESC ;