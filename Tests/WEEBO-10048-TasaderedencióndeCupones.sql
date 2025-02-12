-- 4.6 Tasa de redención de Cupones: Porcentaje de cuantos cupones son redimidos del total de cupones emitidos.
-- Gráfica: Sin chart.

SELECT (sum(fc.FlagCuponRedimido) * 100.0 / COUNT(*)) AS TasaRedencionCupones
FROM dwh.Fact_Cupon fc;
