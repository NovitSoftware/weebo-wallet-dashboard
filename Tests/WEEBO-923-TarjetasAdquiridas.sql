-- 2.1 Tarjetas Adquiridas: N�mero total de tarjetas compradas.
-- Gr�fica: Sin chart. 

select sum(f.TarjetasAdquiridas) as 'Tarjetas adquiridas' from dwh.Fact_Planes as f
