-- 4.1 Cupones Activos: Número total de cupones activos.
-- Gráfica: Sin chart. 

SELECT COUNT(*) AS TotalCuponesActivos
FROM dwh.Fact_Cupon as fc
WHERE fc.FechaActivacion is not null;
