
WITH MaxStickersPorAfiliado AS (
    SELECT 
        KeyEmpresa, 
        KeyAfiliado, 
        MAX(StickersActivos) AS MaxStickers
    FROM dwh.Fact_Cupon
    GROUP BY KeyEmpresa, KeyAfiliado
)
SELECT SUM(MaxStickers) AS TotalStickersActivos
FROM MaxStickersPorAfiliado;

WITH MaxStickersPorAfiliado AS (
    SELECT 
        KeyAfiliado, 
        MAX(StickersActivos) AS MaxStickers
    FROM dwh.Fact_Cupon
    GROUP BY KeyAfiliado
)
SELECT AVG(MaxStickers) AS PromedioStickersGeneral
FROM MaxStickersPorAfiliado;

DECLARE @FechaRaiz DATE = '2019-11-09';  
DECLARE @FechaFin DATE = '2024-11-30';  

WITH StickersInicio AS (
    SELECT 
        fc.KeyAfiliado, 
        MAX(fc.StickersActivos) AS MaxStickersInicio
    FROM dwh.Fact_Cupon fc
    INNER JOIN dwh.Dim_Tiempo dt ON fc.KeyFechaCorte = dt.KeyTiempo
    WHERE dt.Fecha <= @FechaRaiz
    GROUP BY fc.KeyAfiliado
),
StickersFin AS (
    SELECT 
        fc.KeyAfiliado, 
        MAX(fc.StickersActivos) AS MaxStickersFin
    FROM dwh.Fact_Cupon fc
    INNER JOIN dwh.Dim_Tiempo dt ON fc.KeyFechaCorte = dt.KeyTiempo
    WHERE dt.Fecha <= @FechaFin
    GROUP BY fc.KeyAfiliado
)
SELECT 
    COALESCE(SUM(MaxStickersFin), 0) - COALESCE(SUM(MaxStickersInicio), 0) AS VariacionStickersActivos
FROM StickersInicio
FULL JOIN StickersFin ON StickersInicio.KeyAfiliado = StickersFin.KeyAfiliado;

