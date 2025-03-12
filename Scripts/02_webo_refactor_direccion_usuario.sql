USE Apployalty
GO

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

--========================================================================================================
-- Agregar el campo ZipCode a la tabla usuario
ALTER TABLE [dbo].[usuario]
ADD [zipcode] [nvarchar](20) NULL;

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;
GO

-- Modificar la tabla usuario para referenciar las nuevas tablas
ALTER TABLE [dbo].[usuario]
ADD [idregion] [int] NULL,
    [idprovincia] [int] NULL,
    [iddistrito] [int] NULL,
    FOREIGN KEY ([idregion]) REFERENCES [dbo].[region]([idregion]),
    FOREIGN KEY ([idprovincia]) REFERENCES [dbo].[provincia]([idprovincia]),
    FOREIGN KEY ([iddistrito]) REFERENCES [dbo].[distrito]([iddistrito]);

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;
GO

-- Actualizar la tabla usuario con las nuevas claves foráneas
UPDATE [dbo].[usuario]
SET idregion = r.idregion
FROM [dbo].[usuario] u
JOIN [dbo].[region] r ON u.region = r.region

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;
GO

UPDATE [dbo].[usuario]
SET idprovincia = p.idprovincia
FROM [dbo].[usuario] u
JOIN [dbo].[provincia] p ON u.provincia = p.provincia

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;
GO

UPDATE [dbo].[usuario]
SET iddistrito = d.iddistrito
FROM [dbo].[usuario] u
JOIN [dbo].[distrito] d ON u.distrito = d.distrito

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;
GO

-- Eliminar las columnas antiguas de la tabla usuario
ALTER TABLE [dbo].[usuario]
DROP COLUMN [region];

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;
GO

ALTER TABLE [dbo].[usuario]
DROP COLUMN [provincia]

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;
GO

ALTER TABLE [dbo].[usuario]
DROP COLUMN [distrito]

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;
GO
--========================================================================================================
COMMIT TRANSACTION GlobalTransaction;  
SET NOEXEC OFF 
SET XACT_ABORT OFF 

GO