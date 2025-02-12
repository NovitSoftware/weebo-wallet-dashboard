-- 4.4 Ranking por Distrito: Los 3 primeros distritos que tiene más cupones otorgados.
-- Gráfica: Sin chart.

SELECT TOP 3 
    a.Distrito, 
    COUNT(fc.KeyCupon) AS TotalCuponesOtorgados
FROM dwh.Fact_Cupon fc
JOIN dwh.Dim_Afiliado a ON fc.KeyAfiliado = a.KeyAfiliado
GROUP BY a.Distrito
ORDER BY TotalCuponesOtorgados DESC;

