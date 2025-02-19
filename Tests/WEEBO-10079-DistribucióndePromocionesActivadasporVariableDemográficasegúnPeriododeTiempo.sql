-- 5.7 Distribución de Promociones Activadas por Variable Demográfica según Periodo de Tiempo: Número total de promociones activadas en periodos de tiempo de días, semanas o meses por variable demográfica. 
-- Gráfica: Bar chart.


select dt.Fecha, count(fp.FlagPromocionActiva) as 'Total de promociones activas' 
from dwh.Fact_Promociones as fp
join dwh.Dim_Tiempo as dt on fp.KeyFechaCorte = dt.KeyTiempo
where fp.FlagPromocionActiva = 1
group by dt.Fecha