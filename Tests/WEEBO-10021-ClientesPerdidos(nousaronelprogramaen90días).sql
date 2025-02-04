-- 1.13 Clientes Perdidos (no usaron el programa en 90 días): Número total, promedio y variación frente periodo anterior según periodo seleccionado.
-- Gráfica: Sin chart.

-- total
SELECT COUNT(DISTINCT aw.KeyAfiliado) AS TotalClientesPerdidos
FROM dwh.Fact_AfiliacionWebo aw
WHERE DATEDIFF(DAY, aw.FechaActivo, GETDATE()) > 90;


-- promedio
SELECT avg(DISTINCT aw.KeyAfiliado) AS TotalClientesPerdidos
FROM dwh.Fact_AfiliacionWebo aw
WHERE DATEDIFF(DAY, aw.FechaActivo, GETDATE()) > 90;