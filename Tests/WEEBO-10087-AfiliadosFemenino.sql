-- 6.7 Afiliados Femenino: Número total de afiliados femeninos. 
-- Gráfica: Sin chart. 

select count(a.genero) as 'Total femeninos afiliados' from dwh.Dim_Afiliado as a
where a.genero = 'femenino'