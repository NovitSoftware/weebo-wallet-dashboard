-- 3.1 Stickers Otorgados: N�mero total de stickers otorgados.
-- Gr�fica: Sin chart. 

select sum(s.totales) as 'Suma total' from dbo.sticker as s;