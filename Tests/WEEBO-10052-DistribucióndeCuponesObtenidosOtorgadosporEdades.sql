SELECT 
    RE.RangoEdad,
    COUNT(CASE WHEN FC.FlagCuponVigente = 1 THEN FC.KeyCupon END) AS TotalCuponesActivos,
    COUNT(CASE WHEN FC.FlagCuponVencido = 1 THEN FC.KeyCupon END) AS TotalCuponesVencidos,
    COUNT(CASE WHEN FC.FlagCuponVigente = 0 AND FC.FlagCuponVencido = 0 THEN FC.KeyCupon END) AS TotalCuponesEnProceso
FROM [ApployaltyDWH].[dwh].[Fact_Cupon] FC
JOIN [ApployaltyDWH].[dwh].[Dim_RangoEdad] RE 
    ON FC.KeyRangoEdad = RE.KeyRangoEdad
GROUP BY RE.RangoEdad
ORDER BY RE.RangoEdad;
