SELECT 
    DA.Genero,
    COUNT(CASE WHEN FC.FlagCuponVigente = 1 THEN FC.KeyCupon END) AS TotalCuponesActivos,
    COUNT(CASE WHEN FC.FlagCuponVencido = 1 THEN FC.KeyCupon END) AS TotalCuponesVencidos
FROM [ApployaltyDWH].[dwh].[Fact_Cupon] FC
JOIN [ApployaltyDWH].[dwh].[Dim_Afiliado] DA 
    ON FC.KeyAfiliado = DA.KeyAfiliado
GROUP BY DA.Genero
ORDER BY DA.Genero;