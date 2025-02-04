-- 1.12 Clientes en Riesgo (est� cerca a los 90 d�as sin usar el programa): N�mero total, promedio y variaci�n frente periodo anterior seg�n periodo seleccionado.
-- Gr�fica: Sin chart.
-- total
SELECT COUNT(DISTINCT aw.KeyAfiliado) AS TotalClientesEnRiesgo
FROM dwh.Fact_AfiliacionWebo aw
WHERE DATEDIFF(DAY, aw.FechaActivo, GETDATE()) BETWEEN 75 AND 90;

-- promedio 
SELECT avg(DISTINCT aw.KeyAfiliado) AS TotalClientesEnRiesgo
FROM dwh.Fact_AfiliacionWebo aw
WHERE DATEDIFF(DAY, aw.FechaActivo, GETDATE()) BETWEEN 75 AND 90;