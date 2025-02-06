-- 1.15 Distribución de Clientes Activos: Número total por rango de días. De 1 a 90 días en periodos semanales.
--Gráfica: Bar chart.


SELECT 
    dt.Semana AS SemanaNumero,
    COUNT(DISTINCT ae.KeyEmpresa) AS TotalClientes
FROM dwh.Fact_AfiliacionEmpresa ae
JOIN dwh.Dim_Tiempo dt ON ae.FechaActivo = dt.Fecha
WHERE dt.Fecha BETWEEN DATEADD(DAY, -90, GETDATE()) AND GETDATE()
GROUP BY dt.Semana
ORDER BY MIN(dt.Fecha);
