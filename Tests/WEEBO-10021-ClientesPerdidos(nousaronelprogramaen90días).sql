-- 1.13 Clientes Perdidos (no usaron el programa en 90 d�as): N�mero total, promedio y variaci�n frente periodo anterior seg�n periodo seleccionado.
-- Gr�fica: Sin chart.

-- total
SELECT COUNT(DISTINCT ae.KeyEmpresa) AS TotalClientesPerdidos
FROM dwh.Fact_AfiliacionEmpresa ae
WHERE DATEDIFF(DAY, ae.FechaActivo, GETDATE()) > 90;


-- promedio
SELECT avg(DISTINCT ae.KeyEmpresa) AS PromedioClientesPerdidos
FROM dwh.Fact_AfiliacionEmpresa ae
WHERE DATEDIFF(DAY, ae.FechaActivo, GETDATE()) > 90;