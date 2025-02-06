-- 3.6 Distribución de Stickers Otorgados por Distritos: Número total de stickers otorgados por distrito.
-- Gráfica: Pie chart.

select sum(s.totales) as 'Sticker otorgados', u.distrito from dbo.usuario as u
inner join dbo.sticker as s on u.idusuario = s.fkusuario
group by u.distrito
order by 'Sticker otorgados' desc
