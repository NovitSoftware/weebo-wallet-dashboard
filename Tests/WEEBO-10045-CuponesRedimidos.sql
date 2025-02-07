-- 4.2 Cupones Redimidos: Número total de cupones redimidos.
-- Gráfica: Sin chart.

SELECT COUNT(*) AS TotalCuponesRedimidos
FROM dwh.Fact_Cupon fc
WHERE fc.FlagCuponRedimido = 1;
