-- 2.6 Distribución de Tarjetas Activas por Distritos: Número total de tarjetas activadas por distrito. 
-- Gráfica: Pie chart. 

select top 100 da.Distrito, COUNT(distinct fc.KeyTarjeta) as 'Tarjetas Activas' from dwh.Fact_Cupon as fc
join dwh.Dim_Afiliado as da on fc.KeyAfiliado = da.KeyAfiliado
group by da.Distrito