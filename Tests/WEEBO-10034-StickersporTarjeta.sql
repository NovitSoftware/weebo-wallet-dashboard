-- 3.2 Stickers por Tarjeta: Promedio de stickers otorgados por el total de tarjetas activas.
-- Gráfica: Sin chart. 

SELECT 
    SUM(COALESCE(fp.StickersEntregados, 0)) * 1.0 / NULLIF(SUM(fp.TarjetasActivadas), 0) AS PromedioStickersPorTarjeta
FROM dwh.Fact_Planes fp;


