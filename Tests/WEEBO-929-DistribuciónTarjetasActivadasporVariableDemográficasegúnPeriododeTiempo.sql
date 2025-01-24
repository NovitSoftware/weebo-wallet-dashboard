-- 2.7 Distribución Tarjetas Activadas por Variable Demográfica según Periodo de Tiempo:
-- Número total de tarjetas activadas en periodos de tiempo de días, semanas o meses por variable demográfica.
-- Gráfica: Pie chart. 

select count(t.activo) as 'Cantidad de tarjetas activa', day(fecnac) as 'dia', month(fecnac) as 'mes', year(fecnac) as 'año' from dbo.usuario as u
inner join dbo.tarjeta as t on u.idusuario = t.fkusuario
group by fecnac