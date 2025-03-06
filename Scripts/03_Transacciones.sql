BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT

SET XACT_ABORT ON 
GO
BEGIN TRANSACTION GlobalTransaction; 
GO

GO
--========================================================================================================
-- Cambiamos el tipo date de Dim_Tiempo a datetime
ALTER TABLE [ApployaltyDWH].[dwh].[Dim_Tiempo]
ALTER COLUMN Fecha DATETIME;

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;

GO

-- Aplicamos relacion
ALTER TABLE [ApployaltyDWH].[dwh].[Fact_Facturacion]
ADD CONSTRAINT FK_FactFacturacion_DimAfiliado FOREIGN KEY ([KeyAfiliado]) REFERENCES [ApployaltyDWH].[dwh].[Dim_Afiliado] ([KeyAfiliado]);

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;

GO

-- Aplicamos relacion
ALTER TABLE [ApployaltyDWH].[dwh].[Fact_Facturacion]
ADD CONSTRAINT FK_FactFacturacion_DimRangoEdad FOREIGN KEY ([KeyRangoEdad]) REFERENCES [ApployaltyDWH].[dwh].[Dim_RangoEdad] ([KeyRangoEdad]);

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;

GO

-- Aplicamos relacion
ALTER TABLE [ApployaltyDWH].[dwh].[Fact_Facturacion]
ADD CONSTRAINT FK_FactFacturacion_DimTienda FOREIGN KEY ([KeyTienda]) REFERENCES [ApployaltyDWH].[dwh].[Dim_Tienda] ([KeyTienda]);

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;
GO

-- Aplicamos relacion
ALTER TABLE [ApployaltyDWH].[dwh].[Fact_Facturacion]
ADD CONSTRAINT FK_FactFacturacion_DimEmpresa FOREIGN KEY ([KeyEmpresa]) REFERENCES [ApployaltyDWH].[dwh].[Dim_Empresa] ([KeyEmpresa]);

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;

GO

-- Aplicamos relacion
ALTER TABLE [ApployaltyDWH].[dwh].[Fact_AfiliacionWebo]
ADD CONSTRAINT FK_FactAfiliacionWebo_DimAfiliado FOREIGN KEY ([KeyAfiliado]) REFERENCES [ApployaltyDWH].[dwh].[Dim_Afiliado] ([KeyAfiliado]);

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;

GO

-- Aplicamos relacion
ALTER TABLE [ApployaltyDWH].[dwh].[Fact_AfiliacionWebo]
ADD CONSTRAINT FK_FactAfiliacionWebo_DimRangoEdad FOREIGN KEY ([KeyRangoEdad]) REFERENCES [ApployaltyDWH].[dwh].[Dim_RangoEdad] ([KeyRangoEdad]);

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;

GO

-- Aplicamos relacion
ALTER TABLE [ApployaltyDWH].[dwh].[Fact_AfiliacionEmpresa]
ADD CONSTRAINT FK_FactAfiliacionEmpresa_DimAfiliado FOREIGN KEY ([KeyAfiliado]) REFERENCES [ApployaltyDWH].[dwh].[Dim_Afiliado] ([KeyAfiliado]);

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;

GO

-- Aplicamos relacion
ALTER TABLE [ApployaltyDWH].[dwh].[Fact_AfiliacionEmpresa]
ADD CONSTRAINT FK_FactAfiliacionEmpresa_DimRangoEdad FOREIGN KEY ([KeyRangoEdad]) REFERENCES [ApployaltyDWH].[dwh].[Dim_RangoEdad] ([KeyRangoEdad]);

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;


-- Aplicamos relacion
ALTER TABLE [ApployaltyDWH].[dwh].[Fact_Promociones]
ADD CONSTRAINT FK_FactPromocion_DimAfiliado FOREIGN KEY ([KeyAfiliado]) REFERENCES [ApployaltyDWH].[dwh].[Dim_Afiliado] ([KeyAfiliado]);

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;
GO

-- Aplicamos relacion
ALTER TABLE [ApployaltyDWH].[dwh].[Fact_Promociones]
ADD CONSTRAINT FK_FactPromocion_DimEmpresa FOREIGN KEY ([KeyEmpresa]) REFERENCES [ApployaltyDWH].[dwh].[Dim_Empresa] ([KeyEmpresa]);

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;
GO

-- Aplicamos relacion
ALTER TABLE [ApployaltyDWH].[dwh].[Fact_Promociones]
ADD CONSTRAINT FK_FactPromocion_DimCuponPromocional FOREIGN KEY ([KeyCuponPromocional]) REFERENCES [ApployaltyDWH].[dwh].[Dim_CuponPromocional] ([KeyCuponPromocional]);

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;

GO

-- Aplicamos relacion
ALTER TABLE [ApployaltyDWH].[dwh].[Fact_Promociones]
ADD CONSTRAINT FK_FactPromocion_DimRangoEdad FOREIGN KEY ([KeyRangoEdad]) REFERENCES [ApployaltyDWH].[dwh].[Dim_RangoEdad] ([KeyRangoEdad]);

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;

-- Aplicamos relacion
ALTER TABLE [ApployaltyDWH].[dwh].[Fact_Cupon]
ADD CONSTRAINT FK_FactCupon_DimAfiliado FOREIGN KEY ([KeyAfiliado]) REFERENCES [ApployaltyDWH].[dwh].[Dim_Afiliado] ([KeyAfiliado]);

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;
GO

-- Aplicamos relacion
ALTER TABLE [ApployaltyDWH].[dwh].[Fact_Cupon]
ADD CONSTRAINT FK_FactCupon_DimEmpresa FOREIGN KEY ([KeyEmpresa]) REFERENCES [ApployaltyDWH].[dwh].[Dim_Empresa] ([KeyEmpresa]);

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;
GO

-- Aplicamos relacion
ALTER TABLE [ApployaltyDWH].[dwh].[Fact_Cupon]
ADD CONSTRAINT FK_FactCupon_DimTarjeta FOREIGN KEY ([KeyTarjeta]) REFERENCES [ApployaltyDWH].[dwh].[Dim_Tarjeta] ([KeyTarjeta]);

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;

GO

-- Aplicamos relacion
ALTER TABLE [ApployaltyDWH].[dwh].[Fact_Cupon]
ADD CONSTRAINT FK_FactCupon_DimRangoEdad FOREIGN KEY ([KeyRangoEdad]) REFERENCES [ApployaltyDWH].[dwh].[Dim_RangoEdad] ([KeyRangoEdad]);

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;
GO

-- Aplicamos relacion
ALTER TABLE [ApployaltyDWH].[dwh].[Fact_Cupon]
ADD CONSTRAINT FK_FactCupon_DimCupon FOREIGN KEY ([KeyCupon]) REFERENCES [ApployaltyDWH].[dwh].[Dim_Cupon] ([KeyCupon]);

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;
GO

-- Aplicamos relacion
ALTER TABLE [ApployaltyDWH].[dwh].[Fact_Planes]
ADD CONSTRAINT FK_FactPlan_DimEmpresa FOREIGN KEY ([KeyEmpresa]) REFERENCES [ApployaltyDWH].[dwh].[Dim_Empresa] ([KeyEmpresa]);

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;
GO


--========================================================================================================
COMMIT TRANSACTION GlobalTransaction;  
SET NOEXEC OFF 
SET XACT_ABORT OFF 

GO