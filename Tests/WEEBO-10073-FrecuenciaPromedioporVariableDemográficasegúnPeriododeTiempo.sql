-- 7.9 Frecuencia Promedio por Variable Demogr�fica seg�n Periodo de Tiempo: Frecuencia promedio por variable demogr�fica en un periodo de tiempo determinado (d�as, semanas o meses).
-- Gr�fica: Bar chart. 

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

