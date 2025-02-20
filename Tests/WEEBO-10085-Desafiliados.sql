DECLARE @FechaInicio DATE = '2019-04-09'; -- Cambiar según el periodo deseado 
DECLARE @FechaFin DATE = '2024-12-31'; -- Cambiar según el periodo deseado 
-- 6.5 Desafiliados: Número total de afiliados que se retiraron del programa.
SELECT COUNT(DISTINCT KeyAfiliado) AS Desafiliados
FROM [ApployaltyDWH].[dwh].[Dim_Afiliado]
WHERE FechaBajaWebo IS NOT NULL AND FechaBajaWebo BETWEEN @FechaInicio AND @FechaFin;