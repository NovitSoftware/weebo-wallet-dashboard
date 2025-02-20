DECLARE @FechaActual DATETIME = GETDATE();  -- Fecha actual para calcular la recencia

SELECT 
    RRE.RangoEdad,
    AVG(DATEDIFF(DAY, FAE.FechaUltimoConsumoWebo, @FechaActual)) AS RecenciaPromedio
FROM [ApployaltyDWH].[dwh].[Dim_Afiliado] FAE
JOIN [ApployaltyDWH].[dwh].[Dim_RangoEdad] RRE
    ON (FAE.Edad BETWEEN RRE.LimiteInferior AND RRE.LimiteSuperior) 
    OR (RRE.RangoEdad = '> 60' AND FAE.Edad >= 61)  -- Para el rango de >60 años
WHERE FAE.FechaUltimoConsumoWebo IS NOT NULL
GROUP BY RRE.KeyRangoEdad, RRE.RangoEdad   -- Incluir KeyRangoEdad en GROUP BY
ORDER BY RRE.KeyRangoEdad;  -- Ahora puede usarse en ORDER BY
