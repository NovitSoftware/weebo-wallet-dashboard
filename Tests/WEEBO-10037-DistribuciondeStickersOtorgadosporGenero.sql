-- 3.5 Distribuci�n de Stickers Otorgados por G�nero: N�mero total de stickers otorgado por g�nero.
-- Gr�fica: Pie chart. 

select sum(s.totales) as 'Sticker otorgados', u.genero from dbo.usuario as u
inner join dbo.sticker as s on u.idusuario = s.fkusuario
group by u.genero
