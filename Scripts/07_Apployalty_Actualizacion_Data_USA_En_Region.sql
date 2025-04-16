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
UPDATE region SET region = 'Alabama', codigoRegion = 'AL', codigoPais = 'US' WHERE idRegion = 1;
UPDATE region SET region = 'Alaska', codigoRegion = 'AK', codigoPais = 'US' WHERE idRegion = 2;
UPDATE region SET region = 'Arizona', codigoRegion = 'AZ', codigoPais = 'US' WHERE idRegion = 3;
UPDATE region SET region = 'Arkansas', codigoRegion = 'AR', codigoPais = 'US' WHERE idRegion = 4;
UPDATE region SET region = 'California', codigoRegion = 'CA', codigoPais = 'US' WHERE idRegion = 5;
UPDATE region SET region = 'Carolina del Norte', codigoRegion = 'NC', codigoPais = 'US' WHERE idRegion = 6;
UPDATE region SET region = 'Carolina del Sur', codigoRegion = 'SC', codigoPais = 'US' WHERE idRegion = 7;
UPDATE region SET region = 'Colorado', codigoRegion = 'CO', codigoPais = 'US' WHERE idRegion = 8;
UPDATE region SET region = 'Connecticut', codigoRegion = 'CT', codigoPais = 'US' WHERE idRegion = 9;
UPDATE region SET region = 'Dakota del Norte', codigoRegion = 'ND', codigoPais = 'US' WHERE idRegion = 10;
UPDATE region SET region = 'Dakota del Sur', codigoRegion = 'SD', codigoPais = 'US' WHERE idRegion = 11;
UPDATE region SET region = 'Delaware', codigoRegion = 'DE', codigoPais = 'US' WHERE idRegion = 12;
UPDATE region SET region = 'Florida', codigoRegion = 'FL', codigoPais = 'US' WHERE idRegion = 13;
UPDATE region SET region = 'Georgia', codigoRegion = 'GA', codigoPais = 'US' WHERE idRegion = 14;
UPDATE region SET region = 'Hawái', codigoRegion = 'HI', codigoPais = 'US' WHERE idRegion = 15;
UPDATE region SET region = 'Idaho', codigoRegion = 'ID', codigoPais = 'US' WHERE idRegion = 16;
UPDATE region SET region = 'Illinois', codigoRegion = 'IL', codigoPais = 'US' WHERE idRegion = 17;
UPDATE region SET region = 'Indiana', codigoRegion = 'IN', codigoPais = 'US' WHERE idRegion = 18;
UPDATE region SET region = 'Iowa', codigoRegion = 'IA', codigoPais = 'US' WHERE idRegion = 19;
UPDATE region SET region = 'Kansas', codigoRegion = 'KS', codigoPais = 'US' WHERE idRegion = 20;
UPDATE region SET region = 'Kentucky', codigoRegion = 'KY', codigoPais = 'US' WHERE idRegion = 21;
UPDATE region SET region = 'Luisiana', codigoRegion = 'LA', codigoPais = 'US' WHERE idRegion = 22;
UPDATE region SET region = 'Maine', codigoRegion = 'ME', codigoPais = 'US' WHERE idRegion = 23;
UPDATE region SET region = 'Maryland', codigoRegion = 'MD', codigoPais = 'US' WHERE idRegion = 24;
UPDATE region SET region = 'Massachusetts', codigoRegion = 'MA', codigoPais = 'US' WHERE idRegion = 25;

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;
GO

insert into Region (region, CodigoRegion, CodigoPais) values
('Michigan', 'MI', 'US'),
('Minnesota', 'MN', 'US'),
('Misisipi', 'MS', 'US'),
('Misuri', 'MO', 'US'),
('Montana', 'MT', 'US'),
('Nebraska', 'NE', 'US'),
('Nevada', 'NV', 'US'),
('Nueva Jersey', 'NJ', 'US'),
('Nueva York', 'NY', 'US'),
('Nuevo Hampshire', 'NH', 'US'),
('Nuevo México', 'NM', 'US'),
('Ohio', 'OH', 'US'),
('Oklahoma', 'OK', 'US'),
('Oregón', 'OR', 'US'),
('Pensilvania', 'PA', 'US'),
('Rhode Island', 'RI', 'US'),
('Tennessee', 'TN', 'US'),
('Texas', 'TX', 'US'),
('Utah', 'UT', 'US'),
('Vermont', 'VT', 'US'),
('Virginia', 'VA', 'US'),
('Virginia Occidental', 'WV', 'US'),
('Washington', 'WA', 'US'),
('Wisconsin', 'WI', 'US'),
('Wyoming', 'WY', 'US');

GO

IF (@@ERROR <> 0)
    SET NOEXEC ON;
GO
--========================================================================================================
COMMIT TRANSACTION GlobalTransaction;  
SET NOEXEC OFF 
SET XACT_ABORT OFF 

GO