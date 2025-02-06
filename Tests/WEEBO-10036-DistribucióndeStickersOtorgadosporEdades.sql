-- 3.4 Distribuci�n de Stickers Otorgados por Edades: N�mero total de stickers otorgados por rango de edades.
-- Gr�fica: Pie chart. 

SELECT 
    re.RangoEdad,
    SUM(COALESCE(fc.StickersEntregados, 0)) AS TotalStickersOtorgados
FROM dwh.Fact_Cupon fc
JOIN dwh.Dim_RangoEdad re ON fc.KeyRangoEdad = re.KeyRangoEdad
GROUP BY re.RangoEdad
ORDER BY TotalStickersOtorgados DESC;
