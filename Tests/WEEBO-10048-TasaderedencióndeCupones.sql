-- 4.6 Tasa de redenci�n de Cupones: Porcentaje de cuantos cupones son redimidos del total de cupones emitidos.
-- Gr�fica: Sin chart.

SELECT (sum(fc.FlagCuponRedimido) * 100.0 / COUNT(*)) AS TasaRedencionCupones
FROM dwh.Fact_Cupon fc;
