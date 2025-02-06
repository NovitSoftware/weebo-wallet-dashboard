-- 3.4 Distribución de Stickers Otorgados por Edades: Número total de stickers otorgados por rango de edades.
-- Gráfica: Pie chart. 

SELECT 
    re.RangoEdad,
    SUM(COALESCE(fc.StickersEntregados, 0)) AS TotalStickersOtorgados
FROM dwh.Fact_Cupon fc
JOIN dwh.Dim_RangoEdad re ON fc.KeyRangoEdad = re.KeyRangoEdad
GROUP BY re.RangoEdad
ORDER BY TotalStickersOtorgados DESC;
