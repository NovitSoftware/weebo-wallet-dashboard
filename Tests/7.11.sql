-- 7.11 Facturacion Webo por Variable Demogr�fica seg�n Periodo de Tiempo: Monto total en soles por variable demogr�fica en un periodo de tiempo determinado (d�as, semanas o meses).
-- Gr�fica: Bar chart.

SELECT 
    t.Fecha,
    r.RangoEdad,
    SUM(ff.Importe) AS FacturacionTotal
FROM dwh.Fact_Facturacion ff
JOIN dwh.Dim_Tiempo t ON ff.KeyFechaFacturacion = t.KeyTiempo
JOIN dwh.Dim_RangoEdad r ON ff.KeyRangoEdad = r.KeyRangoEdad
GROUP BY t.Fecha, r.RangoEdad
ORDER BY t.Fecha DESC, r.RangoEdad;
