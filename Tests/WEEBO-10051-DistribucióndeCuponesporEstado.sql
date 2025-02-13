SELECT 
    CASE 
        WHEN FlagCuponVigente = 1 AND FlagCuponVencido = 0 THEN 'Activo'
        WHEN FlagCuponVencido = 1 THEN 'Vencido'
        ELSE 'Otro'
    END AS EstadoCupon,
    COUNT(KeyCupon) AS TotalCupones
FROM [ApployaltyDWH].[dwh].[Fact_Cupon]
GROUP BY 
    CASE 
        WHEN FlagCuponVigente = 1 AND FlagCuponVencido = 0 THEN 'Activo'
        WHEN FlagCuponVencido = 1 THEN 'Vencido'
        ELSE 'Otro'
    END
ORDER BY TotalCupones DESC;
