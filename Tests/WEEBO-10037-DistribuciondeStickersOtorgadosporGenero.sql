-- 3.5 Distribución de Stickers Otorgados por Género: Número total de stickers otorgado por género.
-- Gráfica: Pie chart. 

SELECT 
    da.Genero,
    SUM(COALESCE(fc.StickersEntregados, 0)) AS TotalStickersOtorgados
FROM dwh.Fact_Cupon fc
JOIN dwh.Dim_Afiliado da ON fc.KeyAfiliado = da.KeyAfiliado
GROUP BY da.Genero
ORDER BY TotalStickersOtorgados DESC;
