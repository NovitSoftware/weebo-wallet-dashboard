-- 2.1 Tarjetas Adquiridas: Número total de tarjetas compradas.
-- Gráfica: Sin chart. 

select sum(f.TarjetasAdquiridas) as 'Tarjetas adquiridas' from dwh.Fact_Planes as f
