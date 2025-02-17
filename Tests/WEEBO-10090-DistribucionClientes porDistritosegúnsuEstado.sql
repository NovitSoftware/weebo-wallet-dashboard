-- 6.9 Distribucion de Afiliados por Género según su Estado: Porcentaje de afiliados según género y estado (nuevo, activo, en riesgo). 
-- Gráfica: Pie chart.

SELECT 
    a.Genero,
    CASE 
        WHEN DATEDIFF(DAY, a.FechaUltimoConsumoWebo, GETDATE()) <= 90 THEN 'Activo'
        WHEN DATEDIFF(DAY, a.FechaUltimoConsumoWebo, GETDATE()) BETWEEN 80 AND 90 THEN 'En Riesgo'
        WHEN DATEDIFF(DAY, a.FechaUltimoConsumoWebo, GETDATE()) > 90 THEN 'Perdido'
        ELSE 'Nuevo'
    END AS EstadoAfiliado,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM dwh.Dim_Afiliado) AS PorcentajeAfiliados
FROM dwh.Dim_Afiliado a
WHERE a.FechaUltimoConsumoWebo IS NOT NULL
GROUP BY 
    a.Genero,
    CASE 
        WHEN DATEDIFF(DAY, a.FechaUltimoConsumoWebo, GETDATE()) <= 90 THEN 'Activo'
        WHEN DATEDIFF(DAY, a.FechaUltimoConsumoWebo, GETDATE()) BETWEEN 80 AND 90 THEN 'En Riesgo'
        WHEN DATEDIFF(DAY, a.FechaUltimoConsumoWebo, GETDATE()) > 90 THEN 'Perdido'
        ELSE 'Nuevo'
    END
ORDER BY a.Genero, EstadoAfiliado;
