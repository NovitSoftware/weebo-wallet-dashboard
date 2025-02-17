-- 5.11 Distribución de Promociones Obtenidas por Distritos: Número total de promociones activadas por distrito según su estado (activo, vencido). 
-- Gráfica: Pie chart. 

SELECT 
    a.Distrito,
    CASE 
        WHEN p.FlagPromocionActiva = 1 THEN 'Activo'
        WHEN p.FlagCuponVencido = 1 THEN 'Vencido'
    END AS EstadoPromocion, 
    COUNT(*) AS TotalPromociones
FROM dwh.Fact_Promociones p
JOIN dwh.Dim_Afiliado a ON p.KeyAfiliado = a.KeyAfiliado
WHERE p.FlagPromocionActiva = 1 OR p.FlagCuponVencido = 1
GROUP BY a.Distrito, 
    CASE 
        WHEN p.FlagPromocionActiva = 1 THEN 'Activo'
        WHEN p.FlagCuponVencido = 1 THEN 'Vencido'
    END
ORDER BY a.Distrito, EstadoPromocion;
