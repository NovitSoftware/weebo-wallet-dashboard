-- 5.9 Distribuci�n de Promociones Obtenidas por Edades: N�mero total de promociones activadas por rango de edades seg�n su estado (activo, vencido). 
-- Gr�fica: Pie chart.

SELECT 
    r.RangoEdad,
    CASE 
        WHEN p.FlagPromocionActiva = 1 THEN 'Activo'
        WHEN p.FlagCuponVencido = 1 THEN 'Vencido'
    END AS EstadoPromocion, 
    COUNT(*) AS TotalPromociones
FROM dwh.Fact_Promociones p
JOIN dwh.Dim_RangoEdad r ON p.KeyRangoEdad = r.KeyRangoEdad
WHERE p.FlagPromocionActiva = 1 OR p.FlagCuponVencido = 1
GROUP BY r.RangoEdad, 
    CASE 
        WHEN p.FlagPromocionActiva = 1 THEN 'Activo'
        WHEN p.FlagCuponVencido = 1 THEN 'Vencido'
    END
ORDER BY r.RangoEdad, EstadoPromocion;
