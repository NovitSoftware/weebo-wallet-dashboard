-- 2.5 Distribución de Tarjetas Activas por Género: Número total de tarjetas activadas por género.
-- Gráfica: Pie chart

select count(t.activo) as 'Cantidad de tarjetas activa', u.genero from dbo.usuario as u
inner join dbo.tarjeta as t on u.idusuario = t.fkusuario
group by u.genero