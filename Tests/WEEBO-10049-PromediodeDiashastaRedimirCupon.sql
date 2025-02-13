SELECT 
    AVG(CAST(ISNULL(DiasHastaRedimirCupon, 0) AS FLOAT)) AS PromedioDiasHastaRedimirCupon
FROM [ApployaltyDWH].[dwh].[Fact_Cupon]
WHERE FlagCuponRedimido = 1;
