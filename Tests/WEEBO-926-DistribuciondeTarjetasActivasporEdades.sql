--2.4 Distribuci�n de Tarjetas Activas por Edades: N�mero total de tarjetas activadas por rango de edades.
--Gr�fica: Pie chart. 

select 
    DATEDIFF(YEAR, fecnac, GETDATE()) - CASE 
        WHEN MONTH(fecnac) > MONTH(GETDATE()) OR (MONTH(fecnac) = MONTH(GETDATE()) AND DAY(fecnac) > DAY(GETDATE())) 
        THEN 1 
        ELSE 0 
    END AS 'edad'
	, count(t.activo) as 'Cantidad de tarjetas activas' from dbo.usuario as u
inner join dbo.tarjeta as t on u.idusuario = t.fkusuario
group by u.fecnac;