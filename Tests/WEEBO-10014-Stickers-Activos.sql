DECLARE @FechaInicio DATE = '2019-04-09'; -- Cambiar según el periodo deseado
DECLARE @FechaFin DATE = '2023-11-30';

-- Total de Stickers Activos en el periodo actual
WITH StickersActivosActual AS (
    SELECT 
        COUNT(*) AS TotalActual
    FROM Apployalty.dbo.tarjeta
    WHERE fecactivo BETWEEN @FechaInicio AND @FechaFin
          AND activo = 's'
),
-- Total de Stickers Activos en el mismo periodo del año anterior
StickersActivosAnterior AS (
    SELECT 
        COUNT(*) AS TotalAnterior
    FROM Apployalty.dbo.tarjeta
    WHERE fecactivo BETWEEN DATEADD(YEAR, -1, @FechaInicio) AND DATEADD(YEAR, -1, @FechaFin)
          AND activo = 's'
),
-- Promedio de Stickers Activos por día en el periodo actual
PromedioStickersActivos AS (
    SELECT 
        AVG(TotalDiario) AS PromedioActual
    FROM (
        SELECT 
            fecactivo, 
            COUNT(*) AS TotalDiario
        FROM Apployalty.dbo.tarjeta
        WHERE fecactivo BETWEEN @FechaInicio AND @FechaFin
              AND activo = 's'
        GROUP BY fecactivo
    ) Diario
)
-- Cálculo final: Total, Promedio y Variación
SELECT 
    (SELECT TotalActual FROM StickersActivosActual) AS TotalStickersActivos,
    (SELECT PromedioActual FROM PromedioStickersActivos) AS PromedioStickersActivos,
    CASE 
        WHEN (SELECT TotalAnterior FROM StickersActivosAnterior) = 0 THEN 0
        ELSE 
            (SELECT TotalActual FROM StickersActivosActual) - (SELECT TotalAnterior FROM StickersActivosAnterior)
    END AS VariacionStickersActivosAbsoluta,
    CASE 
        WHEN (SELECT TotalAnterior FROM StickersActivosAnterior) = 0 THEN 0
        ELSE 
            CAST(
                ((SELECT TotalActual FROM StickersActivosActual) - (SELECT TotalAnterior FROM StickersActivosAnterior)) * 100.0 /
                (SELECT TotalAnterior FROM StickersActivosAnterior) 
                AS DECIMAL(10, 2)
            )
    END AS VariacionStickersActivosPorcentual;
