-- 7.12 Visitas Promedio por Dia de la Semana y Distribucion Horaria segun Periodo de Tiempo: Visitas promedio por d�a de semana (lunes a domingo) seg�n periodo del dia (ma�ana 6:00 a 12:00, tarde: 12:00 a 18:00 y noche: 18:00 a 24:00) en un periodo de tiempo determinado (d�as, semanas o meses).
-- Gr�fica: Bar chart. 
SELECT 
    t.Fecha,
    DATENAME(WEEKDAY, t.Fecha) AS DiaSemana,
    CASE 
        WHEN DATEPART(HOUR, t.Fecha) BETWEEN 6 AND 11 THEN 'Ma�ana (6:00 - 12:00)'
        WHEN DATEPART(HOUR, t.Fecha) BETWEEN 12 AND 17 THEN 'Tarde (12:00 - 18:00)'
        WHEN DATEPART(HOUR, t.Fecha) BETWEEN 18 AND 23 THEN 'Noche (18:00 - 24:00)'
        ELSE NULL -- Agregar un valor predeterminado si es necesario
    END AS PeriodoDelDia,
    COUNT(ff.KeyFactFacturacion) AS VisitasPromedio
FROM dwh.Fact_Facturacion ff
JOIN dwh.Dim_Tiempo t ON ff.KeyFechaFacturacion = t.KeyTiempo
GROUP BY t.Fecha, DATENAME(WEEKDAY, t.Fecha), 
    CASE 
        WHEN DATEPART(HOUR, t.Fecha) BETWEEN 6 AND 11 THEN 'Ma�ana (6:00 - 12:00)'
        WHEN DATEPART(HOUR, t.Fecha) BETWEEN 12 AND 17 THEN 'Tarde (12:00 - 18:00)'
        WHEN DATEPART(HOUR, t.Fecha) BETWEEN 18 AND 23 THEN 'Noche (18:00 - 24:00)'
        ELSE NULL
    END
HAVING CASE 
            WHEN DATEPART(HOUR, t.Fecha) BETWEEN 6 AND 11 THEN 'Ma�ana (6:00 - 12:00)'
            WHEN DATEPART(HOUR, t.Fecha) BETWEEN 12 AND 17 THEN 'Tarde (12:00 - 18:00)'
            WHEN DATEPART(HOUR, t.Fecha) BETWEEN 18 AND 23 THEN 'Noche (18:00 - 24:00)'
            ELSE NULL 
        END IS NOT NULL
ORDER BY t.Fecha DESC, DiaSemana, PeriodoDelDia;
