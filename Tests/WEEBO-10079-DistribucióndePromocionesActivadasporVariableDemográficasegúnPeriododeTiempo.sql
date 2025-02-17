-- 5.7 Distribuci�n de Promociones Activadas por Variable Demogr�fica seg�n Periodo de Tiempo: N�mero total de promociones activadas en periodos de tiempo de d�as, semanas o meses por variable demogr�fica. 
-- Gr�fica: Bar chart.


select count(fp.FlagPromocionActiva) as 'Total de promociones activas' from dwh.Fact_Promociones as fp
where fp.FlagPromocionActiva = 1;