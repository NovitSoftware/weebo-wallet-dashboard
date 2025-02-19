-- 7.10 Valor Monetario Promedio por Variable Demogr�fica seg�n Periodo de Tiempo: Monto promedio en soles por variable demogr�fica en un periodo de tiempo determinado (d�as, semanas o meses).
-- Gr�fica: Bar chart. 

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
