-- 2.6 Distribuci�n de Tarjetas Activas por Distritos: N�mero total de tarjetas activadas por distrito.
-- Gr�fica: Pie chart. 

select count(t.activo) as 'Cantidad de tarjetas activa', u.distrito from dbo.usuario as u
inner join dbo.tarjeta as t on u.idusuario = t.fkusuario
group by distrito