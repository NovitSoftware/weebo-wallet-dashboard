-- 4.1 Cupones Activos: N�mero total de cupones activos.
-- Gr�fica: Sin chart. 

SELECT COUNT(*) AS TotalCuponesActivos
FROM dwh.Fact_Cupon as fc
WHERE fc.FechaActivacion is not null;
