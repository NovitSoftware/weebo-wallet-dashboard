-- 4.2 Cupones Redimidos: N�mero total de cupones redimidos.
-- Gr�fica: Sin chart.

SELECT COUNT(*) AS TotalCuponesRedimidos
FROM dwh.Fact_Cupon fc
WHERE fc.FlagCuponRedimido = 1;
