-- 3.2 Stickers por Tarjeta: Promedio de stickers otorgados por el total de tarjetas activas.
-- Gr�fica: Sin chart. 

select avg(s.totales) as 'Promedio otorgados por tajetas activas' from dbo.tarjeta as t
inner join dbo.sticker as s on s.fktarjeta = t.codigo
where t.activo = 's';
