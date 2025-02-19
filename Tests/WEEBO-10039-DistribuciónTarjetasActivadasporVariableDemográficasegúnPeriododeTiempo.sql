-- 3.7 Distribución Tarjetas Activadas por Variable Demográfica según Periodo de Tiempo: Número total de stickers otorgados en periodos de tiempo de días, semanas o meses por variable demográfica.
-- Gráfica: Bar chart. 

SELECT dt.Fecha, SUM(fc.StickersEntregados) AS TotalStickersOtorgados
FROM dwh.Fact_Cupon fc
join dwh.Dim_Tiempo as dt on fc.KeyFechaCorte = dt.KeyTiempo
where fc.StickersEntregados is not null
group by dt.Fecha