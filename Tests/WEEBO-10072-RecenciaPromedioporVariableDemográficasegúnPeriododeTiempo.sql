-- 7.8 Recencia Promedio por Variable Demogr�fica seg�n Periodo de Tiempo: Recencia promedio por variable demogr�fica en un periodo de tiempo determinado (d�as, semanas o meses).
-- Gr�fica: Bar chart. 

select a.FechaUltimoConsumoWebo, AVG(a.KeyAfiliado) as recencia from dwh.Dim_Afiliado as a
group by a.FechaUltimoConsumoWebo
