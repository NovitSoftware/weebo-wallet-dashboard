-- 4.5 Promedio de Días hasta Obtener Cupón: Promedio de días que se demoran los clientes en llenar una tarjeta y obtener su cupón.
-- Gráfica: Sin chart.

SELECT AVG(DiasHastaObtenerCupon) AS PromedioDiasHastaObtenerCupon
FROM dwh.Fact_Cupon;
