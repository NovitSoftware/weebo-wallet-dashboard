-- 3.7 Distribuci�n Tarjetas Activadas por Variable Demogr�fica seg�n Periodo de Tiempo: N�mero total de stickers otorgados en periodos de tiempo de d�as, semanas o meses por variable demogr�fica.
-- Gr�fica: Bar chart. 

SELECT dt.Fecha, SUM(fc.StickersEntregados) AS TotalStickersOtorgados
FROM dwh.Fact_Cupon fc
join dwh.Dim_Tiempo as dt on fc.KeyFechaCorte = dt.KeyTiempo
where fc.StickersEntregados is not null
group by dt.Fecha