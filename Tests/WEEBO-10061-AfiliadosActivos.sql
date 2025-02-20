DECLARE @FechaInicio DATE = '2019-04-09'; -- Cambiar según el periodo deseado 
DECLARE @FechaFin DATE = '2024-12-31'; -- Cambiar según el periodo deseado 
-- 6.1 Afiliados Activos: Número total de afiliados que han usado el programa en los últimos 90 días.
SELECT COUNT(DISTINCT KeyAfiliado) AS AfiliadosActivos
FROM [ApployaltyDWH].[dwh].[Dim_Afiliado]
WHERE FechaUltimoConsumoWebo BETWEEN DATEADD(DAY, -90, @FechaFin) AND @FechaFin;
