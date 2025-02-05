-- 1.11 Clientes Activos (usaron el programa en los últimos 90 días): Número total, promedio y variación frente periodo anterior según periodo seleccionado.
-- Gráfica: Sin chart.

-- total
SELECT count(DISTINCT ae.KeyEmpresa) AS TotalClientesActivos
FROM dwh.Fact_AfiliacionEmpresa ae
WHERE DATEDIFF(DAY, ae.FechaActivo, GETDATE()) <= 90;

-- promedio 
SELECT avg(DISTINCT ae.KeyEmpresa) AS PromedioClientesActivos
FROM dwh.Fact_AfiliacionEmpresa ae
WHERE DATEDIFF(DAY, ae.FechaActivo, GETDATE()) <= 90;