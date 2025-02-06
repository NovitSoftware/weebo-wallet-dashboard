-- 3.5 Distribución de Stickers Otorgados por Género: Número total de stickers otorgado por género.
-- Gráfica: Pie chart. 

select sum(s.totales) as 'Sticker otorgados', u.genero from dbo.usuario as u
inner join dbo.sticker as s on u.idusuario = s.fkusuario
group by u.genero
