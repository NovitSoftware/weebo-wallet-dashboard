SELECT 
    DA.Distrito,
    SUM(CASE WHEN FC.FlagCuponVigente = 1 THEN FC.StickersEntregados ELSE 0 END) AS TotalStickersActivos,
    SUM(CASE WHEN FC.FlagCuponVencido = 1 THEN FC.StickersEntregados ELSE 0 END) AS TotalStickersVencidos
FROM [ApployaltyDWH].[dwh].[Fact_Cupon] FC
JOIN [ApployaltyDWH].[dwh].[Dim_Afiliado] DA 
    ON FC.KeyAfiliado = DA.KeyAfiliado
GROUP BY DA.Distrito
ORDER BY DA.Distrito;

