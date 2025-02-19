-- 6.12 Acumulado de Clientes  por Estado, Variable Demográfica según Periodo de Tiempo: Total de afiliados según estado (nuevo, activo, en riesgo), variable demográfica en un period de tiempo determinado (días, semanas o meses). 
-- Gráfica: Bar chart. 


SELECT
    CASE 
        WHEN DATEDIFF(DAY, a.FechaUltimoConsumoWebo, GETDATE()) <= 90 THEN 'Activo'
        WHEN DATEDIFF(DAY, a.FechaUltimoConsumoWebo, GETDATE()) BETWEEN 80 AND 90 THEN 'En Riesgo'
        WHEN DATEDIFF(DAY, a.FechaUltimoConsumoWebo, GETDATE()) > 90 THEN 'Perdido'
    END AS EstadoAfiliado,
    COUNT(*) AS Total,
	a.FechaUltimoConsumoWebo
FROM dwh.Dim_Afiliado a
WHERE a.FechaUltimoConsumoWebo IS NOT NULL
GROUP BY 
    CASE 
        WHEN DATEDIFF(DAY, a.FechaUltimoConsumoWebo, GETDATE()) <= 90 THEN 'Activo'
        WHEN DATEDIFF(DAY, a.FechaUltimoConsumoWebo, GETDATE()) BETWEEN 80 AND 90 THEN 'En Riesgo'
        WHEN DATEDIFF(DAY, a.FechaUltimoConsumoWebo, GETDATE()) > 90 THEN 'Perdido'
    END,
	a.FechaUltimoConsumoWebo
ORDER BY EstadoAfiliado;