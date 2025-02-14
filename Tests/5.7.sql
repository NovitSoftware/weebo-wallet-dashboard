-- 5.7 Distribución de Promociones Activadas por Variable Demográfica según Periodo de Tiempo: Número total de promociones activadas en periodos de tiempo de días, semanas o meses por variable demográfica. 
-- Gráfica: Bar chart.


select count(fp.FlagPromocionActiva) as 'Total de promociones activas' from dwh.Fact_Promociones as fp
where fp.FlagPromocionActiva = 1;