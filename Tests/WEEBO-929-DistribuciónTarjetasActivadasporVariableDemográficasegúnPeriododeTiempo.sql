-- 2.7 Distribuci�n Tarjetas Activadas por Variable Demogr�fica seg�n Periodo de Tiempo:
-- N�mero total de tarjetas activadas en periodos de tiempo de d�as, semanas o meses por variable demogr�fica.
-- Gr�fica: Pie chart. 

select dt.Fecha, SUM(fp.TarjetasActivadas) as 'tarjetas activadas' from dwh.Fact_Planes as fp
join dwh.Dim_Tiempo as dt on fp.KeyFechaCorte = dt.KeyTiempo
where fp.TarjetasActivadas is not null
group by dt.Fecha