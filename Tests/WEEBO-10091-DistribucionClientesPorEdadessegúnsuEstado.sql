-- 6.11 Distribucion Clientes Por Edades según su Estado: Porcentaje de afiliados según rango de edad y estado (nuevo, activo, en riesgo). 
-- Gráfica: Pie chart.  

-- Incompleto
SELECT 
    a.Distrito,
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
    a.Distrito,
    CASE 
        WHEN DATEDIFF(DAY, a.FechaUltimoConsumoWebo, GETDATE()) <= 90 THEN 'Activo'
        WHEN DATEDIFF(DAY, a.FechaUltimoConsumoWebo, GETDATE()) BETWEEN 80 AND 90 THEN 'En Riesgo'
        WHEN DATEDIFF(DAY, a.FechaUltimoConsumoWebo, GETDATE()) > 90 THEN 'Perdido'
        ELSE 'Nuevo'
    END
ORDER BY a.Distrito, EstadoAfiliado;
