-- 4.5 Promedio de D�as hasta Obtener Cup�n: Promedio de d�as que se demoran los clientes en llenar una tarjeta y obtener su cup�n.
-- Gr�fica: Sin chart.

SELECT AVG(DiasHastaObtenerCupon) AS PromedioDiasHastaObtenerCupon
FROM dwh.Fact_Cupon;
