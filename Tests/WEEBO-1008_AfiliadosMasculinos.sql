DECLARE @FechaInicio DATE = '2019-04-09'; -- Cambiar según el periodo deseado 
DECLARE @FechaFin DATE = '2024-12-31'; -- Cambiar según el periodo deseado 
-- 6.6 Afiliados Masculinos: Número total de afiliados masculinos.
SELECT COUNT(DISTINCT KeyAfiliado) AS AfiliadosMasculinos
FROM [ApployaltyDWH].[dwh].[Dim_Afiliado]
WHERE Genero = 'MASCULINO' AND FechaRegistroWebo BETWEEN @FechaInicio AND @FechaFin;
