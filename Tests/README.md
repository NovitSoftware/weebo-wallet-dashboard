Subir un script sql con la prueba del KPI, por ejemplo:

El nombre del script es **WEEBO-10025-TarjetasAdquiridas.sql** cuyo contenido se debe ser el siguiente:

```sql
-- 2.1 Tarjetas Adquiridas: Número total de tarjetas compradas.
-- Gráfica: Sin chart. 
select sum(cant) as 'Total de tarjetas adquiridas' from dbo.adqtarjeta;
```

El script **WEEBO-10025-TarjetasAdquiridas.sql** se debe encontrar dentro de la carpeta **Tests**