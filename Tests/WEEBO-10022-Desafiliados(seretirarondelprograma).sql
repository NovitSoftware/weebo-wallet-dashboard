-- 1.14 Desafiliados (se retiraron del programa): N�mero total, promedio y variaci�n frente periodo anterior seg�n periodo seleccionado.
-- Gr�fica: Sin chart.


-- total
SELECT COUNT(DISTINCT aw.KeyEmpresa) AS TotalClientesDesafiliados
FROM dwh.Fact_AfiliacionEmpresa aw
WHERE aw.FlagDesafiliado = 1;

-- promedio 
SELECT AVG(DISTINCT aw.KeyEmpresa) AS PromedioClientesDesafiliados
FROM dwh.Fact_AfiliacionEmpresa aw
WHERE aw.FlagDesafiliado = 1;