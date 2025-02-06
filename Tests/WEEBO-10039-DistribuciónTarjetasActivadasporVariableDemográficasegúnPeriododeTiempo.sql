-- 3.7 Distribuci�n Tarjetas Activadas por Variable Demogr�fica seg�n Periodo de Tiempo: N�mero total de stickers otorgados en periodos de tiempo de d�as, semanas o meses por variable demogr�fica.
-- Gr�fica: Bar chart. 

select sum(s.totales) as 'sticker otorgados', day(s.fecha) as 'dia', month(s.fecha) as 'mes', year(s.fecha) as 'a�o' from dbo.sticker as s
group by s.fecha
