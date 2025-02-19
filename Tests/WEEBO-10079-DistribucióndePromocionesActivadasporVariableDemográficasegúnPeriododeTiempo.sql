-- 5.7 Distribuci�n de Promociones Activadas por Variable Demogr�fica seg�n Periodo de Tiempo: N�mero total de promociones activadas en periodos de tiempo de d�as, semanas o meses por variable demogr�fica. 
-- Gr�fica: Bar chart.


select dt.Fecha, count(fp.FlagPromocionActiva) as 'Total de promociones activas' 
from dwh.Fact_Promociones as fp
join dwh.Dim_Tiempo as dt on fp.KeyFechaCorte = dt.KeyTiempo
where fp.FlagPromocionActiva = 1
group by dt.Fecha