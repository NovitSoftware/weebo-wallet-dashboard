-- 4.3 Cupones Vencidos: Número total de cupones vencidos.
-- Gráfica: Sin chart.

SELECT COUNT(*) AS TotalCuponesVencidos
FROM dwh.Fact_Cupon
WHERE FlagCuponVencido = 1;
