-- 1.11 Clientes Activos (usaron el programa en los �ltimos 90 d�as): N�mero total, promedio y variaci�n frente periodo anterior seg�n periodo seleccionado.
-- Gr�fica: Sin chart.

-- total
SELECT count(DISTINCT ae.KeyEmpresa) AS TotalClientesActivos
FROM dwh.Fact_AfiliacionEmpresa ae
WHERE DATEDIFF(DAY, ae.FechaActivo, GETDATE()) <= 90;

-- promedio 
SELECT avg(DISTINCT ae.KeyEmpresa) AS PromedioClientesActivos
FROM dwh.Fact_AfiliacionEmpresa ae
WHERE DATEDIFF(DAY, ae.FechaActivo, GETDATE()) <= 90;