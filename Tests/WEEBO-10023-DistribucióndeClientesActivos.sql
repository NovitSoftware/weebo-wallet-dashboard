-- 1.15 Distribuci�n de Clientes Activos: N�mero total por rango de d�as. De 1 a 90 d�as en periodos semanales.
--Gr�fica: Bar chart.


SELECT 
    dt.Semana AS SemanaNumero,
    COUNT(DISTINCT ae.KeyEmpresa) AS TotalClientes
FROM dwh.Fact_AfiliacionEmpresa ae
JOIN dwh.Dim_Tiempo dt ON ae.FechaActivo = dt.Fecha
WHERE dt.Fecha BETWEEN DATEADD(DAY, -90, GETDATE()) AND GETDATE()
GROUP BY dt.Semana
ORDER BY MIN(dt.Fecha);
