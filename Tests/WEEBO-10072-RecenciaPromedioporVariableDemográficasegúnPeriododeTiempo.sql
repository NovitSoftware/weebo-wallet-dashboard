-- 7.8 Recencia Promedio por Variable Demográfica según Periodo de Tiempo: Recencia promedio por variable demográfica en un periodo de tiempo determinado (días, semanas o meses).
-- Gráfica: Bar chart. 

select a.FechaUltimoConsumoWebo, AVG(a.KeyAfiliado) as recencia from dwh.Dim_Afiliado as a
group by a.FechaUltimoConsumoWebo
