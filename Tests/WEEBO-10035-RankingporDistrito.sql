-- 3.3 Ranking por Distrito: Los 3 primeros distritos que tienen m�s stickers otorgados.
-- Gr�fica: Sin chart.

select top 3 u.distrito, sum(s.totales) 'Totales'
from dbo.sticker as s
inner join dbo.usuario as u on u.idusuario = s.fkusuario
group by u.distrito
order by sum(s.totales) desc;
