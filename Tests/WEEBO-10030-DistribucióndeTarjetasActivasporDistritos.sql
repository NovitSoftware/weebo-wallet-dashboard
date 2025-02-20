-- 2.6 Distribuci�n de Tarjetas Activas por Distritos: N�mero total de tarjetas activadas por distrito. 
-- Gr�fica: Pie chart. 

select top 100 da.Distrito, COUNT(distinct fc.KeyTarjeta) as 'Tarjetas Activas' from dwh.Fact_Cupon as fc
join dwh.Dim_Afiliado as da on fc.KeyAfiliado = da.KeyAfiliado
group by da.Distrito