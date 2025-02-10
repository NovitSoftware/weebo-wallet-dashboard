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
BEGIN TRANSACTION TranGeneral; 
GO

--========================================================================================================

ALTER TABLE [dwh].[Dim_Tiempo] ADD PRIMARY KEY ([KeyTiempo]);

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;
GO

ALTER TABLE [dwh].[Fact_Cupon]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Cupon_Dim_Tiempo] FOREIGN KEY([KeyFechaCorte])
REFERENCES [dwh].[Dim_Tiempo] ([KeyTiempo])

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;
GO

ALTER TABLE [dwh].[Fact_Planes]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Planes_Dim_Tiempo] FOREIGN KEY([KeyFechaCorte])
REFERENCES [dwh].[Dim_Tiempo] ([KeyTiempo])

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;
GO

ALTER TABLE [dwh].[Fact_Facturacion]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Facturacion_Dim_Tiempo] FOREIGN KEY([KeyFechaFacturacion])
REFERENCES [dwh].[Dim_Tiempo] ([KeyTiempo])

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;
GO

ALTER TABLE [dwh].[Fact_Promociones]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Promociones_Dim_Tiempo] FOREIGN KEY([KeyFechaCorte])
REFERENCES [dwh].[Dim_Tiempo] ([KeyTiempo])

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;
GO

ALTER TABLE [dwh].[Fact_AfiliacionEmpresa]  WITH CHECK ADD  CONSTRAINT [FK_Fact_AfiliacionEmpresa_Dim_Tiempo] FOREIGN KEY([KeyFechaCorte])
REFERENCES [dwh].[Dim_Tiempo] ([KeyTiempo])

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;
GO

ALTER TABLE [dwh].[Fact_AfiliacionWebo]  WITH CHECK ADD  CONSTRAINT [FK_Fact_AfiliacionWebo_Dim_Tiempo] FOREIGN KEY([KeyFechaCorte])
REFERENCES [dwh].[Dim_Tiempo] ([KeyTiempo])

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;
GO

--========================================================================================================
COMMIT TRANSACTION TranGeneral;  
SET NOEXEC OFF 
SET XACT_ABORT OFF 

GO