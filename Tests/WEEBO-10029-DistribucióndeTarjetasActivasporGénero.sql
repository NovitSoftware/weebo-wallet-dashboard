-- 2.5 Distribuci�n de Tarjetas Activas por G�nero: N�mero total de tarjetas activadas por g�nero. 
-- Gr�fica: Pie chart. 

select da.Genero, COUNT(distinct fc.KeyTarjeta) as 'Tarjetas Activas' from dwh.Fact_Cupon as fc
join dwh.Dim_Afiliado as da on fc.KeyAfiliado = da.KeyAfiliado
group by da.Genero