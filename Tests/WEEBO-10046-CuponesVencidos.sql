-- 4.3 Cupones Vencidos: N�mero total de cupones vencidos.
-- Gr�fica: Sin chart.

SELECT COUNT(*) AS TotalCuponesVencidos
FROM dwh.Fact_Cupon
WHERE FlagCuponVencido = 1;
