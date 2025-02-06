DECLARE @FechaInicio DATE = '2019-04-09';
DECLARE @FechaFin DATE = '2024-12-31';

-- Cálculo del número total de nuevos afiliados en el rango de fechas especificado
SELECT 
    COUNT(*) AS NuevosAfiliadosTotal
FROM [ApployaltyDWH].[dwh].[Dim_Afiliado]
WHERE [FechaRegistroWebo] BETWEEN @FechaInicio AND @FechaFin;

-- Cálculo de nuevos afiliados por día
WITH NuevosAfiliadosPorDia AS (
    SELECT 
        CAST([FechaRegistroWebo] AS DATE) AS FechaInicio,
        COUNT([KeyAfiliado]) AS NuevosAfiliados
    FROM [ApployaltyDWH].[dwh].[Dim_Afiliado]
    WHERE [FechaRegistroWebo] BETWEEN @FechaInicio AND @FechaFin
    GROUP BY CAST([FechaRegistroWebo] AS DATE)
)
-- Cálculo del promedio de nuevos afiliados por día
SELECT 
    AVG(NuevosAfiliados * 1.0) AS PromedioNuevosAfiliados
FROM NuevosAfiliadosPorDia;

-- Cálculo de la variación de nuevos afiliados con respecto al total de afiliados
SELECT
    -- Contamos los nuevos afiliados dentro del rango de fechas
    (SELECT COUNT(*) 
     FROM [ApployaltyDWH].[dwh].[Dim_Afiliado]
     WHERE [FechaRegistroWebo] BETWEEN @FechaInicio AND @FechaFin) AS NuevosAfiliados,

    -- Contamos el total de afiliados (sin filtros)
    (SELECT COUNT(*) 
     FROM [ApployaltyDWH].[dwh].[Dim_Afiliado]) AS CantidadTotalAfiliados,

    -- Calculamos la variación absoluta entre los nuevos afiliados y el total
    (SELECT COUNT(*) 
     FROM [ApployaltyDWH].[dwh].[Dim_Afiliado]
     WHERE [FechaRegistroWebo] BETWEEN @FechaInicio AND @FechaFin) - 
    (SELECT COUNT(*) 
     FROM [ApployaltyDWH].[dwh].[Dim_Afiliado]) AS VariacionNuevosAfiliados_Absoluta
