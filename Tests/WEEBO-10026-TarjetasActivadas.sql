-- 2.2 Tarjetas Activadas: Número total de tarjetas activadas por los clientes (tarjetas que ya se encuentran en uso). 
-- Gráfica: Sin chart. 


select count(distinct fc.KeyTarjeta) as 'Tarjetas activadas por empresa' from dwh.Fact_Cupon as fc
