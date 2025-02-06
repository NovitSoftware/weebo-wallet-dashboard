-- 2.2 Tarjetas Activadas: Número total de tarjetas activadas por los clientes (tarjetas que ya se encuentran en uso).
--Gráfica: Sin chart.

select sum(f.TarjetasActivadas) as 'Tarjetas activadas por clientes activos' from dwh.Fact_Planes as f
inner join dwh.Fact_AfiliacionEmpresa as ae on ae.keyEmpresa = f.KeyEmpresa
where ae.FlagActivo = 1
