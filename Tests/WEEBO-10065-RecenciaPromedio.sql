SELECT 
    AVG(CAST(DiasDesdeUltimoConsumo AS FLOAT)) AS RecenciaPromedio
FROM [ApployaltyDWH].[dwh].[Fact_AfiliacionEmpresa]
WHERE DiasDesdeUltimoConsumo IS NOT NULL;

