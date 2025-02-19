-- 7.9 Frecuencia Promedio por Variable Demográfica según Periodo de Tiempo: Frecuencia promedio por variable demográfica en un periodo de tiempo determinado (días, semanas o meses).
-- Gráfica: Bar chart. 

SELECT 
    t.Fecha, 
    AVG(f.ConsumosPorAfiliado) AS FrecuenciaPromedio
FROM (
    SELECT 
        ff.KeyAfiliado, 
        ff.KeyFechaFacturacion, 
        COUNT(ff.KeyFactFacturacion) AS ConsumosPorAfiliado
    FROM dwh.Fact_Facturacion ff
    GROUP BY ff.KeyAfiliado, ff.KeyFechaFacturacion
) AS f
JOIN dwh.Dim_Tiempo t ON f.KeyFechaFacturacion = t.KeyTiempo
GROUP BY t.Fecha
ORDER BY t.Fecha DESC;

