-- 3.1 Stickers Otorgados: Número total de stickers otorgados.
-- Gráfica: Sin chart. 

select sum(s.totales) as 'Suma total' from dbo.sticker as s;