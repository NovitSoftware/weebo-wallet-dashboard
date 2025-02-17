-- 5.10 Distribuci�n de Promociones Obtenidas por G�nero: N�mero total de promociones activadas por g�nero seg�n su estado (activo, vencido). 
-- Gr�fica: Pie chart.


SELECT 
    a.Genero,
    CASE 
        WHEN p.FlagPromocionActiva = 1 THEN 'Activo'
        WHEN p.FlagCuponVencido = 1 THEN 'Vencido'
    END AS EstadoPromocion, 
    COUNT(*) AS TotalPromociones
FROM dwh.Fact_Promociones p
JOIN dwh.Dim_Afiliado a ON p.KeyAfiliado = a.KeyAfiliado
WHERE p.FlagPromocionActiva = 1 OR p.FlagCuponVencido = 1
GROUP BY a.Genero, 
    CASE 
        WHEN p.FlagPromocionActiva = 1 THEN 'Activo'
        WHEN p.FlagCuponVencido = 1 THEN 'Vencido'
    END
ORDER BY a.Genero, EstadoPromocion;
