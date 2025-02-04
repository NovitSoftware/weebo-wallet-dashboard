-- 1.12 Clientes en Riesgo (está cerca a los 90 días sin usar el programa): Número total, promedio y variación frente periodo anterior según periodo seleccionado.
-- Gráfica: Sin chart.
-- total
SELECT COUNT(DISTINCT aw.KeyAfiliado) AS TotalClientesEnRiesgo
FROM dwh.Fact_AfiliacionWebo aw
WHERE DATEDIFF(DAY, aw.FechaActivo, GETDATE()) BETWEEN 75 AND 90;

-- promedio 
SELECT avg(DISTINCT aw.KeyAfiliado) AS TotalClientesEnRiesgo
FROM dwh.Fact_AfiliacionWebo aw
WHERE DATEDIFF(DAY, aw.FechaActivo, GETDATE()) BETWEEN 75 AND 90;