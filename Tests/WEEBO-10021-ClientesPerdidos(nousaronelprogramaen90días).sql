-- 1.13 Clientes Perdidos (no usaron el programa en 90 d�as): N�mero total, promedio y variaci�n frente periodo anterior seg�n periodo seleccionado.
-- Gr�fica: Sin chart.

-- total
SELECT COUNT(DISTINCT aw.KeyAfiliado) AS TotalClientesPerdidos
FROM dwh.Fact_AfiliacionWebo aw
WHERE DATEDIFF(DAY, aw.FechaActivo, GETDATE()) > 90;


-- promedio
SELECT avg(DISTINCT aw.KeyAfiliado) AS TotalClientesPerdidos
FROM dwh.Fact_AfiliacionWebo aw
WHERE DATEDIFF(DAY, aw.FechaActivo, GETDATE()) > 90;