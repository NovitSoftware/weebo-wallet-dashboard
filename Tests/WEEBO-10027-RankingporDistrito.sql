-- 2.3 Ranking por Distrito: Los 3 primeros distritos que tiene más trajetas activadas. 
-- Gráfica: Sin chart.  

select da.Distrito, COUNT(distinct fc.KeyTarjeta) as 'Tarjetas Activas' from dwh.Fact_Cupon as fc
join dwh.Dim_Afiliado as da on fc.KeyAfiliado = da.KeyAfiliado
group by da.Distrito
order by 'Tarjetas Activas' desc