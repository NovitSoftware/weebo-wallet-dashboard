-- 3.1 Stickers Otorgados: N�mero total de stickers otorgados.
-- Gr�fica: Sin chart. 

SELECT SUM(fp.StickersEntregados) AS TotalStickersOtorgados
FROM dwh.Fact_Planes fp;