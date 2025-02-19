-- 7.7 Vamor Monetario Semanal Promedio por Variable Demogr�fica: Promedio de monto en soles obtenido a la semana por uso del programa por rango de edades.
-- Gr�fica: Pie chart.


SELECT 
    r.RangoEdad,
    t.A�o,
    t.Semana,
    AVG(f.Importe) AS PromedioMontoSemanal
FROM dwh.Fact_Facturacion f
INNER JOIN dwh.Dim_Tiempo t ON f.KeyFechaFacturacion = t.KeyTiempo
INNER JOIN dwh.Dim_RangoEdad r ON f.KeyRangoEdad = r.KeyRangoEdad
GROUP BY 
    r.RangoEdad,
    t.A�o,
    t.Semana
ORDER BY
    r.RangoEdad,
    t.A�o,
    t.Semana;
