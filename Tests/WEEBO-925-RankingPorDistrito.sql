-- 2.3 Ranking por Distrito: Los 3 primeros distritos que tiene más trajetas activadas.
-- Gráfica: Sin chart.
select top 3 u.distrito, count(t.activo) as 'cantidad de tarjetas activo'
from dbo.usuario u
inner join dbo.tarjeta t on u.idusuario = t.fkusuario
where t.activo = 's'
group by u.distrito 
order by 'cantidad activo' desc;