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
ALTER TABLE Region ADD CodigoRegion varchar(3)
GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;
GO

ALTER TABLE Region ADD CodigoPais varchar(4)
GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;
GO
--========================================================================================================
COMMIT TRANSACTION GlobalTransaction;  
SET NOEXEC OFF 
SET XACT_ABORT OFF 

GO