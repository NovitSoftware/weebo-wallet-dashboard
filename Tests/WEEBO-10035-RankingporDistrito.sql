-- 3.3 Ranking por Distrito: Los 3 primeros distritos que tienen más stickers otorgados.
-- Gráfica: Sin chart.

SELECT TOP 3 
    a.Distrito,
    SUM(COALESCE(fc.StickersEntregados, 0)) AS TotalStickersOtorgados
FROM dwh.Fact_Cupon fc
JOIN dwh.Dim_Afiliado a
  ON fc.KeyAfiliado = a.KeyAfiliado
GROUP BY a.Distrito
ORDER BY TotalStickersOtorgados DESC;
