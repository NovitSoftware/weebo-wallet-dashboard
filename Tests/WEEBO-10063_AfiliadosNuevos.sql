DECLARE @FechaInicio DATE = '2019-04-09'; -- Cambiar según el periodo deseado 
DECLARE @FechaFin DATE = '2024-12-31'; -- Cambiar según el periodo deseado 
-- 6.2 Afiliados Nuevos: Número total de afiliados que no han hecho uso del programa aún.
SELECT COUNT(DISTINCT KeyAfiliado) AS AfiliadosNuevos
FROM [ApployaltyDWH].[dwh].[Dim_Afiliado]
WHERE FechaUltimoConsumoWebo IS NULL AND FechaRegistroWebo BETWEEN @FechaInicio AND @FechaFin;