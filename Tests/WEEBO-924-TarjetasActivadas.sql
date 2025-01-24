-- 2.2 Tarjetas Activadas: Número total de tarjetas activadas por los clientes (tarjetas que ya se encuentran en uso).
-- Gráfica: Sin chart. 
select count(t.activo) as 'tarjetas activas' from dbo.usuario as u
inner join dbo.tarjeta t on u.idusuario = t.fkusuario
where t.activo = 's';