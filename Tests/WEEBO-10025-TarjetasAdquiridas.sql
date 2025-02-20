-- 2.1 Tarjetas Adquiridas: Número total de tarjetas compradas. 
-- Gráfica: Sin chart. 

SELECT 
    sum(fp.TarjetasAdquiridas) AS TarjetasCompradas
FROM dwh.Fact_Planes as fp