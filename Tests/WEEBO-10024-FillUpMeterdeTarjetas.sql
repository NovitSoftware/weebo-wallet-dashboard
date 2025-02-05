-- 1.16 Fill Up Meter de Tarjetas: Promedio de stickers que contienen las tarjetas totales. Se medirá en malo, regular y bueno. Cada tarjeta cuenta con un máximo de 10 stickers siendo malo de 0 a 3, regular de 4 a 6 y bueno de 7 a 10.
-- Gráfica: Meter chart.
SELECT 
    CASE 
        WHEN fp.StickersEntregados BETWEEN 0 AND 3 THEN 'Malo'
        WHEN fp.StickersEntregados BETWEEN 4 AND 6 THEN 'Regular'
        WHEN fp.StickersEntregados BETWEEN 7 AND 10 THEN 'Bueno'
    END AS Categoria,
    COUNT(*) AS TotalTarjetas,
    AVG(CAST(fp.StickersEntregados AS DECIMAL(10,2))) AS PromedioStickers
FROM dwh.Fact_Planes fp
WHERE fp.StickersEntregados IS NOT NULL
GROUP BY 
    CASE 
        WHEN fp.StickersEntregados BETWEEN 0 AND 3 THEN 'Malo'
        WHEN fp.StickersEntregados BETWEEN 4 AND 6 THEN 'Regular'
        WHEN fp.StickersEntregados BETWEEN 7 AND 10 THEN 'Bueno'
    END;
