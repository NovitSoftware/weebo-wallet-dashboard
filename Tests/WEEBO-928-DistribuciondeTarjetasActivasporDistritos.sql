-- 2.6 Distribución de Tarjetas Activas por Distritos: Número total de tarjetas activadas por distrito.
-- Gráfica: Pie chart. 

select count(t.activo) as 'Cantidad de tarjetas activa', u.distrito from dbo.usuario as u
inner join dbo.tarjeta as t on u.idusuario = t.fkusuario
group by distrito