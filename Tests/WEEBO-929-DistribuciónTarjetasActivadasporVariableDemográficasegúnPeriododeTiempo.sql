-- 2.7 Distribución Tarjetas Activadas por Variable Demográfica según Periodo de Tiempo:
-- Número total de tarjetas activadas en periodos de tiempo de días, semanas o meses por variable demográfica.
-- Gráfica: Pie chart. 

select dt.Fecha, SUM(fp.TarjetasActivadas) as 'tarjetas activadas' from dwh.Fact_Planes as fp
join dwh.Dim_Tiempo as dt on fp.KeyFechaCorte = dt.KeyTiempo
where fp.TarjetasActivadas is not null
group by dt.Fecha