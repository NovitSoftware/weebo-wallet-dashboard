-- 3.3 Ranking por Distrito: Los 3 primeros distritos que tienen m�s stickers otorgados.
-- Gr�fica: Sin chart.

SELECT TOP 3 
    DA.Distrito, 
    SUM(FC.StickersEntregados) AS TotalStickersOtorgados
FROM [ApployaltyDWH].[dwh].[Fact_Cupon] FC
JOIN [ApployaltyDWH].[dwh].[Dim_Afiliado] DA 
    ON FC.KeyAfiliado = DA.KeyAfiliado
GROUP BY DA.Distrito
ORDER BY TotalStickersOtorgados DESC, DA.Distrito ASC;
