DECLARE @FechaInicio DATETIME = '2019-01-01';  -- Ajusta según sea necesario
DECLARE @FechaFin DATETIME = '2023-12-31';     -- Ajusta según sea necesario

SELECT 
    CAST(COUNT(FAE.KeyFactAfiliacionEmpresa) AS FLOAT) / 
    CAST(COUNT(DISTINCT FAE.KeyAfiliado) AS FLOAT) AS FrecuenciaPromedio
FROM [ApployaltyDWH].[dwh].[Fact_AfiliacionEmpresa] FAE
WHERE FAE.FechaRegistro >= @FechaInicio 
  AND FAE.FechaRegistro <= @FechaFin;
