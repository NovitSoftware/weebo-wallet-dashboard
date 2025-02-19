-- 7.11 Facturacion Webo por Variable Demográfica según Periodo de Tiempo: Monto total en soles por variable demográfica en un periodo de tiempo determinado (días, semanas o meses).
-- Gráfica: Bar chart.

SELECT 
    t.Fecha,
    r.RangoEdad,
    SUM(ff.Importe) AS FacturacionTotal
FROM dwh.Fact_Facturacion ff
JOIN dwh.Dim_Tiempo t ON ff.KeyFechaFacturacion = t.KeyTiempo
JOIN dwh.Dim_RangoEdad r ON ff.KeyRangoEdad = r.KeyRangoEdad
GROUP BY t.Fecha, r.RangoEdad
ORDER BY t.Fecha DESC, r.RangoEdad;
