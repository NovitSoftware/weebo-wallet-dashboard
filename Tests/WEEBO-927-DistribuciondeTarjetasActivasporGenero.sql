-- 2.5 Distribuci�n de Tarjetas Activas por G�nero: N�mero total de tarjetas activadas por g�nero.
-- Gr�fica: Pie chart

select count(t.activo) as 'Cantidad de tarjetas activa', u.genero from dbo.usuario as u
inner join dbo.tarjeta as t on u.idusuario = t.fkusuario
group by u.genero