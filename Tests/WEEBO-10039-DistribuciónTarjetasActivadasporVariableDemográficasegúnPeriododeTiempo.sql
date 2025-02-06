-- 3.7 Distribución Tarjetas Activadas por Variable Demográfica según Periodo de Tiempo: Número total de stickers otorgados en periodos de tiempo de días, semanas o meses por variable demográfica.
-- Gráfica: Bar chart. 

select sum(s.totales) as 'sticker otorgados', day(s.fecha) as 'dia', month(s.fecha) as 'mes', year(s.fecha) as 'año' from dbo.sticker as s
group by s.fecha
