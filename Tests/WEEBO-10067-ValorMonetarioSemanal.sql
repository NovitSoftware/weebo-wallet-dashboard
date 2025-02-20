DECLARE @FechaSeleccionada DATE = '2019-09-14';  -- Fecha seleccionada 
DECLARE @SemanaSeleccionada INT;



-- Obtener la semana de la fecha seleccionada
SET @SemanaSeleccionada = (SELECT Semana FROM [ApployaltyDWH].[dwh].[Dim_Tiempo]
                           WHERE Fecha = @FechaSeleccionada);

-- Obtener las fechas y KeyTiempo correspondientes a esa semana
WITH KeyTiempoSemana AS (
    SELECT [KeyTiempo]
    FROM [ApployaltyDWH].[dwh].[Dim_Tiempo]
    WHERE Semana = @SemanaSeleccionada
)
-- Obtener los importes asociados a esas KeyTiempo
SELECT ff.[Importe], ff.[KeyFechaFacturacion], dt.[Fecha], dt.[KeyTiempo]
FROM [ApployaltyDWH].[dwh].[Fact_Facturacion] ff
INNER JOIN KeyTiempoSemana ks ON ff.[KeyFechaFacturacion] = ks.[KeyTiempo]
INNER JOIN [ApployaltyDWH].[dwh].[Dim_Tiempo] dt ON ff.[KeyFechaFacturacion] = dt.[KeyTiempo]
ORDER BY dt.[Fecha];


-- Obtener la semana de la fecha seleccionada
SET @SemanaSeleccionada = (SELECT Semana FROM [ApployaltyDWH].[dwh].[Dim_Tiempo]
                           WHERE Fecha = @FechaSeleccionada);


-- Obtener la semana de la fecha seleccionada
SET @SemanaSeleccionada = (SELECT Semana FROM [ApployaltyDWH].[dwh].[Dim_Tiempo]
                           WHERE Fecha = @FechaSeleccionada);

-- Obtener el promedio de los importes asociados a esas KeyTiempo
WITH KeyTiempoSemana AS (
    SELECT [KeyTiempo]
    FROM [ApployaltyDWH].[dwh].[Dim_Tiempo]
    WHERE Semana = @SemanaSeleccionada
)
SELECT AVG(ff.[Importe]) AS PromedioImporte
FROM [ApployaltyDWH].[dwh].[Fact_Facturacion] ff
INNER JOIN KeyTiempoSemana ks ON ff.[KeyFechaFacturacion] = ks.[KeyTiempo];
