-- 3.5 Distribuci�n de Stickers Otorgados por G�nero: N�mero total de stickers otorgado por g�nero.
-- Gr�fica: Pie chart. 

SELECT 
    da.Genero,
    SUM(COALESCE(fc.StickersEntregados, 0)) AS TotalStickersOtorgados
FROM dwh.Fact_Cupon fc
JOIN dwh.Dim_Afiliado da ON fc.KeyAfiliado = da.KeyAfiliado
GROUP BY da.Genero
ORDER BY TotalStickersOtorgados DESC;
