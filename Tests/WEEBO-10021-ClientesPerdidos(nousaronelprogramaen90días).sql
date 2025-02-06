-- 1.13 Clientes Perdidos (no usaron el programa en 90 días): Número total, promedio y variación frente periodo anterior según periodo seleccionado.
-- Gráfica: Sin chart.

-- total
SELECT COUNT(DISTINCT ae.KeyEmpresa) AS TotalClientesPerdidos
FROM dwh.Fact_AfiliacionEmpresa ae
WHERE DATEDIFF(DAY, ae.FechaActivo, GETDATE()) > 90;


-- promedio
SELECT avg(DISTINCT ae.KeyEmpresa) AS PromedioClientesPerdidos
FROM dwh.Fact_AfiliacionEmpresa ae
WHERE DATEDIFF(DAY, ae.FechaActivo, GETDATE()) > 90;