-- 3.1 Stickers Otorgados: Número total de stickers otorgados.
-- Gráfica: Sin chart. 

SELECT SUM(fp.StickersEntregados) AS TotalStickersOtorgados
FROM dwh.Fact_Planes fp;