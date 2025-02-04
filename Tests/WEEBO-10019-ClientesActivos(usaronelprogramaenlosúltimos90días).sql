-- 1.11 Clientes Activos (usaron el programa en los �ltimos 90 d�as): N�mero total, promedio y variaci�n frente periodo anterior seg�n periodo seleccionado.
-- Gr�fica: Sin chart.-- totalSELECT COUNT(a.KeyAfiliado) AS TotalClientesActivos
FROM dwh.Dim_Afiliado a
join dwh.Fact_AfiliacionWebo aw on aw.KeyAfiliado = a.KeyAfiliado
WHERE DATEDIFF(DAY, aw.FechaActivo, GETDATE()) <= 90
group by a.keyafiliado;

-- promedio
SELECT avg(a.KeyAfiliado) AS PromedioClientesActivos
FROM dwh.Dim_Afiliado a
join dwh.Fact_AfiliacionWebo aw on aw.KeyAfiliado = a.KeyAfiliado
WHERE DATEDIFF(DAY, aw.FechaActivo, GETDATE()) <= 90
group by a.keyafiliado;