-- 7.10 Valor Monetario Promedio por Variable Demográfica según Periodo de Tiempo: Monto promedio en soles por variable demográfica en un periodo de tiempo determinado (días, semanas o meses).
-- Gráfica: Bar chart. 

SELECT 
    t.Fecha, 
    AVG(f.ImportePromedio) AS ValorMonetarioPromedio
FROM (
    SELECT 
        ff.KeyAfiliado, 
        ff.KeyFechaFacturacion, 
        SUM(ff.Importe) AS ImportePromedio
    FROM dwh.Fact_Facturacion ff
    GROUP BY ff.KeyAfiliado, ff.KeyFechaFacturacion
) AS f
JOIN dwh.Dim_Tiempo t ON f.KeyFechaFacturacion = t.KeyTiempo
GROUP BY t.Fecha
ORDER BY t.Fecha DESC;
