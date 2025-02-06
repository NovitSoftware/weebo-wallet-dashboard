DECLARE @FechaRaiz DATE = '2019-11-30'; -- Fecha raíz
DECLARE @FechaFin DATE = '2024-11-30'; -- Fecha final

WITH FacturacionCorte AS (
    SELECT 
        SUM(ff.Importe) AS MontoTotal,
        AVG(ff.Importe) AS PromedioFacturado
    FROM dwh.Fact_Facturacion ff
    INNER JOIN dwh.Dim_Tiempo dt ON ff.KeyFechaFacturacion = dt.KeyTiempo
    WHERE dt.Fecha <= @FechaFin
),
FacturacionInicio AS (
    SELECT 
        SUM(ff.Importe) AS MontoTotal,
        AVG(ff.Importe) AS PromedioFacturado
    FROM dwh.Fact_Facturacion ff
    INNER JOIN dwh.Dim_Tiempo dt ON ff.KeyFechaFacturacion = dt.KeyTiempo
    WHERE dt.Fecha <= @FechaRaiz
)
SELECT 
    -- Monto Total Facturado
    COALESCE(FacturacionCorte.MontoTotal, 0) AS MontoTotalFacturado,

    -- Promedio Facturado
    COALESCE(FacturacionCorte.PromedioFacturado, 0) AS PromedioFacturado,

    -- Variación del monto total facturado
    COALESCE(FacturacionCorte.MontoTotal, 0) - COALESCE(FacturacionInicio.MontoTotal, 0) AS VariacionMontoFacturado
FROM FacturacionCorte, FacturacionInicio;
