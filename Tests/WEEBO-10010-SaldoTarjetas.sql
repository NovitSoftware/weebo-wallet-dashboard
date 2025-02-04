DECLARE @FechaInicio DATE = '2019-04-09'; 
DECLARE @FechaFin DATE = '2024-11-30'; 

WITH PeriodoActual AS (
    SELECT 
        SUM(FP.SaldoTarjetasAdquiridas) AS TotalSaldoActual,
        COUNT(DISTINCT DT.Fecha) AS TotalDias
    FROM 
        [ApployaltyDWH].[dwh].[Fact_Planes] FP
    INNER JOIN 
        [ApployaltyDWH].[dwh].[Dim_Tiempo] DT ON FP.KeyFechaCorte = DT.KeyTiempo
    WHERE 
        DT.Fecha BETWEEN @FechaInicio AND @FechaFin
),
PeriodoAnterior AS (
    SELECT 
        SUM(FP.SaldoTarjetasAdquiridas) AS TotalSaldoAnterior
    FROM 
        [ApployaltyDWH].[dwh].[Fact_Planes] FP
    INNER JOIN 
        [ApployaltyDWH].[dwh].[Dim_Tiempo] DT ON FP.KeyFechaCorte = DT.KeyTiempo
    WHERE 
        DT.Fecha BETWEEN DATEADD(YEAR, -1, @FechaInicio) AND DATEADD(YEAR, -1, @FechaFin)
)
SELECT 
    PA.TotalSaldoActual AS TotalSaldoTarjetas,
   
    (PA.TotalSaldoActual - COALESCE(PA2.TotalSaldoAnterior, 0)) / NULLIF(PA2.TotalSaldoAnterior, 0) AS VariacionSaldo -- Variación frente al periodo anterior
FROM 
    PeriodoActual PA
LEFT JOIN 
    PeriodoAnterior PA2 ON 1 = 1;
SELECT 
    AVG(SaldoTarjetasAdquiridas) AS PromedioSaldoTarjetas
FROM 
    [ApployaltyDWH].[dwh].[Fact_Planes];

