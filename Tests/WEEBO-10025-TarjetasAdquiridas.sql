-- 2.1 Tarjetas Adquiridas: N�mero total de tarjetas compradas. 
-- Gr�fica: Sin chart. 

SELECT 
    sum(fp.TarjetasAdquiridas) AS TarjetasCompradas
FROM dwh.Fact_Planes as fp