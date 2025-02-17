-- 5.8 Distribuci�n de Promociones por Estado: N�mero total de promociones activadas seg�n estado (activo, vencido). 
-- Gr�fica: Pie chart.

SELECT 
    CASE 
        WHEN FlagPromocionActiva = 1 THEN 'Activo'
        WHEN FlagCuponVencido = 1 THEN 'Vencido'
    END AS EstadoPromocion, 
    COUNT(*) AS TotalPromociones
FROM dwh.Fact_Promociones
WHERE FlagPromocionActiva = 1 OR FlagCuponVencido = 1
GROUP BY 
    CASE 
        WHEN FlagPromocionActiva = 1 THEN 'Activo'
        WHEN FlagCuponVencido = 1 THEN 'Vencido'
    END;
