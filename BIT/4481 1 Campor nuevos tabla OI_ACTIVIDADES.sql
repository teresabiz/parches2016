ALTER TABLE dbo.OI_ACTIVIDAD ADD
                ID_ACTIVIDAD_1 char(8) NULL,
                ID_ACTIVIDAD_2 char(8) NULL,
                ID_ACTIVIDAD_3 char(8) NULL
GO

UPDATE       OI_ACTIVIDAD
SET                ID_ACTIVIDAD_1 = ' ', ID_ACTIVIDAD_2 = ' ', ID_ACTIVIDAD_3 = ' '

GO

