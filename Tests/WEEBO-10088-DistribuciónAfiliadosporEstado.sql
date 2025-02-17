-- 6.8 Distribuci�n Afiliados por Estado: Porcentaje de afiliados seg�n su estado (nuevo, activo, en riesgo). 
-- Gr�fica: Pie chart.  

SELECT 
    CASE 
        WHEN DATEDIFF(DAY, a.FechaUltimoConsumoWebo, GETDATE()) <= 90 THEN 'Activo'
        WHEN DATEDIFF(DAY, a.FechaUltimoConsumoWebo, GETDATE()) BETWEEN 80 AND 90 THEN 'En Riesgo'
        WHEN DATEDIFF(DAY, a.FechaUltimoConsumoWebo, GETDATE()) > 90 THEN 'Perdido'
    END AS EstadoAfiliado,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM dwh.Dim_Afiliado) AS PorcentajeAfiliados
FROM dwh.Dim_Afiliado a
WHERE a.FechaUltimoConsumoWebo IS NOT NULL
GROUP BY 
    CASE 
        WHEN DATEDIFF(DAY, a.FechaUltimoConsumoWebo, GETDATE()) <= 90 THEN 'Activo'
        WHEN DATEDIFF(DAY, a.FechaUltimoConsumoWebo, GETDATE()) BETWEEN 80 AND 90 THEN 'En Riesgo'
        WHEN DATEDIFF(DAY, a.FechaUltimoConsumoWebo, GETDATE()) > 90 THEN 'Perdido'
    END
ORDER BY EstadoAfiliado;
