-- 2.5 Distribución de Tarjetas Activas por Género: Número total de tarjetas activadas por género. 
-- Gráfica: Pie chart. 

select da.Genero, COUNT(distinct fc.KeyTarjeta) as 'Tarjetas Activas' from dwh.Fact_Cupon as fc
join dwh.Dim_Afiliado as da on fc.KeyAfiliado = da.KeyAfiliado
group by da.Genero