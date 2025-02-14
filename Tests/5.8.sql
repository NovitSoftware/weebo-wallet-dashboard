-- 5.8 Distribución de Promociones por Estado: Número total de promociones activadas según estado (activo, vencido). 
-- Gráfica: Pie chart.

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
