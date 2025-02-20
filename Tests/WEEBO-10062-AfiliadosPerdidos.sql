DECLARE @FechaInicio DATE = '2019-04-09'; -- Cambiar según el periodo deseado 
DECLARE @FechaFin DATE = '2024-12-31'; -- Cambiar según el periodo deseado 
-- 6.3 Afiliados Perdidos: Número total de afiliados que utilizaron el programa en alguna oportunidad pero no en los últimos 90 días.
SELECT COUNT(DISTINCT KeyAfiliado) AS AfiliadosPerdidos
FROM [ApployaltyDWH].[dwh].[Dim_Afiliado]
WHERE FechaUltimoConsumoWebo < DATEADD(DAY, -90, @FechaFin) AND FechaUltimoConsumoWebo BETWEEN @FechaInicio AND @FechaFin;