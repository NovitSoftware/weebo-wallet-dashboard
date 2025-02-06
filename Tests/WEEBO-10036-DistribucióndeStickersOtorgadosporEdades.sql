-- 3.4 Distribución de Stickers Otorgados por Edades: Número total de stickers otorgados por rango de edades.
-- Gráfica: Pie chart. 

select 
    DATEDIFF(YEAR, fecnac, GETDATE()) - CASE 
        WHEN MONTH(fecnac) > MONTH(GETDATE()) OR (MONTH(fecnac) = MONTH(GETDATE()) AND DAY(fecnac) > DAY(GETDATE())) 
        THEN 1 
        ELSE 0 
    END AS 'edad'
	, sum(s.totales) as 'Distribucion de sticker' from dbo.usuario as u
inner join dbo.sticker as s on u.idusuario = s.fkusuario
group by u.fecnac;