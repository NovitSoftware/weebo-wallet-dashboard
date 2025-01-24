-- 2.7 Distribuci�n Tarjetas Activadas por Variable Demogr�fica seg�n Periodo de Tiempo:
-- N�mero total de tarjetas activadas en periodos de tiempo de d�as, semanas o meses por variable demogr�fica.
-- Gr�fica: Pie chart. 

select count(t.activo) as 'Cantidad de tarjetas activa', day(fecnac) as 'dia', month(fecnac) as 'mes', year(fecnac) as 'a�o' from dbo.usuario as u
inner join dbo.tarjeta as t on u.idusuario = t.fkusuario
group by fecnac