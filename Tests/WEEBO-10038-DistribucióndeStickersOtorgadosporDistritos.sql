-- 3.6 Distribuci�n de Stickers Otorgados por Distritos: N�mero total de stickers otorgados por distrito.
-- Gr�fica: Pie chart.

select sum(s.totales) as 'Sticker otorgados', u.distrito from dbo.usuario as u
inner join dbo.sticker as s on u.idusuario = s.fkusuario
group by u.distrito
order by 'Sticker otorgados' desc
