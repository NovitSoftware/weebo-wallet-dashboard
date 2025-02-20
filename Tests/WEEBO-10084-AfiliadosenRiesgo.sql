DECLARE @FechaInicio DATE = '2019-04-09'; -- Cambiar según el periodo deseado 
DECLARE @FechaFin DATE = '2024-12-31'; -- Cambiar según el periodo deseado 
-- 6.4 Afiliados en Riesgo: Número total de afiliados que están cerca de pasar a afiliado perdido (entre 60 y 90 días sin consumo).
SELECT COUNT(DISTINCT KeyAfiliado) AS AfiliadosEnRiesgo
FROM [ApployaltyDWH].[dwh].[Dim_Afiliado]
WHERE FechaUltimoConsumoWebo BETWEEN DATEADD(DAY, -90, @FechaFin) AND DATEADD(DAY, -60, @FechaFin);
