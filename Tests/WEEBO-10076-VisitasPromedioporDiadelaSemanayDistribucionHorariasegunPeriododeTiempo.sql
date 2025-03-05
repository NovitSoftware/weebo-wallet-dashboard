SELECT 
    t.Fecha,
    DATENAME(WEEKDAY, t.Fecha) AS DiaSemana,
    CASE 
        WHEN DATEPART(HOUR, t.Fecha) BETWEEN 6 AND 11 THEN 'Mañana (6:00 - 12:00)'
        WHEN DATEPART(HOUR, t.Fecha) BETWEEN 12 AND 17 THEN 'Tarde (12:00 - 18:00)'
        WHEN DATEPART(HOUR, t.Fecha) BETWEEN 18 AND 23 THEN 'Noche (18:00 - 24:00)'
    END AS PeriodoDelDia,
    COUNT(ff.KeyFactFacturacion) AS VisitasPromedio
FROM dwh.Fact_Facturacion ff
JOIN dwh.Dim_Tiempo t ON ff.KeyFechaFacturacion = t.KeyTiempo
GROUP BY t.Fecha, DATENAME(WEEKDAY, t.Fecha), 
    CASE 
        WHEN DATEPART(HOUR, t.Fecha) BETWEEN 6 AND 11 THEN 'Mañana (6:00 - 12:00)'
        WHEN DATEPART(HOUR, t.Fecha) BETWEEN 12 AND 17 THEN 'Tarde (12:00 - 18:00)'
        WHEN DATEPART(HOUR, t.Fecha) BETWEEN 18 AND 23 THEN 'Noche (18:00 - 24:00)'
    END
ORDER BY t.Fecha DESC, DiaSemana, PeriodoDelDia;
