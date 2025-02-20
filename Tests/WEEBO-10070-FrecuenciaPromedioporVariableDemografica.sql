WITH Frecuencias AS (
    -- Se agrupa la información de cada afiliado según su rango de edad y se cuenta la cantidad de registros (frecuencia)
    SELECT 
        FAE.KeyAfiliado,
        DR.RangoEdad,
        COUNT(*) AS Frecuencia
    FROM [ApployaltyDWH].[dwh].[Fact_AfiliacionEmpresa] AS FAE
    JOIN [ApployaltyDWH].[dwh].[Dim_RangoEdad] AS DR
        ON FAE.KeyRangoEdad = DR.KeyRangoEdad
    GROUP BY FAE.KeyAfiliado, DR.RangoEdad
)
-- Se calcula el promedio de la frecuencia para cada rango de edad
SELECT 
    RangoEdad,
    AVG(CAST(Frecuencia AS FLOAT)) AS FrecuenciaPromedioRangoEdades
FROM Frecuencias
GROUP BY RangoEdad
ORDER BY RangoEdad;
