DECLARE @FechaRaiz DATE = '2019-11-9'; -- Fecha raíz
DECLARE @FechaFin DATE = '2024-11-30'; -- Fecha final

WITH StickersCorte AS (
    SELECT 
        fc.KeyEmpresa,
        fc.KeyAfiliado,
        MAX(fc.StickersEntregados) AS MaxStickers -- Obtener el valor máximo por afiliado y empresa
    FROM dwh.Fact_Cupon fc
    INNER JOIN dwh.Dim_Tiempo dt ON fc.KeyFechaCorte = dt.KeyTiempo
    WHERE dt.Fecha <= @FechaFin
    GROUP BY fc.KeyEmpresa, fc.KeyAfiliado
),
StickersInicio AS (
    SELECT 
        fc.KeyEmpresa,
        fc.KeyAfiliado,
        MAX(fc.StickersEntregados) AS MaxStickers
    FROM dwh.Fact_Cupon fc
    INNER JOIN dwh.Dim_Tiempo dt ON fc.KeyFechaCorte = dt.KeyTiempo
    WHERE dt.Fecha <= @FechaRaiz
    GROUP BY fc.KeyEmpresa, fc.KeyAfiliado
)
SELECT 
    -- Total Stickers Entregados
    COALESCE(SUM(StickersCorte.MaxStickers), 0) AS TotalStickersEntregados,

    -- Promedio Stickers Entregados por empresa (sin filtrar empresa)
    COALESCE(AVG(StickersCorte.MaxStickers), 0) AS PromedioStickersPorEmpresa,

    -- Variación de Stickers Entregados
    COALESCE(SUM(StickersCorte.MaxStickers), 0) - COALESCE(SUM(StickersInicio.MaxStickers), 0) AS VariacionStickers
FROM StickersCorte
LEFT JOIN StickersInicio 
    ON StickersCorte.KeyEmpresa = StickersInicio.KeyEmpresa 
    AND StickersCorte.KeyAfiliado = StickersInicio.KeyAfiliado;
