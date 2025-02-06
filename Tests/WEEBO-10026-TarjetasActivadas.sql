DECLARE @FechaInicio DATE = '2019-04-09'; -- Cambiar según el periodo deseado
DECLARE @FechaFin DATE = '2024-12-31';    -- Cambiar según el periodo deseado

-- Número total de tarjetas activadas dentro del rango de fechas
SELECT 
    COUNT(*) AS TotalTarjetasActivadas
FROM [ApployaltyDWH].[dwh].[Dim_Tarjeta]
WHERE [FechaActivo] BETWEEN @FechaInicio AND @FechaFin
    AND [FechaActivo] IS NOT NULL;

-- Promedio de tarjetas activadas por día (considerando solo los días dentro del rango de fechas)
WITH TarjetasActivadasPorDia AS (
    SELECT 
        CAST([FechaActivo] AS DATE) AS FechaActivoDia,
        COUNT([KeyTarjeta]) AS TarjetasActivadas
    FROM [ApployaltyDWH].[dwh].[Dim_Tarjeta]
    WHERE [FechaActivo] BETWEEN @FechaInicio AND @FechaFin
    GROUP BY CAST([FechaActivo] AS DATE)
)
SELECT 
    AVG(TarjetasActivadas) AS PromedioTarjetasActivadas
FROM TarjetasActivadasPorDia;

-- Variación de tarjetas activadas con respecto al periodo anterior
WITH TarjetasActivadasPorPeriodo AS (
    SELECT 
        YEAR([FechaActivo]) AS Año,
        MONTH([FechaActivo]) AS Mes,
        COUNT([KeyTarjeta]) AS TarjetasActivadas
    FROM [ApployaltyDWH].[dwh].[Dim_Tarjeta]
    WHERE [FechaActivo] BETWEEN @FechaInicio AND @FechaFin
    GROUP BY YEAR([FechaActivo]), MONTH([FechaActivo])
)
SELECT
    Año,
    Mes,
    TarjetasActivadas,
    LAG(TarjetasActivadas) OVER (ORDER BY Año, Mes) AS TarjetasActivadasPeriodoAnterior,
    (TarjetasActivadas - LAG(TarjetasActivadas) OVER (ORDER BY Año, Mes)) AS VariacionTarjetasActivadas
FROM TarjetasActivadasPorPeriodo;
