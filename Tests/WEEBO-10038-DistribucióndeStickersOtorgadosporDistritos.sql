-- 3.6 Distribución de Stickers Otorgados por Distritos: Número total de stickers otorgados por distrito.
-- Gráfica: Pie chart.

SELECT 
    da.Distrito,
    SUM(COALESCE(fc.StickersEntregados, 0)) AS TotalStickersOtorgados
FROM dwh.Fact_Cupon fc
JOIN dwh.Dim_Afiliado da ON fc.KeyAfiliado = da.KeyAfiliado
GROUP BY da.Distrito
ORDER BY TotalStickersOtorgados DESC;
