-- 6.7 Afiliados Femenino: N�mero total de afiliados femeninos. 
-- Gr�fica: Sin chart. 

select count(a.genero) as 'Total femeninos afiliados' from dwh.Dim_Afiliado as a
where a.genero = 'femenino'