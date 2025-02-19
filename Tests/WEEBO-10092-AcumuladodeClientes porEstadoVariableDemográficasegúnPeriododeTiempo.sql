-- 6.12 Acumulado de Clientes  por Estado, Variable Demogr�fica seg�n Periodo de Tiempo: Total de afiliados seg�n estado (nuevo, activo, en riesgo), variable demogr�fica en un period de tiempo determinado (d�as, semanas o meses). 
-- Gr�fica: Bar chart. 


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