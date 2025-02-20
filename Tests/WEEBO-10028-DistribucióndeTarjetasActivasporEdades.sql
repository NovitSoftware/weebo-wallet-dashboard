-- 2.4 Distribución de Tarjetas Activas por Edades: Número total de tarjetas activadas por rango de edades. 
-- Gráfica: Pie chart.  

select rg.RangoEdad, COUNT(distinct fc.KeyTarjeta) as 'Tarjetas Activas' from dwh.Fact_Cupon as fc
join dwh.Dim_Afiliado as da on fc.KeyAfiliado = da.KeyAfiliado
join dwh.Dim_RangoEdad as rg on fc.KeyRangoEdad = rg.KeyRangoEdad
group by rg.RangoEdad