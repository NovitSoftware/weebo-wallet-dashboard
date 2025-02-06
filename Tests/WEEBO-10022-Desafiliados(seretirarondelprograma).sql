-- 1.14 Desafiliados (se retiraron del programa): Número total, promedio y variación frente periodo anterior según periodo seleccionado.
-- Gráfica: Sin chart.


-- total
SELECT COUNT(DISTINCT aw.KeyEmpresa) AS TotalClientesDesafiliados
FROM dwh.Fact_AfiliacionEmpresa aw
WHERE aw.FlagDesafiliado = 1;

-- promedio 
SELECT AVG(DISTINCT aw.KeyEmpresa) AS PromedioClientesDesafiliados
FROM dwh.Fact_AfiliacionEmpresa aw
WHERE aw.FlagDesafiliado = 1;